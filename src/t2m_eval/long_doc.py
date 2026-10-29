"""Long-document (L1) experiment: extraction prompt, chunking and long-range probe scoring.

Spec: docs/T2M-Long-Document-Experiment-Plan.md.

Probe types (probe GT written by build_l1_corpus.py):
  split_flow  producer emits an item in one sentence (consumer unnamed); far away another sentence
              says the consumer receives/uses the item (producer unnamed). Expected: one flow
              producer -> consumer carrying the item, emitted at either sentence.
  alias_ref   an entity is introduced with an explicit alias; far away a sentence mentions it only by
              the alias. Expected: a fact at that sentence whose entity slot is the CANONICAL name.
  homonym     two distinct entities whose names differ only by a qualifier. Expected: the sentence's
              fact names the right one; naming the other one (or the unqualified shared head) is a
              forbidden merge.

Entity alignment for probes is canonical-only: writing the alias string counts as an unresolved
identity (the SysML model would get two parts for one thing).
"""

from __future__ import annotations

from .adapters import STRUCTURED_PROMPT, STRUCTURED_RULES_V3
from .dc_gt import TYPES
from .normalize import norm_text

# The short-document rule "every slot value must be written in THAT sentence" forbids exactly the
# long-range resolution this experiment measures, so L1 replaces it (same for every condition).
_LOCAL_RULE = STRUCTURED_RULES_V3.split("\n")[2]
assert _LOCAL_RULE.startswith("- Every slot value must be written in THAT sentence"), _LOCAL_RULE
L1_RESOLUTION_RULE = (
    "- Resolve every entity-valued slot using all the text you are given. If a sentence refers to an element by an "
    "alias, abbreviation, pronoun or shorter description, write the element's full name as first introduced. If a "
    "sentence says an element receives or uses an item and the text you are given states which element produces or "
    "sends that item, emit a flow from that producer to the receiver. If an element cannot be determined from the "
    "text you are given, use null; never guess.")
_AS_WRITTEN = "- Use each element's name as written. Do not merge differently named things unless the text says they are the same."
assert _AS_WRITTEN in STRUCTURED_RULES_V3
# "as written" made models keep alias surfaces (pilot v0: gemini-2.5-pro left 50% of aliases unresolved with the whole document)
L1_RULES = STRUCTURED_RULES_V3.replace(_LOCAL_RULE, L1_RESOLUTION_RULE).replace(
    _AS_WRITTEN, "- Do not merge differently named things unless the text says they are the same.")
# Compact output: the short-document schema repeats every slot key (null when unused), about 130
# tokens per fact; a 5K-token document then needs ~84K output tokens, above Gemini's 65,536 limit.
# L1 lists only filled slots as {slot, value} pairs (strict-schema compatible), for every condition.
_FULL_KEYS = "Every fact object must contain ALL slot keys; set unused slots to null."
_COMPACT_KEYS = ("Give only the slots that have a value, as a list of {slot, value} pairs; for composition give one "
                 "'parts' pair per part.")
assert _FULL_KEYS in STRUCTURED_PROMPT
L1_PROMPT = STRUCTURED_PROMPT.replace(_FULL_KEYS, _COMPACT_KEYS.replace("{", "{{").replace("}", "}}")).replace(
    "Use the element names as written in the document.",
    "Name each element by its full name as first introduced in the document." + L1_RULES.replace("{", "{{").replace("}", "}}"))
_SLOTS = sorted({s for slots in TYPES.values() for s in slots})
L1_SCHEMA = {
    "type": "object",
    "properties": {"facts": {"type": "array", "items": {
        "type": "object",
        "properties": {
            "unit_id": {"type": "string"},
            "type": {"type": "string", "enum": sorted(t for t in TYPES if t not in ("part", "item"))},
            "slots": {"type": "array", "items": {
                "type": "object",
                "properties": {"slot": {"type": "string", "enum": _SLOTS}, "value": {"type": "string"}},
                "required": ["slot", "value"], "additionalProperties": False}},
        },
        "required": ["unit_id", "type", "slots"], "additionalProperties": False}}},
    "required": ["facts"], "additionalProperties": False,
}


def l1_prompt(units: list[dict]) -> str:
    return L1_PROMPT.format(units="\n".join(f"{u['unit_id']}: {u['text']}" for u in units))


def flatten(payload: dict) -> list[dict]:
    """Compact L1 facts -> flat dicts (unit_id, type, slot keys; parts as a list)."""
    out = []
    for f in payload.get("facts", []):
        flat = {"unit_id": f.get("unit_id"), "type": f.get("type")}
        for pair in f.get("slots", []):
            if pair["slot"] == "parts":
                flat.setdefault("parts", []).append(pair["value"])
            else:
                flat.setdefault(pair["slot"], pair["value"])
        out.append(flat)
    return out


