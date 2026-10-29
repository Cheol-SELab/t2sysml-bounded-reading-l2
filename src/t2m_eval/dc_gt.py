"""Decision-constraint ground truth (spec: docs/T2M-Journal-Decision-Constraint-GT-Spec.md).

A GT document = units (sentences) + entities + decisions. Each decision has a
``type``, verbatim ``evidence``, ``allowed`` realizations, ``forbidden``
realizations and an ``ambiguous`` flag. Methods are scored by converting their
output into a list of committed :class:`Fact` objects (same slot vocabulary),
aligning labels to entities, and matching facts against decisions.
"""

from __future__ import annotations

import json
from dataclasses import dataclass, field

from .normalize import norm_text, text_match
from .stats import prf

TYPES = {
    "part": ("entity",),
    "item": ("entity",),
    "attribute": ("owner", "name", "value", "unit"),
    "action": ("performer", "label"),
    "state": ("owner", "label"),
    "constraint": ("subject", "expression"),
    "requirement": ("subject", "text"),
    "composition": ("whole", "parts"),
    "flow": ("source", "target", "payload"),
    "succession": ("before", "after"),
    "transition": ("from", "to", "trigger"),
    "allocation": ("action", "to"),
}
# slots that reference entities (entity_id) vs. free text copied from the source
ENTITY_SLOTS = {"entity", "owner", "performer", "subject", "whole", "parts", "source", "target", "payload", "to", "from"}
DECISION_SLOTS = {"action", "before", "after"}  # may reference an action decision_id or an entity
TEXT_SLOTS = {"name", "value", "unit", "label", "expression", "text", "trigger"}
DOC_LEVEL_TYPES = {"part", "item", "state"}  # matched at document level (dev decision 2026-09-29)
RELATION_TYPES = {"composition", "flow", "succession", "transition", "allocation"}

_nullable_str = {"type": ["string", "null"]}
_realization = {
    "type": "object",
    "properties": {
        **{slot: _nullable_str for slots in TYPES.values() for slot in slots if slot != "parts"},
        "parts": {"type": ["array", "null"], "items": {"type": "string"}},
    },
    "required": sorted({slot for slots in TYPES.values() for slot in slots}),
    "additionalProperties": False,
}
DC_GT_SCHEMA = {
    "type": "object",
    "properties": {
        "entities": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "entity_id": {"type": "string"},
                    "label": {"type": "string"},
                    "aliases": {"type": "array", "items": {"type": "string"}},
                    "kind": {"type": "string", "enum": ["part", "item", "state", "action", "other"]},
                    "evidence": {"type": "string"},
                },
                "required": ["entity_id", "label", "aliases", "kind", "evidence"],
                "additionalProperties": False,
            },
        },
        "decisions": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "decision_id": {"type": "string"},
                    "unit_id": {"type": "string"},
                    "type": {"type": "string", "enum": sorted(TYPES)},
                    "evidence": {"type": "string"},
                    "allowed": {"type": "array", "items": _realization},
                    "forbidden": {"type": "array", "items": _realization},
                    "ambiguous": {"type": "boolean"},
                    "note": _nullable_str,
                },
                "required": ["decision_id", "unit_id", "type", "evidence", "allowed", "forbidden", "ambiguous", "note"],
                "additionalProperties": False,
            },
        },
    },
    "required": ["entities", "decisions"],
    "additionalProperties": False,
}


