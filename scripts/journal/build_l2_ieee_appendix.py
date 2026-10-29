"""Generate paper-long/ieee-access/appendix.tex: one far probe followed through the whole pipeline.

    python scripts/journal/build_l2_ieee_appendix.py [--doc L2T1 --model gpt-6.1-sol --cond OL --sample 0 --probe F1]

Every listing is taken from the frozen run files (experiments/journal-v1/l2/<doc>/...), the verifier cache and
the deterministic consolidation code; nothing is hand-written except the prose. The memory block is rebuilt
from the run ledger with the same selector the run used (the run files keep token counts, not the block text).
"""
from __future__ import annotations

import argparse
import json
import pathlib
import sys
import textwrap

ROOT = pathlib.Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))
from t2m_eval.l2_ledger import clean, join, select  # noqa: E402
from t2m_eval.l2_sysml import render  # noqa: E402
from t2m_eval.long_memory import Registry, resolve_facts  # noqa: E402

sys.path.insert(0, str(ROOT / "scripts" / "journal"))
import run_l2  # noqa: E402

EXP = ROOT / "experiments" / "journal-v1"
OUT = ROOT / "paper-long" / "ieee-access" / "appendix.tex"
WIDTH = 58  # characters per listing line in one IEEE Access column at \footnotesize


def wrap_json(obj, width=WIDTH) -> str:
    s = json.dumps(obj, ensure_ascii=False, indent=1)
    out = []
    for line in s.splitlines():
        ind = len(line) - len(line.lstrip())
        out += textwrap.wrap(line, width, subsequent_indent=" " * (ind + 2)) or [""]
    return "\n".join(out)


def wrap_text(s: str, width=WIDTH) -> str:
    return "\n".join(l2 for line in s.splitlines() for l2 in (textwrap.wrap(line, width, subsequent_indent="  ") or [""]))


