"""Bounded-context memory and global consolidation for the L2 long-document study.

Design: docs/T2M-Long-Document-Experiment-Plan.md §20. All conditions share one extractor prompt
(:data:`t2m_eval.long_memory.MEM_PROMPT`); they differ only in the memory block given with each
chunk and in the deterministic post-processing of the external fact ledger.

Memory selectors (all cut to the same token budget):
  summary   rolling natural-language summary (written by the model, hard-cut to the budget)
  graph     entity registry rows + earlier facts that name an element mentioned in the chunk (= L1 C4)
  ledger    open producer ends whose item the chunk may refer to (head-noun match, also for
            shortened references), then registry rows, then the graph rows

Consolidation (no model calls):
  resolve   canonicalize names with the registry built from every chunk's declared aliases
  join      complete one-ended flows when exactly one producer of the item is known, matching the
            item by exact name (``join_exact``) or by head noun plus a modifier (``join_head``)
"""

from __future__ import annotations

import re

from .long_memory import Registry, fact_rows, fit, registry_rows
from .normalize import norm_text

STOP = {"the", "a", "an", "of", "and", "or", "to", "for", "with", "in", "on", "by", "at", "from", "its", "their", "this",
        "that", "these", "those", "each", "every", "any", "all", "new", "current", "updated", "latest", "data"}
CONSUME = ("receiv", "use", "utiliz", "process", "ingest", "consum", "analy", "review", "read", "accept", "obtain", "get",
           "consult", "check", "appl", "rel", "refer", "act", "evaluat", "inspect", "verif", "reconcil", "incorporat")


MISSING = {"null", "none", "unknown", "n/a", "na", "unspecified", "not specified", "not stated"}


def clean(facts: list[dict]) -> list[dict]:
    """Placeholder strings for an unstated element ("null", "unknown") become missing values."""
    out = []
    for f in facts:
        g = {k: (None if isinstance(v, str) and v.strip().lower() in MISSING else v) for k, v in f.items()}
        if isinstance(g.get("parts"), list):
            g["parts"] = [x for x in g["parts"] if not (isinstance(x, str) and x.strip().lower() in MISSING)]
        out.append(g)
    return out


def words(text) -> list[str]:
    return [w for w in norm_text(text).split() if w not in STOP]


def head_match(item: str, text: str) -> int:
    """How strongly ``text`` may refer to ``item``: 3 = full name contained, 2 = head noun plus at least one
    other content word of the item, 0 = no evidence. One-word items need the exact word."""
    iw, tw = words(item), words(text)
    if not iw or not tw:
        return 0
    if f" {' '.join(norm_text(item).split())} " in f" {norm_text(text)} ":
        return 3
    if len(iw) >= 2 and iw[-1] in tw and len(set(iw[:-1]) & set(tw)) >= 1:
        return 2
    return 0


PRODUCE = ("produc", "generat", "send", "issu", "creat", "prepar", "publish", "compil", "emit", "transmit", "forward",
           "post", "deliver", "provid", "report", "writ", "draft", "submit", "broadcast", "output", "distribut", "return",
           "fil", "log", "rais", "push", "upload", "export", "dispatch", "relay", "share", "notif")


BOUNDARY = {"to", "for", "when", "if", "with", "from", "into", "after", "before", "so", "that", "which", "in", "on", "at",
            "by", "as", "during", "while", "until", "once", "whenever", "because", "and", "or", "via", "through", "under"}


def verb_object(label: str):
    """('produce' | 'consume' | None, object phrase in its original casing) of an action label, by its
    first non-adverb word; the object ends at the first clause or adjunct boundary."""
    toks = [t for t in (re.sub(r"[^\w'-]", "", w) for w in str(label).split()) if t]
    while toks and toks[0].lower().endswith("ly") and len(toks) > 1:
        toks = toks[1:]
    if not toks:
        return None, ""
    v, rest = toks[0].lower(), toks[1:]
    for i, w in enumerate(rest):
        if i and w.lower() in BOUNDARY:
            rest = rest[:i]
            break
    obj = " ".join(rest)
    if v.startswith(PRODUCE):
        return "produce", obj
    if v.startswith(CONSUME):
        return "consume", obj
    return None, obj


def named(surface: str) -> bool:
    """A named item: at least two content words, each capitalized (or a number/acronym), e.g.
    'Unit Staging Change Card'; generic descriptions ('priority changes') are not named."""
    ws = [w for w in re.findall(r"[A-Za-z0-9][\w'-]*", surface or "") if w.lower() not in STOP]
    return len(ws) >= 2 and all(w[0].isupper() or w[0].isdigit() for w in ws)


def producer_index(facts: list[dict]) -> dict[str, dict[str, list[str]]]:
    """item surface -> producer -> evidence unit ids. Producers are flows with source and payload, and
    actions whose verb produces/sends something named by at least two content words."""
    idx: dict[str, dict[str, list[str]]] = {}
    for f in facts:
        if f.get("type") == "flow" and f.get("source") and f.get("payload"):
            idx.setdefault(f["payload"], {}).setdefault(f["source"], []).append(f.get("unit_id"))
        elif f.get("type") == "action" and f.get("performer") and f.get("label"):
            kind, obj = verb_object(f["label"])
            if kind == "produce" and len(words(obj)) >= 2:
                idx.setdefault(obj, {}).setdefault(f["performer"], []).append(f.get("unit_id"))
    return idx


