"""Convert method outputs into decision-constraint :class:`Fact` lists.

* :func:`facts_from_t2m` — a T2M ``PipelineResult.to_dict()`` (candidate layer + decision ledger).
* :func:`facts_from_structured` — the B2 Structured-LLM baseline output (``FACTS_SCHEMA``).

Held (``unresolved``) facts: T2M relations excluded by the decision gate, or whose
endpoint is an explicit unknown marker. ``has_alternatives``: relations emitted with
competing readings.
"""

from __future__ import annotations

from .dc_gt import TYPES, Fact

_UNKNOWN = ("unspecified", "unresolved", "unknown", "unnamed", "unidentified", "not stated", "미상", "미지정")


def _is_unknown(value) -> bool:
    return isinstance(value, str) and any(marker in value.lower() for marker in _UNKNOWN)


def _clean(value):
    return None if value is None or _is_unknown(value) else value


def facts_from_t2m(result: dict, *, gate_aware: bool = True) -> list[Fact]:
    """Facts committed (or held) by a T2M run.

    ``gate_aware=False`` ignores the decision gate (every relation counts as committed),
    which is the ``T2M − gate`` ablation.
    """
    ref_label = {r["referent_id"]: r["label"] for r in result.get("referents", [])}
    action_label = {a["action_id"]: a["label"] for a in result.get("actions", [])}
    lab = lambda v: ref_label.get(v, action_label.get(v, v)) if isinstance(v, str) else v  # noqa: E731
    excluded = set()
    ledger = result.get("decision_ledger") or {}
    if gate_aware:
        excluded = set(ledger.get("excluded_relation_ids") or [])

    facts: list[Fact] = []
    for r in result.get("relations", []):
        held = r["relation_id"] in excluded or _is_unknown(r.get("target")) or _is_unknown(r.get("source"))
        alts = bool(r.get("alternatives"))
        common = {"unit_id": r.get("unit_id"), "evidence": r.get("evidence_text"), "unresolved": held, "has_alternatives": alts}
        family = r.get("family")
        if family == "composition":
            parts = [p.strip() for p in str(r.get("target") or "").replace(" and ", ", ").split(",") if p.strip()]
            facts.append(Fact.make("composition", whole=lab(_clean(r.get("source"))), parts=[lab(p) for p in parts] or None, **common))
        elif family == "flow":
            facts.append(Fact.make("flow", source=lab(_clean(r.get("source"))), target=lab(_clean(r.get("target"))),
                                   payload=lab(_clean(r.get("payload"))), **common))
        elif family == "transition":
            facts.append(Fact.make("transition", **{"from": lab(_clean(r.get("source")))}, to=lab(_clean(r.get("target"))),
                                   trigger=r.get("condition"), **common))
            for state in (r.get("source"), r.get("target")):
                if _clean(state):
                    facts.append(Fact.make("state", owner=None, label=lab(state), unit_id=r.get("unit_id"), evidence=r.get("evidence_text")))
        elif family == "succession":
            facts.append(Fact.make("succession", before=lab(r.get("source")), after=lab(r.get("target")), **common))
    for a in result.get("actions", []):
        facts.append(Fact.make("action", performer=lab(_clean(a.get("performer"))), label=a.get("label"),
                               unit_id=a.get("unit_id"), evidence=a.get("evidence_text"),
                               unresolved=_is_unknown(a.get("performer"))))
    for q in result.get("requirements", []):
        facts.append(Fact.make("requirement", subject=lab(_clean(q.get("subject"))), text=q.get("evidence_text") or q.get("text"),
                               unit_id=q.get("unit_id"), evidence=q.get("evidence_text")))
    for t in result.get("attributes", []):
        facts.append(Fact.make("attribute", owner=lab(t.get("owner")), name=t.get("name"), value=t.get("value"), unit=t.get("unit"),
                               unit_id=t.get("unit_id"), evidence=t.get("evidence_text")))
    for c in result.get("constraints", []):
        facts.append(Fact.make("constraint", subject=lab(c.get("constrained_element") or c.get("owner")), expression=c.get("expression_text"),
                               unit_id=c.get("unit_id"), evidence=c.get("evidence_text")))
    for al in result.get("allocations", []):
        facts.append(Fact.make("allocation", action=action_label.get(al.get("from_element"), lab(al.get("from_element"))),
                               to=lab(al.get("to_element")), unit_id=al.get("unit_id"), evidence=al.get("evidence_text")))
    return facts


