"""External semantic memory for long-document extraction (plan §2 C3/C4, §7 K2–K4).

Every condition uses the same extractor prompt and output schema (``MEM_PROMPT``/``MEM_SCHEMA``):
facts as in :mod:`t2m_eval.long_doc` plus ``entities`` (names with explicitly declared aliases).
Only the memory block differs:

  F / C1   no memory block
  C3       entity registry rows relevant to the chunk
  C4       C3 rows + earlier facts that mention an element or item named in the chunk

Memory is selected deterministically (normalized string match against the chunk) and cut to a
token budget, so the retriever is fixed and identical across models.
"""

from __future__ import annotations

from dataclasses import dataclass, field

from .long_doc import L1_PROMPT, L1_SCHEMA, flatten
from .normalize import norm_text

ENTITY_KEYS = ("performer", "owner", "subject", "whole", "source", "target", "to", "payload", "from", "before", "after")

_ENTITIES_RULE = ("Also list under \"entities\" every system element, actor or item named in the document units, with "
                  "its full name and any alias the text explicitly declares for it (e.g. 'hereafter X', 'known as X', "
                  "'called X'); aliases [] if none.")
_MEMORY_HEADER = "Document units:"
# L1_PROMPT is a str.format template (braces escaped); {memory} becomes a second format field.
MEM_PROMPT = L1_PROMPT.replace(' Return JSON {{"facts": [...]}}.', " " + _ENTITIES_RULE + ' Return JSON {{"entities": [...], "facts": [...]}}.')
assert MEM_PROMPT != L1_PROMPT, "L1 prompt tail changed"
MEM_PROMPT = MEM_PROMPT.replace(_MEMORY_HEADER, "{memory}" + _MEMORY_HEADER)
MEM_SCHEMA = {
    "type": "object",
    "properties": {
        "entities": {"type": "array", "items": {
            "type": "object",
            "properties": {"name": {"type": "string"}, "aliases": {"type": "array", "items": {"type": "string"}}},
            "required": ["name", "aliases"], "additionalProperties": False}},
        "facts": L1_SCHEMA["properties"]["facts"],
    },
    "required": ["entities", "facts"], "additionalProperties": False,
}
MEMORY_INTRO = ("Memory from EARLIER parts of the document (do not extract facts from it; use it only to resolve names, "
                "aliases and who produces an item):\n")


def mem_prompt(units: list[dict], memory: str = "") -> str:
    block = f"{MEMORY_INTRO}{memory}\n\n" if memory else ""
    return MEM_PROMPT.format(memory=block, units="\n".join(f"{u['unit_id']}: {u['text']}" for u in units))


@dataclass
class Registry:
    """Canonical name per element; aliases merge into the first-seen canonical name."""

    canon: dict[str, str] = field(default_factory=dict)      # norm key -> canonical surface
    aliases: dict[str, list[str]] = field(default_factory=dict)  # canonical -> alias surfaces
    first: dict[str, str] = field(default_factory=dict)      # canonical -> first unit id

    def resolve(self, name):
        if not isinstance(name, str):
            return name
        return self.canon.get(norm_text(name), name)

    def update(self, entities: list[dict], unit_id: str | None = None) -> None:
        for e in entities:
            name = (e.get("name") or "").strip()
            if not name:
                continue
            canonical = self.canon.get(norm_text(name))
            if canonical is None:  # a declared alias may already be known: adopt its canonical
                canonical = next((self.canon[norm_text(a)] for a in e.get("aliases", []) if norm_text(a) in self.canon), name)
            self.canon.setdefault(norm_text(name), canonical)
            self.first.setdefault(canonical, unit_id)
            for a in e.get("aliases", []):
                if a and norm_text(a) not in self.canon:
                    self.canon[norm_text(a)] = canonical
                    self.aliases.setdefault(canonical, []).append(a)

    def keys(self, canonical: str) -> list[str]:
        return [canonical, *self.aliases.get(canonical, [])]


def _mentions(text_norm: str, surface: str) -> bool:
    k = norm_text(surface)
    return len(k) >= 3 and f" {k} " in f" {text_norm} "


def registry_rows(reg: Registry, chunk_norm: str) -> list[str]:
    rows = []
    for canonical in dict.fromkeys(reg.canon.values()):
        if any(_mentions(chunk_norm, s) for s in reg.keys(canonical)):
            al = reg.aliases.get(canonical)
            rows.append(f"- {canonical}" + (f" (alias: {', '.join(al)})" if al else "") + f" [first {reg.first.get(canonical)}]")
    return rows