def _consumer_sides(f: dict):
    """(consumer, text that names the item) for a consumer-side fact, else None."""
    if f.get("type") == "flow" and f.get("target") and f.get("payload") and not f.get("source"):
        return f["target"], f["payload"]
    if f.get("type") == "action" and f.get("performer") and f.get("label"):
        kind, obj = verb_object(f["label"])
        if kind == "consume":
            return f["performer"], obj
    return None


def join(facts: list[dict], mode: str = "head") -> tuple[list[dict], list[dict]]:
    """Complete one-ended flows across the document.

    A consumer-side fact (flow without source, or an action whose verb receives/uses something) is
    matched against every known produced item. ``exact`` requires the item's full name; ``head``
    also accepts a shortened reference (head noun + modifier); ``named`` is ``head`` restricted to
    named items (capitalized multi-word names such as documents and messages), so generic
    descriptions never establish identity across chunks. The best-scoring item must be unique
    and must have exactly one producer other than the consumer; otherwise nothing is committed and
    the case is recorded as held. Returns (facts + joined flows, held cases)."""
    idx = producer_index(facts)
    have = {(norm_text(f.get("source")), norm_text(f.get("target")), norm_text(f.get("payload")))
            for f in facts if f.get("type") == "flow"}
    joined, held = [], []
    for f in facts:
        side = _consumer_sides(f)
        if not side:
            continue
        consumer, text = side
        scores = {}
        for item in idx:
            if mode == "named" and not named(item):
                continue
            s = head_match(item, text)
            if mode == "exact" and s < 3:
                s = 0
            if f.get("type") == "flow" and s == 0 and norm_text(item) == norm_text(text):
                s = 3
            if s:
                scores[item] = s
        # a one-word item ("arrival") is too generic to join unless both ends name it identically as a flow payload
        scores = {i: sc for i, sc in scores.items()
                  if len(words(i)) >= 2 or (f.get("type") == "flow" and norm_text(i) == norm_text(text))}
        if not scores:
            continue
        best = max(scores.values())
        items = {norm_text(i) for i, s in scores.items() if s == best}
        if len(items) != 1:
            held.append({"unit_id": f.get("unit_id"), "consumer": consumer, "reason": "ambiguous item", "items": sorted(items)})
            continue
        item = next(i for i, s in scores.items() if s == best)
        producers = {}
        for i, s in scores.items():
            if norm_text(i) == norm_text(item):
                for p, units in idx[i].items():
                    if norm_text(p) != norm_text(consumer):
                        producers.setdefault(p, []).extend(units)
        if len(producers) != 1:
            if producers:
                held.append({"unit_id": f.get("unit_id"), "consumer": consumer, "reason": "several producers",
                             "items": [item], "producers": sorted(producers)})
            continue
        source, units = next(iter(producers.items()))
        key = (norm_text(source), norm_text(consumer), norm_text(item))
        if key in have:
            continue
        have.add(key)
        joined.append({"unit_id": f.get("unit_id"), "type": "flow", "source": source, "target": consumer, "payload": item,
                       "joined": True, "match": best, "evidence_units": list(dict.fromkeys([*units, f.get("unit_id")]))})
    return facts + joined, held


# ---------------------------------------------------------------- memory


def open_end_rows(facts: list[dict], chunk_text: str) -> list[str]:
    """Earlier producer-side flows whose item the chunk may mention (also by a shortened name),
    strongest match first, then most recent; one row per item."""
    seen, scored = set(), []
    for i, f in enumerate(facts):
        if f.get("type") == "flow" and f.get("source") and f.get("payload"):
            s = head_match(f["payload"], chunk_text)
            k = norm_text(f["payload"])
            if s and k not in seen:
                seen.add(k)
                scored.append((-s, -i, f"- {f['source']} produces/sends '{f['payload']}' @{f.get('unit_id')}"))
    return [line for *_, line in sorted(scored)]


def select(kind: str, reg: Registry, facts: list[dict], chunk: list[dict], budget: int, ntok, summary: str = "") -> str:
    text = " ".join(u["text"] for u in chunk)
    chunk_norm = norm_text(text)
    if kind == "summary":
        return fit_text(summary, budget, ntok)
    reg_rows = registry_rows(reg, chunk_norm)
    rows = fact_rows(reg, facts, chunk_norm)
    if kind == "graph":  # headers only with rows: an empty memory block is no memory block
        lines = (["Elements:", *reg_rows] if reg_rows else []) + (["Earlier facts:", *rows] if rows else [])
        return fit(lines, budget, ntok)
    if kind == "ledger":
        opens = open_end_rows(facts, text)
        lines = []
        if opens:
            lines += ["Items produced earlier (the chunk may refer to them by a shorter name):", *opens]
        if reg_rows:
            lines += ["Elements:", *reg_rows]
        shown = set(opens)
        rest = [r for r in rows if r not in shown]
        if rest:
            lines += ["Earlier facts:", *rest]
        return fit(lines, budget, ntok)
    raise ValueError(kind)


def fit_text(text: str, budget: int, ntok) -> str:
    """Hard cut of free text to a token budget at a word boundary."""
    if ntok(text) <= budget:
        return text
    ws = text.split()
    lo, hi = 0, len(ws)
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if ntok(" ".join(ws[:mid])) <= budget:
            lo = mid
        else:
            hi = mid - 1
    return " ".join(ws[:lo])