# --------------------------------------------------------------------------- B2 structured baseline
_fact_item = {
    "type": "object",
    "properties": {
        "unit_id": {"type": "string"},
        "type": {"type": "string", "enum": sorted(t for t in TYPES if t not in ("part", "item"))},
        **{slot: {"type": ["string", "null"]} for slots in TYPES.values() for slot in slots if slot != "parts"},
        "parts": {"type": ["array", "null"], "items": {"type": "string"}},
    },
    "required": ["unit_id", "type", *sorted({s for slots in TYPES.values() for s in slots})],
    "additionalProperties": False,
}
FACTS_SCHEMA = {
    "type": "object",
    "properties": {"facts": {"type": "array", "items": _fact_item}},
    "required": ["facts"],
    "additionalProperties": False,
}

STRUCTURED_PROMPT = """Extract a SysML v2 model from the document as a list of facts. Each fact has unit_id (the sentence it comes from), type and slots. Every fact object must contain ALL slot keys; set unused slots to null.

Types and slots:
  attribute(owner,name,value,unit) action(performer,label) state(owner,label) constraint(subject,expression) requirement(subject,text)
  composition(whole,parts) flow(source,target,payload) succession(before,after) transition(from,to,trigger) allocation(action,to)

Use the element names as written in the document. Return JSON {{"facts": [...]}}.

Document units:
{units}
"""


# B2 tuning iteration 1 (fairness): the domain rules T2M v2 learned on DOC01 that apply to a
# schema-only extractor are given to B2. T2M-specific mechanisms (evidence spans,
# alternatives, unresolved markers, decision gate) are NOT given.
STRUCTURED_RULES_V2 = """
RULES:
- Every slot value must be written in THAT sentence (a pronoun like "it/they/this" may be resolved only to the element named in the immediately preceding sentence). If the receiver of a flow is not named in the sentence, set target to null; never fill it with an element that appears elsewhere in the document.
- Never write placeholder words such as "any", "all", "some state" for an unstated element; use null.
- Use each element's name as written. Do not merge differently named things unless the text says they are the same.
- Emit one action for EVERY behavior verb phrase, including passive voice (performer null), capability statements, displays, logs, generates and reports. label = the verbatim verb phrase with its object.
- Emit a requirement for every NORMATIVE statement (shall, must, should, will, is required to, needs to). Purpose, goal or benefit sentences are not requirements.
- Emit a state for every named mode or state; transitions use the state names, with from null when the prior state is not stated.
- Emit a succession only for an EXPLICIT temporal connective between two actions ("then", "after", "once", "before", "when ... is complete", "next", "finally"); before/after are the action labels. Never use succession for cause or data transfer.
"""

# B2 tuning iteration 2 (from B2 v2 error analysis on DOC01 only).
STRUCTURED_RULES_V3 = STRUCTURED_RULES_V2 + """- Resolve a pronoun or "this/these" performer to the element named in the preceding sentence and write that element's name; if it cannot be resolved, use null. Never output a pronoun as a slot value.
- Drop determiners and quantifiers from element names ("Each Soil Moisture Probe" -> "Soil Moisture Probe", "the system" -> "system").
- allocation.to must be a component or actor, never a mode or state.
- Emit a constraint for every threshold, limit, period or deadline stated with a number; expression = the verbatim phrase.
- Emit a flow for every sentence in which an element sends, transmits, reports, displays, commands or delivers an item (target null if the receiver is not named).
"""

STRUCTURED_PROMPTS = {
    "v1": STRUCTURED_PROMPT,
    "v3": STRUCTURED_PROMPT.replace("Use the element names as written in the document.",
                                    "Use the element names as written in the document." + STRUCTURED_RULES_V3.replace("{", "{{").replace("}", "}}")),
    "v2": STRUCTURED_PROMPT.replace("Use the element names as written in the document.",
                                    "Use the element names as written in the document." + STRUCTURED_RULES_V2.replace("{", "{{").replace("}", "}}")),
}


def structured_prompt(units: list[dict], version: str = "v1") -> str:
    return STRUCTURED_PROMPTS[version].format(units="\n".join(f"{u['unit_id']}: {u['text']}" for u in units))


def facts_from_structured(payload: dict) -> list[Fact]:
    facts = []
    for f in payload.get("facts", []):
        slots = {s: f.get(s) for s in TYPES[f["type"]]}
        facts.append(Fact.make(f["type"], unit_id=f.get("unit_id"), **slots))
    return facts