def listing(body: str, caption: str, label: str) -> str:
    assert r"\end{lstlisting}" not in body
    return (f"\\begin{{lstlisting}}[caption={{{caption}}},label={{{label}}}]\n{body}\n\\end{{lstlisting}}\n")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--doc", default="L2T1")
    ap.add_argument("--model", default="gpt-6.1-sol")
    ap.add_argument("--cond", default="OL")
    ap.add_argument("--sample", type=int, default=0)
    ap.add_argument("--probe", default="F1")
    a = ap.parse_args()

    D = EXP / "l2" / a.doc
    units = json.load(open(D / "units.json", encoding="utf-8"))["units"]
    byid = {u["unit_id"]: u for u in units}
    pos = {u["unit_id"]: i for i, u in enumerate(units)}
    probes = json.load(open(D / "probes.gt.json", encoding="utf-8"))
    plist = probes["probes"] if isinstance(probes, dict) and "probes" in probes else probes
    probe = next(p for p in plist if p["probe_id"] == a.probe)
    run = json.load(open(D / "runs" / a.model / a.cond / f"s{a.sample}.json", encoding="utf-8"))
    ntok = run_l2.ntok
    intro, link = probe["intro_unit"], probe["link_unit"]
    calls = [c for c in run["calls"] if c["kind"] == "extract"]
    chunk_of = lambda uid: next(i for i, c in enumerate(calls) if pos[c["units"][0]] <= pos[uid] <= pos[c["units"][1]])
    ci, cl = chunk_of(intro), chunk_of(link)
    n_facts, n_ents = len(run["facts"]), len(run["entities"])

    # --- A.1 input
    sents = "\n".join(f"{u}: {byid[u]['text']}" for u in (intro, link))
    probe_l = wrap_json({k: probe[k] for k in ("probe_id", "type", "producer", "consumer", "item", "link_ref", "short_ref",
                                                "intro_unit", "link_unit", "distance_tokens") if k in probe})
    chunks_l = "\n".join(f"call {i + 1:2d}: {c['units'][0]}-{c['units'][1]}  chunk {c['chunk_tokens']:3d} tok  memory {c['memory_tokens']:3d} tok"
                         for i, c in enumerate(calls))

    # --- A.2 chunk outputs at the two sentences
    raw = [f for f in run["facts"] if f["unit_id"] in (intro, link)]
    ents = list({e["name"]: e for e in run["entities"] if e.get("aliases")}.values())[:3]  # one row per name

    # --- A.3 memory block rebuilt for the chunk that contains the link sentence
    start = calls[cl]["units"][0]
    earlier_units = {u["unit_id"] for u in units[:pos[start]]}
    early = [f for f in clean(run["facts"]) if f["unit_id"] in earlier_units]
    reg = Registry()
    first = {}
    for f in early:  # first sentence at which each name occurs in an earlier fact
        for v in [f.get(k) for k in ("performer", "owner", "subject", "source", "target", "whole", "from", "to", "action", "payload")] + list(f.get("parts") or []):
            if isinstance(v, str) and v and v not in first:
                first[v] = f["unit_id"]
    mentioned = set(first)
    for e in run["entities"]:
        if e["name"] in mentioned or any(al in mentioned for al in e.get("aliases", [])):
            reg.update([e], first.get(e["name"]) or next((first[al] for al in e["aliases"] if al in first), None))
    early = resolve_facts(reg, early)
    chunk = [u for u in units if pos[start] <= pos[u["unit_id"]] <= pos[calls[cl]["units"][1]]]
    mem = select(run_l2.MEMORY_KIND[a.cond], reg, early, chunk, run_l2.MEMORY, ntok) if a.cond in run_l2.MEMORY_KIND else ""
    mem_tok = ntok(mem)
    # show the head of every section of the block; the full block is in the run data
    KEEP = 4
    mem_lines, kept, hidden = mem.splitlines(), [], 0
    for ln in mem_lines:
        if not ln.startswith("- "):
            if hidden:
                kept.append(f"  ... {hidden} more rows ...")
            kept.append(ln)
            n_in_sec, hidden = 0, 0
        elif n_in_sec < KEEP:
            kept.append(ln)
            n_in_sec += 1
        else:
            hidden += 1
    if hidden:
        kept.append(f"  ... {hidden} more rows ...")
    mem_l = wrap_text("\n".join(kept))
    item_in_mem = lambda core: core.lower() in mem.lower()  # noqa: E731 - resolved once the joined flow is known

    # --- A.4 consolidation on the full ledger
    reg_all = Registry()
    reg_all.update(run["entities"], units[0]["unit_id"])
    facts = resolve_facts(reg_all, clean(run["facts"]))
    allf, held = join(facts, "named")
    joined = [f for f in allf if f.get("joined")]
    target = next(f for f in joined if intro in f["evidence_units"] and link in f["evidence_units"])
    core = target["payload"].split(" ", 1)[1] if target["payload"].lower().startswith("the ") else target["payload"]
    alias_ex = next((e for e in run["entities"] if e.get("aliases") and e["name"] == target["source"]), ents[0])
    held_ex = held[0] if held else None
    if held_ex is None:  # take a held case from another run of the same document
        for p in sorted((D / "runs" / a.model).glob("*/s*.json")):
            r2 = json.load(open(p, encoding="utf-8"))
            rg = Registry(); rg.update(r2["entities"], units[0]["unit_id"])
            _, h2 = join(resolve_facts(rg, clean(r2["facts"])), "named")
            if h2:
                held_ex, held_src = h2[0], f"{p.parent.name}/{p.name}"
                break
    else:
        held_src = f"{a.cond}/s{a.sample}.json"

    # --- A.5 verification record from the cross-vendor verifier cache
    verifier = run_l2.VERIFIER[a.model]
    vrec = None
    for p in (EXP / "cache" / "l2-verify" / verifier).glob("*.json"):
        d = json.load(open(p, encoding="utf-8"))
        if d.get("sample") == a.sample and f'"{target["payload"]}"' in d.get("prompt", "") and target["source"] in d["prompt"]:
            vrec = d
            break
    assert vrec, "verifier cache record not found"
    vp = vrec["prompt"]
    cand = vp[vp.index("Candidate:"):vp.index("Answer \"supported\"")].strip()
    vresp = json.loads(vrec["response"]) if isinstance(vrec["response"], str) else vrec["response"]

    # --- A.6 rendered SysML v2
    text, stats = render(allf)
    key = "".join(w.capitalize() for w in target["payload"].replace("-", " ").split())
    sys_lines = [l.strip() for l in text.splitlines() if key in l or core in l]
    sys_l = wrap_text("\n".join(sys_lines))

    tex = []
    w = tex.append
    w(r"\appendices")
    w(r"\section{One Far Probe Through the Pipeline}\label{app:example}")
    w(textwrap.dedent(f"""
    This appendix follows one far probe of test document {a.doc} ({byid[units[0]['unit_id']]['text'].split(' is ')[0]})
    through every step of Fig.~\\ref{{fig:pipeline}}, using the frozen run files of \\texttt{{{a.model}}} under condition
    {a.cond} (sample {a.sample}; samples are the run indices 0--2). The listings are copied from the data; only the memory block is rebuilt from the run
    ledger with the selector the run used, because run files record token counts rather than block text.
    The steps are:
    \\begin{{enumerate}}
    \\item \\textbf{{Input.}} The document is a sequence of sentence units; the probe names a producer sentence and a
    consumer sentence that lie {probe['distance_tokens']:,} tokens apart (Listings~\\ref{{lst:sent}}--\\ref{{lst:chunks}}).
    \\item \\textbf{{Chunk-local extraction.}} Each call receives one chunk and, under {a.cond}, a memory block rebuilt from
    the ledger; it returns typed facts with filled slots and a list of entities with declared aliases
    (Listings~\\ref{{lst:facts}}--\\ref{{lst:mem}}). The two ends of the probe are extracted in calls {ci + 1} and {cl + 1}
    as separate local facts; no call sees both sentences.
    \\item \\textbf{{Ledger.}} Call outputs are appended to one JSON ledger per run: \\texttt{{facts}} ({n_facts:,} rows),
    \\texttt{{entities}} ({n_ents:,} per-call rows, not deduplicated), \\texttt{{calls}} and wall time.
    \\item \\textbf{{Consolidation without model calls.}} R replaces aliases by canonical names; RN completes the
    consumer-side fact with the unique named item and its single producer, recording the evidence sentences, or
    holds the case (Listings~\\ref{{lst:alias}}--\\ref{{lst:held}}).
    \\item \\textbf{{Evidence re-reading.}} The joined flow is sent to the other vendor's model with only the evidence
    sentences and the sentence before each (Listings~\\ref{{lst:verify}}--\\ref{{lst:verdict}}).
    \\item \\textbf{{Rendering.}} The consolidated ledger is rendered as SysML~v2 text and checked by the language server
    (Listing~\\ref{{lst:sysml}}); for this run the rendered model has {stats['elements']} elements, {stats['flows']} flows and
    {stats['actions']} actions with no parser error.
    \\end{{enumerate}}
    """).strip())
    w("")
    w(r"\subsection{Input: sentences, probe and chunking}")
    w(listing(wrap_text(sents), f"The two probe sentences of {a.doc} (producer at {intro}, consumer at {link}).", "lst:sent"))
    w(listing(probe_l, "Probe record written by the document writer and verified before the run; element identifiers are the writer's blueprint keys.", "lst:probe"))
    w(listing(chunks_l, f"Extraction calls of the run (condition {a.cond}): sentence range, chunk tokens and memory tokens. "
                        f"{intro} falls in call {ci + 1}, {link} in call {cl + 1}.", "lst:chunks"))
    w(r"\subsection{Chunk-local extraction and the ledger}")
    w(listing(wrap_json(raw), f"Ledger rows produced for {intro} and {link}: the producer side is an action, the consumer side an action "
                              "naming the item by its shortened reference; no flow connects them yet.", "lst:facts"))
    w(listing(wrap_json(ents), "Entity rows with declared aliases (project codenames) from the same ledger; the registry R maps each alias to the canonical name.", "lst:ents"))
    w(listing(mem_l, f"Memory block given with call {cl + 1} (rebuilt block of {mem_tok} tokens within the {run_l2.MEMORY}-token budget; the run file logs {calls[cl]['memory_tokens']} tokens for this call, the rebuild differing by the lines cut at the budget): open produced items that the chunk may refer to "
                     "come first, then registry rows for elements the chunk mentions, then earlier facts; the block is cut at the budget. "
                     "Only the head of each section is shown. "
                     + ("The probe item is among the open items." if item_in_mem(core) else
                        "The probe item is not in the block because its producer side was extracted as an action rather than a flow "
                        "and the open-item list indexes flow facts only (Section~\\ref{sec:method}); the join, which also indexes "
                        "producer actions, recovers it from the ledger."), "lst:mem"))
    w(r"\subsection{Consolidation}")
    w(listing(wrap_json(alias_ex), "Registry entry used by R for the producer in this probe.", "lst:alias"))
    w(listing(wrap_json(target), "Flow added by the named-item join RN: match 2 means the consumer named the item by head noun plus a modifier; "
                                 "the two evidence sentences are kept for verification.", "lst:join"))
    if held_ex:
        held_lbl = held_src.replace("/s", ", sample ").replace(".json", "")
        w(listing(wrap_json(held_ex), f"A held case (from condition {held_lbl}): the join is refused and the reason recorded instead of guessing.", "lst:held"))
    w(r"\subsection{Evidence re-reading}")
    w(listing(wrap_text(cand), f"Candidate and evidence sent to the verifier (\\texttt{{{verifier}}}); the instruction text of the prompt is omitted; the candidate line is the verifier template's rendering of the join (\\emph{{provides}}), not the ledger label's wording.", "lst:verify"))
    w(listing(wrap_json(vresp), "Verifier answer; the join is kept only on \"supported\".", "lst:verdict"))
    w(r"\subsection{Rendered SysML v2}")
    w(listing(sys_l, "Lines of the rendered SysML~v2 model that carry the probe item: the item definition, the producer action and the joined flow "
                     "with its evidence sentences in a doc comment. The item definition name keeps the article of the payload surface; the frozen renderer does not strip articles.", "lst:sysml"))
    # --- Appendix B: the exact matching algorithm (revision 2; lists are read from the frozen module, not retyped)
    from t2m_eval import l2_ledger as LL
    w(r"\section{Matching Algorithm}\label{app:pseudocode}")
    w("This appendix states the consolidation algorithm exactly as implemented in the frozen module "
      r"\texttt{src/t2m\_eval/l2\_ledger.py}; the word lists below are read from that module when this appendix is generated. "
      "Text is normalized (lower case, punctuation removed) before comparison; \\emph{content words} are the normalized words not "
      "in the stop list.")
    pseudo = """R  (alias resolution)
  registry := declared aliases of every chunk, first-seen
             canonical name wins; alias -> canonical
  every entity slot of every fact := registry[value]

PRODUCER INDEX  item -> producer -> evidence units
  for each fact f:
    flow with source and payload:
        index[f.payload][f.source] += f.unit
    action with performer and label whose first
    non-adverb verb starts with a PRODUCE prefix and
    whose object (label cut at the first BOUNDARY word)
    has >= 2 content words:
        index[object][f.performer] += f.unit

CONSUMER SIDE  (consumer, text naming the item)
  flow with target and payload but no source:
        (f.target, f.payload)
  action whose verb starts with a CONSUME prefix:
        (f.performer, object)

HEAD_MATCH(item, text) -> 3 | 2 | 0
  3  if the normalized item string occurs in text
  2  if item has >= 2 content words, its last word
     (head noun) is in text and at least one other
     content word of the item is in text
  0  otherwise

NAMED(item)  >= 2 content words, each starting with
  an upper-case letter or a digit

JOIN(mode in {exact, head, named})
  for each consumer-side fact (consumer, text):
    scores := {}
    for each item in index:
      skip if mode = named and not NAMED(item)
      s := HEAD_MATCH(item, text)
      if mode = exact and s < 3: s := 0
      if the fact is a flow and s = 0 and
         norm(item) = norm(text): s := 3
      if s > 0: scores[item] := s
    drop one-word items unless the fact is a flow
      whose payload equals the item exactly
    if scores is empty: continue
    best := max score; items := {i : scores[i] = best}
    if |items| != 1: HOLD "ambiguous item"; continue
    producers := index[item] minus the consumer
    if |producers| != 1:
        if producers nonempty: HOLD "several producers"
        continue
    if a flow (producer, consumer, item) already
       exists: continue
    COMMIT flow producer -> consumer carrying item,
       match := best, evidence := producer units + unit

V  (evidence re-reading, RHV/RNV)
  for each committed flow: send the evidence units,
  the unit before each, and the alias declarations of
  both ends (<= 1,024 tokens) to the other vendor's
  model; keep only verdict "supported"; a call error
  withdraws the flow and is counted."""
    w(listing(pseudo, "Consolidation and join algorithm (R, RJ/RH/RN, V) as implemented in the frozen module.", "lst:pseudo"))
    lists = (f"PRODUCE  = {wrap_text(', '.join(LL.PRODUCE), WIDTH - 2)}\n\n"
             f"CONSUME  = {wrap_text(', '.join(LL.CONSUME), WIDTH - 2)}\n\n"
             f"STOP     = {wrap_text(', '.join(sorted(LL.STOP)), WIDTH - 2)}\n\n"
             f"BOUNDARY = {wrap_text(', '.join(sorted(LL.BOUNDARY)), WIDTH - 2)}\n\n"
             f"MISSING  = {', '.join(sorted(LL.MISSING))}")
    w(listing(lists, "Word lists of the frozen module (verb prefixes match the start of the first verb; the stop and boundary lists are "
                     "exact words). These lists were set during the three development rounds and are the tunable part of the heuristic.", "lst:lists"))
    OUT.write_text("\n".join(tex) + "\n", encoding="utf-8")
    print(OUT, len(tex), "blocks; memory", mem_tok, "tok; held example:", bool(held_ex), held_src if held_ex else "")


if __name__ == "__main__":
    main()
