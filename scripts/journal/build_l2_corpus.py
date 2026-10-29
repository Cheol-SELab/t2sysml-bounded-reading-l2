#!/usr/bin/env python3
"""Build L2: the held-out long-document benchmark (~5K tokens, 243-ish sentences, 10 sections).

L2 extends the L1 builder (build_l1_corpus.py, frozen for L1DEV*) in three ways:

1. Short references. In half of the split flows the link sentence names the item only by a
   shortened definite description ("the discharge list" for "Vessel Discharge List"). Joining the
   two ends therefore needs more than an exact item-name match, as in real documents.
2. Domains differ per document (one development document, eight test documents).
3. OpenAI-only writers that alternate per document; the probe verifier is always the other model.

    python scripts/journal/build_l2_corpus.py all --doc L2T1

``all`` = plan -> write -> check -> repair (<= 3 rounds) -> verify. Steps are cached
(experiments/journal-v1/cache/l2/<model>), so rerunning a finished document makes no calls.
Probe GT format is the L1 format plus ``link_ref``/``short_ref`` on split_flow probes.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))

import tiktoken  # noqa: E402

from t2m_eval.normalize import norm_text  # noqa: E402
from t2m_pipeline.llm_clients import CachedClient, load_registry, make_client  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

EXP = ROOT / "experiments" / "journal-v1"
L2 = EXP / "l2"
REGISTRY = EXP / "models-l2.json"
ENC = tiktoken.get_encoding("o200k_base")
BUDGET = 1024

# writer per document alternates; the verifier is the other model
DOCS = {
    "L2DEV": ("gpt-6-luna", "a regional emergency medical dispatch and ambulance coordination system (call takers, dispatch software, ambulances, hospitals)"),
    "L2T1": ("gpt-5.5", "a metro railway communications-based train control system (onboard units, zone controllers, interlocking, operations control centre)"),
    "L2T2": ("gpt-6-luna", "a hospital automated medication dispensing and delivery system (pharmacy robots, ward cabinets, pneumatic tubes, nurses)"),
    "L2T3": ("gpt-5.5", "a wildfire detection and suppression support system using fixed cameras, drones and air tankers"),
    "L2T4": ("gpt-6-luna", "an electrical distribution substation automation system (protection relays, bay controllers, SCADA, field crews)"),
    "L2T5": ("gpt-5.5", "a municipal drinking water treatment plant control system (intake, filtration, dosing, laboratory, distribution)"),
    "L2T6": ("gpt-6-luna", "an airport checked-baggage handling and screening system (check-in, sorters, explosive detection, make-up carousels)"),
    "L2T7": ("gpt-5.5", "a satellite ground segment for an Earth-observation mission (antennas, mission control, flight dynamics, payload data processing)"),
    "L2T8": ("gpt-6-luna", "an automated pallet warehouse with stacker cranes, conveyors, autonomous forklifts and a warehouse management system"),
}
N_SECTIONS, N_SPLIT, N_SHORT, N_ALIAS, N_FAR_FLOW, N_FAR_ALIAS = 10, 10, 5, 8, 7, 6


def other(model: str) -> str:
    return "gpt-5.5" if model == "gpt-6-luna" else "gpt-6-luna"


PLAN_PROMPT = """You are planning a long operational concept document in English for: {domain}.
The document will have exactly {n} sections of about 22-26 sentences each (about 5,000 tokens in total).

Plan the following. Use realistic, specific names.
1. sections: index 1..{n}, a heading and a one-sentence topic each.
2. entities: 24-32 system elements, actors and items. entity_id like E_ZONE_CONTROLLER, canonical = the full name used in the document (at least two words for items), kind in part|actor|item|state.
3. aliases: {n_alias} entities (parts or actors) get ONE alias each. The alias must be an arbitrary project codename or call sign that CANNOT be guessed from the full name: not an abbreviation, acronym or initialism, and sharing no word with the full name (e.g. "Terminal Operating System" -> "Harbormind"). intro_section = the section where a sentence explicitly introduces the alias together with the full name.
4. split_flows: {n_split} information or material flows. producer and consumer are part/actor entity_ids, item is an item entity_id (each item used by only one split flow). intro_section = where a sentence says the producer produces or sends the item WITHOUT naming the consumer; link_section = where a sentence says the consumer receives or uses the item WITHOUT naming the producer. At least {n_far} must have link_section - intro_section >= 3. Choose items that are specific, minor messages, documents or loads (not central concepts of the system), because each item may be mentioned ONLY in its two tagged sentences in the whole document.
   Exactly {n_short} of the split flows have link_ref "short": in the link sentence the item is named only by a shorter definite description short_ref that a careful reader resolves to the item, e.g. item "Vessel Discharge List" -> short_ref "the discharge list". short_ref starts with "the", keeps the item's last word, drops at least one word of the full name, and must not be a substring of any other entity name. The other flows have link_ref "full" and short_ref "".