def fact_line(f: dict) -> str:
    slots = ", ".join(f"{k}={v}" for k, v in f.items() if k not in ("unit_id", "type") and v not in (None, "", []))
    return f"- {f['type']}({slots}) @{f.get('unit_id')}"


def fact_rows(reg: Registry, facts: list[dict], chunk_norm: str) -> list[str]:
    """Earlier facts mentioning (by canonical name or alias) an element or item named in the chunk,
    most matches first, then most recent."""
    scored = []
    for i, f in enumerate(facts):
        vals = [f.get(k) for k in ENTITY_KEYS] + list(f.get("parts") or [])
        hits = sum(any(_mentions(chunk_norm, s) for s in reg.keys(reg.resolve(v))) for v in vals if isinstance(v, str))
        if hits:
            scored.append((-hits, -i, fact_line(f)))
    return [line for *_, line in sorted(scored)]


def fit(lines: list[str], budget: int, ntok) -> str:
    out, used = [], 0
    for line in lines:
        t = ntok(line + "\n")
        if used + t > budget:
            break
        out.append(line)
        used += t
    return "\n".join(out)


def select_memory(kind: str, reg: Registry, facts: list[dict], chunk: list[dict], budget: int, ntok) -> str:
    chunk_norm = norm_text(" ".join(u["text"] for u in chunk))
    lines = registry_rows(reg, chunk_norm)
    if kind == "C4":
        lines = ["Elements:", *lines, "Earlier facts:", *fact_rows(reg, facts, chunk_norm)] if lines else \
                ["Earlier facts:", *fact_rows(reg, facts, chunk_norm)]
    return fit(lines, budget, ntok)


def resolve_facts(reg: Registry, facts: list[dict]) -> list[dict]:
    out = []
    for f in facts:
        g = dict(f)
        for k in ENTITY_KEYS:
            if isinstance(g.get(k), str):
                g[k] = reg.resolve(g[k])
        if g.get("parts"):
            g["parts"] = [reg.resolve(p) for p in g["parts"]]
        out.append(g)
    return out


def parse(payload: dict) -> tuple[list[dict], list[dict]]:
    return payload.get("entities", []), flatten(payload)


_CONSUME = ("receiv", "use", "utiliz", "process", "ingest", "consum", "analy", "review", "read", "accept", "obtain", "get")


def reconcile_flows(facts: list[dict]) -> tuple[list[dict], int]:
    """Stage-2 deterministic reconciliation (plan K6): complete one-ended flows across the document.

    producer side: flow with source and payload but no target
    consumer side: flow with target and payload but no source, or an action whose performer
                   consumes (receives/uses/processes ...) an item named in its label
    A consumer-side fact is completed only when exactly one producer of that item is known.
    Returns (facts + joined flows, number of joined flows).
    """
    producers: dict[str, set[str]] = {}
    provenance: dict[tuple[str, str], list[str]] = {}
    for f in facts:
        if f.get("type") == "flow" and f.get("source") and f.get("payload"):
            producers.setdefault(norm_text(f["payload"]), set()).add(f["source"])
            if f.get("unit_id"):
                provenance.setdefault((norm_text(f["payload"]), f["source"]), []).append(f["unit_id"])
    joined = []
    for f in facts:
        cands = []
        if f.get("type") == "flow" and f.get("target") and f.get("payload") and not f.get("source"):
            cands = [(norm_text(f["payload"]), f["target"], f["payload"])]
        elif f.get("type") == "action" and f.get("performer") and f.get("label"):
            label = norm_text(f["label"])
            if any(v in label for v in _CONSUME):
                cands = [(k, f["performer"], k) for k in producers if len(k) >= 6 and k in label]
        for key, consumer, payload in cands:
            srcs = producers.get(key, set()) - {consumer}
            if len(srcs) == 1:
                source = next(iter(srcs))
                joined.append({"unit_id": f.get("unit_id"), "type": "flow", "source": next(iter(srcs)),
                               "target": consumer, "payload": payload, "joined": True,
                               "evidence_units": list(dict.fromkeys([
                                   *provenance.get((key, source), []), f.get("unit_id")]))})
    return facts + joined, len(joined)