# --------------------------------------------------------------------------- checks
def check(doc: dict) -> dict:
    """Deterministic quality checks. Returns {"kept": doc', "dropped": [...], "stats": {...}}.

    Drops entities whose evidence is not verbatim in the source, decisions whose
    evidence is not verbatim in their unit (or any unit), and realizations that
    reference unknown entities/decisions or carry non-verbatim text slots.
    """
    units = {u["unit_id"]: u["text"] for u in doc["units"]}
    full_text = "\n".join(units.values())
    dropped: list[dict] = []
    entities = []
    for e in doc.get("entities", []):
        if e["evidence"] and e["evidence"] in full_text:
            entities.append(e)
        else:
            dropped.append({"what": "entity", "id": e["entity_id"], "reason": "evidence not verbatim"})
    entity_ids = {e["entity_id"] for e in entities}
    decision_ids = {d["decision_id"] for d in doc.get("decisions", [])}

    def realization_ok(r: dict, unit_text: str) -> str | None:
        for slot, value in r.items():
            if value in (None, [], ""):
                continue
            if slot == "parts":
                bad = [v for v in value if v not in entity_ids]
                if bad:
                    return f"unknown part entity {bad}"
            elif slot in ("action", "before", "after", "to"):
                if value not in entity_ids and value not in decision_ids:
                    return f"unknown reference in {slot}: {value}"
            elif slot in ENTITY_SLOTS:
                if value not in entity_ids:
                    return f"unknown entity in {slot}: {value}"
            elif slot in TEXT_SLOTS:
                if value not in full_text:
                    return f"text slot {slot} not verbatim: {value!r}"
        return None

    decisions = []
    for d in doc.get("decisions", []):
        unit_text = units.get(d["unit_id"], "")
        if not d["evidence"] or (d["evidence"] not in unit_text and d["evidence"] not in full_text):
            dropped.append({"what": "decision", "id": d["decision_id"], "reason": "evidence not verbatim"})
            continue
        kept = dict(d)
        for key in ("allowed", "forbidden"):
            good = []
            for r in d.get(key, []):
                why = realization_ok(r, unit_text)
                if why:
                    dropped.append({"what": f"{key} realization", "id": d["decision_id"], "reason": why})
                else:
                    good.append(r)
            kept[key] = good
        if not kept["allowed"] and not kept["forbidden"] and not kept["ambiguous"]:
            dropped.append({"what": "decision", "id": d["decision_id"], "reason": "no realization left"})
            continue
        decisions.append(kept)
    out = dict(doc, entities=entities, decisions=decisions)
    n_units = max(1, len(units))
    return {
        "kept": out,
        "dropped": dropped,
        "stats": {
            "units": len(units),
            "entities": len(entities),
            "decisions": len(decisions),
            "decisions_per_unit": round(len(decisions) / n_units, 3),
            "ambiguous": sum(1 for d in decisions if d["ambiguous"]),
            "underspecified": sum(1 for d in decisions if underspecified(d)),
            "uncertain": sum(1 for d in decisions if uncertain(d)),
            "negative": sum(1 for d in decisions if not d["allowed"] and d["forbidden"]),
            "by_type": {t: sum(1 for d in decisions if d["type"] == t) for t in TYPES},
        },
    }


# --------------------------------------------------------------------------- facts & alignment
@dataclass(frozen=True)
class Fact:
    """A committed statement produced by a method, in GT slot vocabulary.

    Entity-valued slots hold *labels* (surface strings) before alignment and
    entity_ids after. ``unresolved`` marks facts the method explicitly left
    undecided (e.g. T2M unresolved decisions); ``has_alternatives`` marks facts
    committed together with competing readings.
    """

    type: str
    slots: tuple  # tuple of (slot, value) pairs, value str|None|tuple[str]
    unit_id: str | None = None
    evidence: str | None = None
    unresolved: bool = False
    has_alternatives: bool = False

    def get(self, slot: str):
        return dict(self.slots).get(slot)

    @staticmethod
    def make(type: str, unit_id: str | None = None, evidence: str | None = None, unresolved: bool = False,
             has_alternatives: bool = False, **slots) -> "Fact":
        norm = []
        for k in TYPES[type]:
            v = slots.get(k)
            if isinstance(v, list):
                v = tuple(v)
            norm.append((k, v))
        return Fact(type=type, slots=tuple(norm), unit_id=unit_id, evidence=evidence,
                    unresolved=unresolved, has_alternatives=has_alternatives)