5. alias_refs: {n_alias} probes, one per alias. link_section = a section after the alias intro_section where a sentence mentions the entity ONLY by its alias while it performs an action, sends something or is the subject of a requirement. At least {n_far_alias} must have link_section - intro_section >= 3.
6. homonyms: 2 pairs of distinct part entities whose canonical names differ only by a qualifier (e.g. "North Gate Scanner" and "South Gate Scanner"); shared_head = the common unqualified phrase ("Gate Scanner"). link_section = a section where a sentence names ONE of them (entity_id) with its full qualified name doing something; confusable_entity_id = the other.
Each probe gets a probe_id: F1..F{n_split} (split_flows), A1..A{n_alias} (alias_refs), H1..H2 (homonyms).
Return JSON only.
"""

_int = {"type": "integer"}
_str = {"type": "string"}


def _obj(props: dict) -> dict:
    return {"type": "object", "properties": props, "required": list(props), "additionalProperties": False}


BLUEPRINT_SCHEMA = _obj({
    "title": _str,
    "sections": {"type": "array", "items": _obj({"index": _int, "heading": _str, "topic": _str})},
    "entities": {"type": "array", "items": _obj({"entity_id": _str, "canonical": _str,
                                                   "kind": {"type": "string", "enum": ["part", "actor", "item", "state"]}})},
    "aliases": {"type": "array", "items": _obj({"entity_id": _str, "alias": _str, "intro_section": _int})},
    "split_flows": {"type": "array", "items": _obj({"probe_id": _str, "producer": _str, "item": _str, "consumer": _str,
                                                      "intro_section": _int, "link_section": _int,
                                                      "link_ref": {"type": "string", "enum": ["full", "short"]}, "short_ref": _str})},
    "alias_refs": {"type": "array", "items": _obj({"probe_id": _str, "entity_id": _str, "link_section": _int})},
    "homonyms": {"type": "array", "items": _obj({"probe_id": _str, "entity_id": _str, "confusable_entity_id": _str,
                                                   "shared_head": _str, "link_section": _int})},
})

SECTION_SCHEMA = _obj({"sentences": {"type": "array", "items": _obj({"text": _str, "tags": {"type": "array", "items": _str}})}})

SECTION_PROMPT = """You are writing section {index} of {n} of the operational concept document "{title}".
Section heading: {heading}. Topic: {topic}.

Write 22 to 26 sentences of plain, realistic engineering prose (no lists, no tables). Every sentence is complete and ends with a period.

NAMING RULES (for the whole document):
- Always use the canonical names below. Aliases may appear ONLY in the tagged alias sentences listed for this section (an alias intro sentence, or an alias reference sentence).
- Never state any of the split flows listed in the plan anywhere except in its tagged sentences, and never name both its producer and its consumer in the same sentence.
- These items (and their short forms) may be mentioned ONLY in their own tagged sentences, never elsewhere: {flow_items}

Entities (canonical names): {entities}