def unit_line(u: dict) -> str:
    return f"{u['unit_id']}: {u['text']}\n"


def chunk_units(units: list[dict], budget: int, ntok) -> list[list[dict]]:
    """Consecutive sentence-bounded chunks of at most ``budget`` document tokens (no overlap)."""
    out, cur, size = [], [], 0
    for u in units:
        t = ntok(unit_line(u))
        if cur and size + t > budget:
            out.append(cur)
            cur, size = [], 0
        cur.append(u)
        size += t
    return out + ([cur] if cur else [])


ENTITY_SLOTS = ("performer", "owner", "subject", "whole", "source", "target", "to", "payload")


class CanonicalAligner:
    """Map a surface label to an entity_id by its canonical name only (exact after normalization,
    else a unique containment hit of at least 4 characters)."""

    def __init__(self, entities: list[dict]):
        self._canon = {norm_text(e["canonical"]): e["entity_id"] for e in entities}
        self._alias = {}
        for e in entities:
            for a in e.get("aliases", []):
                self._alias[norm_text(a)] = e["entity_id"]

    def __call__(self, label) -> str | None:
        key = norm_text(label)
        if not key:
            return None
        if key in self._canon:
            return self._canon[key]
        if key in self._alias:  # alias surface (e.g. "Control Room" for "Central Control Room") = unresolved
            return None
        hits = {eid for k, eid in self._canon.items() if (k in key or key in k) and min(len(k), len(key)) >= 4}
        return hits.pop() if len(hits) == 1 else None

    def alias_of(self, label) -> str | None:
        """entity_id whose alias equals this label (identity left unresolved), else None."""
        return self._alias.get(norm_text(label))


def _slot_values(fact: dict) -> list:
    vals = []
    for s in ENTITY_SLOTS:
        v = fact.get(s)
        if isinstance(v, str):
            vals.append(v)
    for p in fact.get("parts") or []:
        vals.append(p)
    return vals


def score_probes(probe_gt: dict, facts: list[dict]) -> dict:
    """Score raw B2-style fact dicts (unit_id, type, slots) against the probe GT."""
    align = CanonicalAligner(probe_gt["entities"])
    item_ok = {e["entity_id"]: {norm_text(e["canonical"]), *(norm_text(a) for a in e.get("aliases", []))}
               for e in probe_gt["entities"]}
    by_unit: dict[str, list[dict]] = {}
    for f in facts:
        by_unit.setdefault(f.get("unit_id"), []).append(f)

    results = []
    for p in probe_gt["probes"]:
        out = {"probe_id": p["probe_id"], "type": p["type"], "distance_tokens": p["distance_tokens"],
               "hit": False, "forbidden": False, "alias_unresolved": False, "partial": False}
        if p["type"] == "split_flow":
            for uid in (p["intro_unit"], p["link_unit"]):
                for f in by_unit.get(uid, []):
                    if f.get("type") != "flow":
                        continue
                    src, tgt = align(f.get("source")), align(f.get("target"))
                    pay = norm_text(f.get("payload"))
                    pay_ok = any(pay and (pay == k or k in pay or pay in k) for k in item_ok[p["item"]])
                    if src == p["producer"] and tgt == p["consumer"] and pay_ok:
                        out["hit"] = True
                    elif tgt == p["consumer"] or src == p["producer"]:
                        out["partial"] = True
        else:
            want, bad = p["entity_id"], p.get("confusable_entity_id")
            for f in by_unit.get(p["link_unit"], []):
                for v in _slot_values(f):
                    eid = align(v)
                    if eid == want:
                        out["hit"] = True
                    elif bad and (eid == bad or norm_text(v) == norm_text(p.get("shared_head"))):
                        out["forbidden"] = True
                    elif align.alias_of(v) == want:
                        out["alias_unresolved"] = True
        results.append(out)
    return {"probes": results, **summarize(results)}


def summarize(results: list[dict]) -> dict:
    def rate(sel, key):
        return sum(r[key] for r in sel) / len(sel) if sel else None
    types = sorted({r["type"] for r in results})
    return {"recall": rate(results, "hit"),
            "by_type": {t: rate([r for r in results if r["type"] == t], "hit") for t in types},
            "forbidden_rate": rate([r for r in results if r["type"] == "homonym"], "forbidden"),
            "alias_unresolved_rate": rate([r for r in results if r["type"] == "alias_ref"], "alias_unresolved")}