@dataclass
class Aligner:
    """Map surface labels to entity_ids by normalized label/alias matching.

    ``extra`` holds externally decided alignments (e.g. from two agreeing LLM
    aligners); unmatched labels map to None.
    """

    entities: list[dict]
    extra: dict[str, str | None] = field(default_factory=dict)
    actions: list[dict] | None = None  # GT action decisions; enables label -> action decision_id

    def __post_init__(self) -> None:
        self._index: dict[str, str] = {}
        for e in self.entities:
            for s in [e["label"], *e.get("aliases", [])]:
                self._index.setdefault(norm_text(s), e["entity_id"])
        self._actions: list[tuple[str, str]] = []
        for d in self.actions or []:
            for r in d.get("allowed", []):
                if r.get("label"):
                    self._actions.append((r["label"], d["decision_id"]))

    def action(self, label: str | None) -> str | None:
        """Map an action label to the GT action decision_id (relaxed text match, unique hit)."""
        if not label:
            return None
        hits = {did for text, did in self._actions if text_match(label, text)}
        return hits.pop() if len(hits) == 1 else None

    def __call__(self, label: str | None) -> str | None:
        if label is None:
            return None
        if label in self.extra:
            return self.extra[label]
        key = norm_text(label)
        if key in self._index:
            return self._index[key]
        # containment fallback: unique entity whose normalized label contains / is contained
        hits = {eid for k, eid in self._index.items() if k and (k in key or key in k) and min(len(k), len(key)) >= 3}
        return hits.pop() if len(hits) == 1 else None

    def unmatched(self, labels) -> list[str]:
        return sorted({lab for lab in labels if lab and self(lab) is None})


def _slot_equal(slot: str, got, want, align: Aligner) -> bool:
    if want in (None, [], ()):
        return got in (None, [], (), "unspecified receiver", "unresolved receiver")
    if got in (None, [], ()):
        return False
    if slot == "parts":
        got_ids = {align(g) for g in got}
        return got_ids == set(want)
    if slot in ("action", "before", "after", "to"):
        return align(got) == want or align.action(got) == want or (isinstance(got, str) and got == want)
    if slot in ENTITY_SLOTS:
        return align(got) == want or (isinstance(got, str) and got == want)
    return text_match(str(got), str(want))


# Slots that must match for a decision TP (same rule for every method). Secondary slots
# (e.g. a state's owner, a transition's trigger wording, a constraint's subject) are not
# required: they are frequently implicit and representing them is not what the decision
# tests. Fixed on dev (DOC01) on 2026-09-29, before any test document was scored.
KEY_SLOTS = {
    "part": ("entity",), "item": ("entity",),
    "attribute": ("name", "value", "unit"),
    "action": ("performer", "label"),
    "state": ("label",),
    "constraint": ("expression",),
    "requirement": ("subject", "text"),
    "composition": ("whole", "parts"),
    "flow": ("source", "target", "payload"),
    "succession": ("before", "after"),
    "transition": ("from", "to"),
    "allocation": ("action", "to"),
}


def fact_matches(fact: Fact, realization: dict, type_: str, align: Aligner, strict: bool = False) -> bool:
    """Key-slot match (default) or all-slot match (``strict``)."""
    if fact.type != type_:
        return False
    slots = TYPES[type_] if strict else KEY_SLOTS[type_]
    return all(_slot_equal(slot, fact.get(slot), realization.get(slot), align) for slot in slots)


# slots whose absence in an allowed realization means "the text does not state it"
_CORE_SLOTS = {"flow": ("source", "target", "payload"), "transition": ("from", "to"), "composition": ("whole", "parts"),
               "succession": ("before", "after"), "allocation": ("action", "to"), "requirement": ("subject",),
               "action": ("performer",), "attribute": ("owner", "value"), "constraint": ("subject",), "state": ("owner",)}


def underspecified(decision: dict) -> bool:
    """True if some allowed realization leaves a core slot null (the text omits it)."""
    core = _CORE_SLOTS.get(decision["type"], ())
    return any(any(r.get(slot) in (None, [], "") for slot in core) for r in decision.get("allowed", []))