This section MUST contain these tagged sentences (put the tag string in the sentence's "tags"; all other sentences have tags []):
{required}

Previous section's last sentences (for continuity): {previous}

Return JSON {{"sentences": [{{"text": ..., "tags": [...]}}, ...]}}.
"""


def ntok(text: str) -> int:
    return len(ENC.encode(text))


def client(registry, model_id, schema, name, system, sample=0):
    return CachedClient(make_client(registry[model_id], schema=schema, schema_name=name, system_prompt=system),
                        EXP / "cache" / "l2" / model_id, sample=sample)


def load(doc: str, name: str):
    return json.loads((L2 / doc / name).read_text(encoding="utf-8"))


def save(doc: str, name: str, obj) -> None:
    p = L2 / doc / name
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(obj, ensure_ascii=False, indent=1), encoding="utf-8")


_STOP = {"the", "a", "an", "of", "and", "unit", "units", "system"}


def guessable(alias: str, canonical: str) -> bool:
    aw = {w for w in re.findall(r"[a-z0-9]+", alias.lower()) if w not in _STOP}
    cw = [w for w in re.findall(r"[a-z0-9]+", canonical.lower()) if w not in {"the", "a", "an", "of", "and"}]
    initials = "".join(w[0] for w in cw)
    return bool(aw & set(cw)) or any(len(w) >= 2 and w in initials for w in aw)


def short_core(short_ref: str) -> str:
    """'the discharge list' -> 'discharge list' (the phrase that must appear in the link sentence)."""
    return re.sub(r"^(the|a|an)\s+", "", short_ref.strip(), flags=re.I)


def short_problems(short_ref: str, item: str, others: list[str]) -> list[str]:
    core, iw = norm_text(short_core(short_ref)), norm_text(item).split()
    probs = []
    if not core or core == norm_text(item):
        probs.append("short_ref equals item")
    elif core.split()[-1] != iw[-1]:
        probs.append("short_ref drops the item's last word")
    elif len(core.split()) >= len(iw):
        probs.append("short_ref not shorter")
    if any(core in norm_text(o) for o in others):
        probs.append("short_ref inside another entity name")
    return probs


def blueprint_problems(bp: dict) -> list[str]:
    ent = {e["entity_id"]: e for e in bp["entities"]}
    alias_by = {a["entity_id"]: a for a in bp["aliases"]}
    sec = {s["index"] for s in bp["sections"]}
    probs = []
    if sec != set(range(1, N_SECTIONS + 1)):
        probs.append(f"sections {sorted(sec)}")
    for a in bp["aliases"]:
        if a["entity_id"] not in ent or a["intro_section"] not in sec:
            probs.append(f"alias {a}")
        elif guessable(a["alias"], ent[a["entity_id"]]["canonical"]):
            probs.append(f"guessable alias {a['alias']}")
    items = [f["item"] for f in bp["split_flows"]]
    if len(set(items)) != len(items):
        probs.append("item reused")
    for f in bp["split_flows"]:
        if any(f[k] not in ent for k in ("producer", "item", "consumer")) or ent.get(f["item"], {}).get("kind") != "item":
            probs.append(f"flow ids {f['probe_id']}")
            continue
        if f["intro_section"] not in sec or f["link_section"] not in sec:
            probs.append(f"flow sections {f['probe_id']}")
        if f["link_ref"] == "short":
            others = [e["canonical"] for k, e in ent.items() if k != f["item"]]
            probs += [f"{f['probe_id']} {p}" for p in short_problems(f["short_ref"], ent[f["item"]]["canonical"], others)]
    for r in bp["alias_refs"]:
        if r["entity_id"] not in alias_by or r["link_section"] <= alias_by[r["entity_id"]]["intro_section"]:
            probs.append(f"alias_ref {r['probe_id']}")
    for h in bp["homonyms"]:
        if h["entity_id"] not in ent or h["confusable_entity_id"] not in ent:
            probs.append(f"homonym {h['probe_id']}")
    far_f = sum(f["link_section"] - f["intro_section"] >= 3 for f in bp["split_flows"])
    far_a = sum(r["link_section"] - alias_by.get(r["entity_id"], {"intro_section": 99})["intro_section"] >= 3 for r in bp["alias_refs"])
    n_short = sum(f["link_ref"] == "short" for f in bp["split_flows"])
    if len(bp["split_flows"]) != N_SPLIT or far_f < N_FAR_FLOW or n_short != N_SHORT:
        probs.append(f"split_flows n={len(bp['split_flows'])} far={far_f} short={n_short}")
    if len(bp["alias_refs"]) != N_ALIAS or far_a < N_FAR_ALIAS:
        probs.append(f"alias_refs n={len(bp['alias_refs'])} far={far_a}")
    if len(bp["homonyms"]) != 2:
        probs.append("homonyms")
    return probs


def cmd_plan(args, registry):
    if (L2 / args.doc / "blueprint.json").is_file():
        return
    writer, domain = DOCS[args.doc]
    last = None
    for sample in range(6):
        c = client(registry, writer, BLUEPRINT_SCHEMA, "l2_blueprint", "You plan realistic engineering documents. Return JSON only.", sample)
        bp = json.loads(c.complete(PLAN_PROMPT.format(domain=domain, n=N_SECTIONS, n_split=N_SPLIT, n_short=N_SHORT, n_alias=N_ALIAS,
                                                      n_far=N_FAR_FLOW, n_far_alias=N_FAR_ALIAS)))
        probs = blueprint_problems(bp)
        print(f"plan sample {sample}: {'ok' if not probs else probs}")
        last = probs
        if not probs:
            bp["writer"], bp["plan_sample"], bp["domain"] = writer, sample, domain
            save(args.doc, "blueprint.json", bp)
            return
    raise SystemExit(f"no valid blueprint in 6 samples: {last}")


def item_surfaces(bp: dict) -> list[str]:
    ent = {e["entity_id"]: e["canonical"] for e in bp["entities"]}
    out = []
    for f in bp["split_flows"]:
        out.append(ent[f["item"]] + (f' (short form "{f["short_ref"]}")' if f["link_ref"] == "short" else ""))
    return out


def required_for(bp: dict, index: int) -> list[str]:
    ent = {e["entity_id"]: e["canonical"] for e in bp["entities"]}
    alias = {a["entity_id"]: a["alias"] for a in bp["aliases"]}
    req = []
    for a in bp["aliases"]:
        if a["intro_section"] == index:
            req.append(f'- tag "ALIAS:{a["entity_id"]}": a sentence that introduces the alias "{a["alias"]}" for {ent[a["entity_id"]]} (both names in the sentence).')
    for f in bp["split_flows"]:
        if f["intro_section"] == index:
            req.append(f'- tag "{f["probe_id"]}:intro": {ent[f["producer"]]} produces or sends the {ent[f["item"]]} (write this full item name). Do NOT name {ent[f["consumer"]]} or any receiver.')
        if f["link_section"] == index:
            if f["link_ref"] == "short":
                req.append(f'- tag "{f["probe_id"]}:link": {ent[f["consumer"]]} receives or uses the item, referred to ONLY as "{f["short_ref"]}" (do not write the full name {ent[f["item"]]}). Do NOT name {ent[f["producer"]]} or any sender.')
            else:
                req.append(f'- tag "{f["probe_id"]}:link": {ent[f["consumer"]]} receives or uses the {ent[f["item"]]} (write this full item name). Do NOT name {ent[f["producer"]]} or any sender.')
    for r in bp["alias_refs"]:
        if r["link_section"] == index:
            req.append(f'- tag "{r["probe_id"]}:link": a sentence where {ent[r["entity_id"]]} performs an action, sends something or is the subject of a requirement, referred to ONLY as "{alias[r["entity_id"]]}" (the full name must not appear in this sentence).')
    for h in bp["homonyms"]:
        if h["link_section"] == index:
            req.append(f'- tag "{h["probe_id"]}:link": {ent[h["entity_id"]]} (use this full qualified name) does something specific. Do not mention {ent[h["confusable_entity_id"]]} in this sentence.')
    return req or ["(none)"]


def write_md(doc_id: str, bp: dict, units: list[dict]) -> None:
    md = [f"# {bp['title']}", ""]
    for s in sorted(bp["sections"], key=lambda s: s["index"]):
        md += [f"## {s['index']}. {s['heading']}", "", " ".join(u["text"] for u in units if u["section"] == s["index"]), ""]
    (L2 / doc_id / "doc.md").write_text("\n".join(md), encoding="utf-8")


def cmd_write(args, registry):
    if (L2 / args.doc / "units.json").is_file():
        return
    bp = load(args.doc, "blueprint.json")
    c = client(registry, bp["writer"], SECTION_SCHEMA, "l2_section", "You write realistic engineering documents. Return JSON only.")
    entities = "; ".join(f"{e['canonical']} ({e['kind']})" for e in bp["entities"])
    previous = "(this is the first section)"
    for s in sorted(bp["sections"], key=lambda s: s["index"]):
        out = json.loads(c.complete(SECTION_PROMPT.format(index=s["index"], n=N_SECTIONS, title=bp["title"], heading=s["heading"],
                                                          flow_items="; ".join(item_surfaces(bp)), topic=s["topic"], entities=entities,
                                                          required="\n".join(required_for(bp, s["index"])), previous=previous)))
        save(args.doc, f"sections/{s['index']:02d}.json", out)
        previous = " ".join(x["text"] for x in out["sentences"][-2:])
        print(f"section {s['index']}: {len(out['sentences'])} sentences")
    units = []
    for s in sorted(bp["sections"], key=lambda s: s["index"]):
        for x in load(args.doc, f"sections/{s['index']:02d}.json")["sentences"]:
            units.append({"unit_id": f"S{len(units) + 1:03d}", "section": s["index"], "text": x["text"].strip(), "tags": x["tags"]})
    write_md(args.doc, bp, units)
    save(args.doc, "units.json", {"doc_id": args.doc, "title": bp["title"], "writer": bp["writer"], "units": units})
    print(f"{len(units)} units, {ntok(' '.join(u['text'] for u in units))} tokens")


def _contains(text: str, name: str) -> bool:
    return bool(name) and f" {norm_text(name)} " in f" {norm_text(text)} "


def cmd_check(args, registry):
    bp = load(args.doc, "blueprint.json")
    units = load(args.doc, "units.json")["units"]
    ent = {e["entity_id"]: e for e in bp["entities"]}
    alias = {a["entity_id"]: a["alias"] for a in bp["aliases"]}
    pos = {u["unit_id"]: i for i, u in enumerate(units)}
    tok = [ntok(u["text"]) for u in units]

    def tagged(tag):
        hits = [u for u in units if tag in u["tags"]]
        return hits[0] if len(hits) == 1 else None, len(hits)

    def window(u, w=BUDGET):
        i, out = pos[u["unit_id"]], []
        for step in (-1, 1):
            k, size = i + step, 0
            while 0 <= k < len(units) and size < w:
                out.append(units[k])
                size += tok[k]
                k += step
        return out

    def dist(a, b):
        i, j = sorted((pos[a["unit_id"]], pos[b["unit_id"]]))
        return sum(tok[i + 1:j])

    probes, report = [], []
    for f in bp["split_flows"]:
        (intro, ni), (link, nl) = tagged(f"{f['probe_id']}:intro"), tagged(f"{f['probe_id']}:link")
        prod, cons, item = (ent[f[k]]["canonical"] for k in ("producer", "consumer", "item"))
        short = short_core(f["short_ref"]) if f["link_ref"] == "short" else ""
        surfaces = [item] + ([short] if short else [])
        issues = []
        if not intro or not link:
            issues.append(f"tags intro={ni} link={nl}")
        else:
            if not _contains(intro["text"], item):
                issues.append("intro lacks item full name")
            if f["link_ref"] == "short":
                if _contains(link["text"], item) or not _contains(link["text"], short):
                    issues.append("link does not use short form only")
            elif not _contains(link["text"], item):
                issues.append("link lacks item full name")
            if _contains(intro["text"], cons):
                issues.append("consumer named in intro")
            if _contains(link["text"], prod):
                issues.append("producer named in link")
            own = {intro["unit_id"], link["unit_id"]}
            has_item = lambda t: any(_contains(t, s) for s in surfaces)  # noqa: E731
            shortcut = [u["unit_id"] for u in units if _contains(u["text"], prod) and _contains(u["text"], cons) and has_item(u["text"])]
            if shortcut:
                issues.append(f"shortcut sentence {shortcut}")
            elsewhere = [u["unit_id"] for u in units if u["unit_id"] not in own and has_item(u["text"])]
            if elsewhere:
                issues.append(f"item mentioned elsewhere {elsewhere}")
            near_link = [u["unit_id"] for u in window(link) if u["unit_id"] not in own and _contains(u["text"], prod) and has_item(u["text"])]
            near_intro = [u["unit_id"] for u in window(intro) if u["unit_id"] not in own and _contains(u["text"], cons) and has_item(u["text"])]
            if near_link:
                issues.append(f"producer+item within budget of link {near_link}")
            if near_intro:
                issues.append(f"consumer+item within budget of intro {near_intro}")
        rec = {"probe_id": f["probe_id"], "type": "split_flow", "producer": f["producer"], "consumer": f["consumer"], "item": f["item"],
               "link_ref": f["link_ref"], "short_ref": f["short_ref"] if f["link_ref"] == "short" else "",
               "intro_unit": intro and intro["unit_id"], "link_unit": link and link["unit_id"],
               "distance_tokens": dist(intro, link) if intro and link else None, "issues": issues}
        (probes if not issues else report).append(rec)
    for r in bp["alias_refs"]:
        intro, ni = tagged(f"ALIAS:{r['entity_id']}")
        link, nl = tagged(f"{r['probe_id']}:link")
        canon, al = ent[r["entity_id"]]["canonical"], alias[r["entity_id"]]
        issues = []
        if not intro or not link:
            issues.append(f"tags intro={ni} link={nl}")
        else:
            if not (_contains(intro["text"], canon) and _contains(intro["text"], al)):
                issues.append("alias intro lacks both names")
            if _contains(link["text"], canon) or not _contains(link["text"], re.sub(r"^the ", "", al, flags=re.I)):
                issues.append("link does not use alias only")
            # the alias must not be re-declared next to the link (that would make the reference local)
            near = [u["unit_id"] for u in window(link) if u["unit_id"] != link["unit_id"] and _contains(u["text"], canon) and _contains(u["text"], al)]
            if near:
                issues.append(f"alias declared within budget of link {near}")
        rec = {"probe_id": r["probe_id"], "type": "alias_ref", "entity_id": r["entity_id"], "alias": al,
               "intro_unit": intro and intro["unit_id"], "link_unit": link and link["unit_id"],
               "distance_tokens": dist(intro, link) if intro and link else None, "issues": issues}
        (probes if not issues else report).append(rec)
    for h in bp["homonyms"]:
        link, nl = tagged(f"{h['probe_id']}:link")
        issues = []
        if not link:
            issues.append(f"tags link={nl}")
        elif not _contains(link["text"], ent[h["entity_id"]]["canonical"]) or _contains(link["text"], ent[h["confusable_entity_id"]]["canonical"]):
            issues.append("link does not name exactly the intended entity")
        rec = {"probe_id": h["probe_id"], "type": "homonym", "entity_id": h["entity_id"], "confusable_entity_id": h["confusable_entity_id"],
               "shared_head": h["shared_head"], "link_unit": link and link["unit_id"], "distance_tokens": 0, "issues": issues}
        (probes if not issues else report).append(rec)
    ranged = [p for p in probes if p["type"] != "homonym"]
    far = [p for p in ranged if (p["distance_tokens"] or 0) > BUDGET]
    out = {"kept": probes, "rejected": report, "n_units": len(units), "doc_tokens": sum(tok),
           "far_share": len(far) / len(ranged) if ranged else 0.0, "budget": BUDGET}
    save(args.doc, "probes.check.json", out)
    print(f"kept {len(probes)}, rejected {len(report)}; doc {sum(tok)} tokens, {len(units)} units; far share {out['far_share']:.2f}")
    for r in report:
        print("  rejected", r["probe_id"], r["issues"])
    return out


REPAIR_SCHEMA = _obj({"rewrites": {"type": "array", "items": _obj({"unit_id": _str, "text": _str})}})
REPAIR_PROMPT = """Some sentences of a long document must be rewritten so that a planned long-range link is not revealed locally.
Rewrite ONLY the listed sentences. Keep each sentence's other content, style and length; keep it a single complete sentence ending with a period. Follow each instruction exactly and do not introduce any other system element names.

Document entities (canonical names): {entities}

Sentences to rewrite:
{items}
Return JSON {{"rewrites": [{{"unit_id": ..., "text": ...}}, ...]}}.
"""


def cmd_repair(args, registry):
    bp = load(args.doc, "blueprint.json")
    ent = {e["entity_id"]: e["canonical"] for e in bp["entities"]}
    alias = {a["entity_id"]: a["alias"] for a in bp["aliases"]}
    c = client(registry, bp["writer"], REPAIR_SCHEMA, "l2_repair", "You edit engineering documents precisely. Return JSON only.")
    for rnd in range(3):
        chk = load(args.doc, "probes.check.json")
        doc = load(args.doc, "units.json")
        text = {u["unit_id"]: u["text"] for u in doc["units"]}
        todo = {}
        for r in chk["rejected"]:
            for issue in r["issues"]:
                ids = re.findall(r"S\d{3}", issue)
                if r["type"] == "split_flow":
                    item = ent[r["item"]] + (f' (or "{r["short_ref"]}")' if r.get("short_ref") else "")
                    if issue.startswith("producer+item"):
                        for uid in ids:
                            todo[uid] = f'remove any mention of {ent[r["producer"]]} or of {item} (refer to it generically, e.g. "the data"), so the sentence no longer links them'
                    elif issue.startswith("consumer+item"):
                        for uid in ids:
                            todo[uid] = f'remove any mention of {ent[r["consumer"]]} or of {item} (refer to it generically), so the sentence no longer links them'
                    elif issue.startswith("item mentioned elsewhere"):
                        for uid in ids:
                            todo.setdefault(uid, f'remove any mention of {item} (refer to it generically, e.g. "such information"), keeping the rest of the sentence')
                    elif issue.startswith("shortcut"):
                        for uid in ids:
                            todo[uid] = f'do not name both {ent[r["producer"]]} and {ent[r["consumer"]]} together with {item}'
                elif r["type"] == "alias_ref" and issue.startswith("alias intro") and r.get("intro_unit"):
                    todo[r["intro_unit"]] = f'explicitly introduce the alias "{alias[r["entity_id"]]}" for {ent[r["entity_id"]]}, writing both names in this sentence'
                elif r["type"] == "alias_ref" and issue.startswith("alias declared within"):
                    for uid in ids:
                        todo[uid] = f'do not mention the alias "{alias[r["entity_id"]]}"; keep the full name {ent[r["entity_id"]]}'
        tagged_ids = {u["unit_id"] for u in doc["units"] if any(":" in t for t in u["tags"])}
        for uid in [k for k in todo if k in tagged_ids and not todo[k].startswith("explicitly introduce")]:
            del todo[uid]
        if not todo:
            print(f"round {rnd}: nothing to repair")
            return
        items = "\n".join(f'- {uid}: "{text[uid]}"  INSTRUCTION: {ins}' for uid, ins in todo.items())
        out = json.loads(c.complete(REPAIR_PROMPT.format(entities="; ".join(ent.values()), items=items)))
        new = {r["unit_id"]: r["text"].strip() for r in out["rewrites"] if r["unit_id"] in todo}
        for u in doc["units"]:
            if u["unit_id"] in new:
                u.setdefault("repairs", []).append(u["text"])
                u["text"] = new[u["unit_id"]]
        save(args.doc, "units.json", doc)
        write_md(args.doc, bp, doc["units"])
        print(f"round {rnd}: rewrote {len(new)} of {len(todo)} sentences")
        cmd_check(args, registry)


VERIFY_SCHEMA = _obj({"verdicts": {"type": "array", "items": _obj({"probe_id": _str, "supported": {"type": "boolean"}, "reason": _str})}})
VERIFY_PROMPT = """You check probe annotations of a long document. For each probe decide whether a careful reader of the WHOLE document would conclude the stated fact from the text (supported=true), or whether it is unsupported, contradicted or ambiguous (supported=false). Give a one-sentence reason.

Probe kinds:
- split_flow: the fact is "PRODUCER sends ITEM to CONSUMER". It must follow from the intro sentence (producer produces/sends the item) together with the link sentence (consumer receives/uses the item, possibly named by a shorter description), and the document must not suggest a different producer of that item or a different item matching the shorter description.
- alias_ref: the fact is "ALIAS in the link sentence denotes ENTITY", established by the alias intro sentence, and the alias is not used for anything else.
- homonym: the fact is "the link sentence is about ENTITY, not CONFUSABLE".

Document:
{doc}

Probes:
{probes}
Return JSON {{"verdicts": [...]}} with one verdict per probe.
"""


def cmd_verify(args, registry):
    bp = load(args.doc, "blueprint.json")
    units = load(args.doc, "units.json")["units"]
    chk = load(args.doc, "probes.check.json")
    ent = {e["entity_id"]: e["canonical"] for e in bp["entities"]}
    text = {u["unit_id"]: u["text"] for u in units}
    lines = []
    for p in chk["kept"]:
        if p["type"] == "split_flow":
            ref = f' (named "{p["short_ref"]}" in the link sentence)' if p.get("short_ref") else ""
            lines.append(f"{p['probe_id']} split_flow: PRODUCER={ent[p['producer']]}, ITEM={ent[p['item']]}{ref}, CONSUMER={ent[p['consumer']]}; "
                         f"intro {p['intro_unit']}: \"{text[p['intro_unit']]}\"; link {p['link_unit']}: \"{text[p['link_unit']]}\"")
        elif p["type"] == "alias_ref":
            lines.append(f"{p['probe_id']} alias_ref: ALIAS=\"{p['alias']}\", ENTITY={ent[p['entity_id']]}; "
                         f"alias intro {p['intro_unit']}: \"{text[p['intro_unit']]}\"; link {p['link_unit']}: \"{text[p['link_unit']]}\"")
        else:
            lines.append(f"{p['probe_id']} homonym: ENTITY={ent[p['entity_id']]}, CONFUSABLE={ent[p['confusable_entity_id']]}; "
                         f"link {p['link_unit']}: \"{text[p['link_unit']]}\"")
    verifier = other(bp["writer"])
    c = client(registry, verifier, VERIFY_SCHEMA, "l2_verify", "You are a meticulous annotation auditor. Return JSON only.")
    doc = "\n".join(f"{u['unit_id']}: {u['text']}" for u in units)
    out = json.loads(c.complete(VERIFY_PROMPT.format(doc=doc, probes="\n".join(lines))))
    save(args.doc, f"probes.{verifier}.verify.json", out)
    verdict = {v["probe_id"]: v for v in out["verdicts"]}
    kept = [p for p in chk["kept"] if verdict.get(p["probe_id"], {}).get("supported")]
    for p in chk["kept"]:
        v = verdict.get(p["probe_id"])
        if not v or not v["supported"]:
            print("  dropped", p["probe_id"], v and v["reason"])
    aliases = {}
    for a in bp["aliases"]:
        aliases.setdefault(a["entity_id"], []).append(a["alias"])
    entities = [{"entity_id": e["entity_id"], "canonical": e["canonical"], "kind": e["kind"], "aliases": aliases.get(e["entity_id"], [])}
                for e in bp["entities"]]
    ranged = [p for p in kept if p["type"] != "homonym"]
    gt = {"doc_id": args.doc, "writer": bp["writer"], "verifier": verifier, "budget": BUDGET, "doc_tokens": chk["doc_tokens"],
          "far_share": sum((p["distance_tokens"] or 0) > BUDGET for p in ranged) / len(ranged) if ranged else 0.0,
          "entities": entities, "probes": [{k: v for k, v in p.items() if k != "issues"} for p in kept]}
    save(args.doc, "probes.gt.json", gt)
    n_by = {t: sum(p["type"] == t for p in kept) for t in ("split_flow", "alias_ref", "homonym")}
    n_short = sum(p.get("link_ref") == "short" for p in kept)
    print(f"probe GT: {len(kept)} probes {n_by}, short-ref flows {n_short}, far share {gt['far_share']:.2f}")


def cmd_all(args, registry):
    cmd_plan(args, registry)
    cmd_write(args, registry)
    if (L2 / args.doc / "probes.gt.json").is_file():
        print("probes.gt.json exists")
        return
    cmd_check(args, registry)
    cmd_repair(args, registry)
    cmd_verify(args, registry)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["plan", "write", "check", "repair", "verify", "all"])
    ap.add_argument("--doc", required=True, choices=sorted(DOCS))
    args = ap.parse_args()
    load_dotenv_if_present()
    registry = load_registry(REGISTRY)
    {"plan": cmd_plan, "write": cmd_write, "check": cmd_check, "repair": cmd_repair, "verify": cmd_verify, "all": cmd_all}[args.command](args, registry)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