def uncertain(decision: dict) -> bool:
    """Decisions a faithful method should hold, leave open, or flag: ambiguous or underspecified."""
    return bool(decision["ambiguous"]) or underspecified(decision)


def score_document(gt: dict, facts: list[Fact], align: Aligner) -> dict:
    """Score committed facts against one GT document.

    Returns counts and per-decision outcomes:
      decision TP = some committed fact matches an allowed realization (same unit when known)
      forbidden commitment = committed fact matches a forbidden realization
      ambiguity detected = ambiguous decision handled by an unresolved fact or a fact with alternatives
      unmatched commitments = committed facts that match no decision at all (candidates for
                              the unsupported-commitment judge)
    """
    decisions = gt["decisions"]
    if align.actions is None:
        align = Aligner(align.entities, extra=align.extra, actions=[d for d in decisions if d["type"] == "action"])
    positive = [d for d in decisions if d["allowed"]]
    committed_idx = [i for i, f in enumerate(facts) if not f.unresolved]
    used: set[int] = set()
    outcomes = []
    tp = forbidden_hits = unc_tp = unneeded_hold = 0

    def same_unit(f: Fact, d: dict) -> bool:
        # element-existence decisions are document-level: an element is the same element
        # wherever a method declares it; relation/behavior decisions stay sentence-bound.
        if d["type"] in DOC_LEVEL_TYPES:
            return True
        return f.unit_id is None or f.unit_id == d["unit_id"]

    for d in decisions:
        # a held (unresolved) fact is a correct realization when it matches an allowed one,
        # e.g. flow target "unspecified receiver" against an allowed realization with target null
        hit = next((i for i, f in enumerate(facts) if same_unit(f, d)
                    and any(fact_matches(f, r, d["type"], align) for r in d["allowed"])), None)
        forb = [i for i in committed_idx if same_unit(facts[i], d)
                and any(fact_matches(facts[i], r, d["type"], align) for r in d["forbidden"])]
        held = any(f.unresolved and f.type == d["type"] and same_unit(f, d) for f in facts)
        flagged = held or (hit is not None and (facts[hit].has_alternatives or facts[hit].unresolved))
        is_unc = uncertain(d)
        # uncertainty handled: held/flagged, or committed a realization that keeps the unknown slot open
        handled = is_unc and (flagged or (hit is not None and underspecified(d)))
        if hit is not None:
            used.add(hit)
            tp += 1
        used.update(forb)
        forbidden_hits += len(forb)
        unc_tp += handled
        unneeded_hold += (not is_unc) and held and hit is None
        outcomes.append({"decision_id": d["decision_id"], "type": d["type"], "hit": hit is not None, "forbidden": len(forb),
                         "ambiguous": d["ambiguous"], "underspecified": underspecified(d), "uncertainty_handled": handled, "held": held})
    unmatched = [facts[i] for i in range(len(facts)) if i not in used]
    n_unc = sum(1 for d in decisions if uncertain(d))
    n_flagged = sum(1 for f in facts if f.unresolved or f.has_alternatives)
    emitted = len(facts)
    return {
        # strict precision: every emitted fact that is not a TP counts as FP (incl. forbidden
        # and unmatched); the unsupported-commitment judge later separates "correct but not
        # annotated" from "unsupported" among the unmatched ones.
        "decision": prf(tp, max(0, emitted - tp), len(positive) - tp),
        "emitted": emitted,
        "committed": len(committed_idx),
        "forbidden_commitments": forbidden_hits,
        "forbidden_rate": forbidden_hits / len(committed_idx) if committed_idx else 0.0,
        "uncertainty": prf(unc_tp, max(0, n_flagged - unc_tp), n_unc - unc_tp) | {"n_uncertain": n_unc},
        "unneeded_hold": unneeded_hold,
        "unmatched_commitments": len(unmatched),
        "outcomes": outcomes,
        "unmatched": [json.loads(json.dumps(f.__dict__, default=list)) for f in unmatched],
    }
