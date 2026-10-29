#!/usr/bin/env python3
"""L2 long-document study: bounded-context memory and global consolidation (plan §20).

Conditions (same extractor prompt t2m_eval.long_memory.MEM_PROMPT, same model per run):
  F    whole document, one call (no budget; upper reference)
  C1   chunks of <= 1024 document tokens, no memory
  C2   chunks of <= 512 + rolling natural-language summary <= 512 (summary written by a separate call)
  C4   chunks of <= 512 + graph memory <= 512 (registry rows + facts naming chunk elements; = L1 C4)
  OL   chunks of <= 512 + open-ledger memory <= 512 (open producer ends matched by head noun first)

Variants scored per run (consolidation needs no model calls; verification does):
  raw     facts as extracted
  R       + alias resolution with the registry of all declared aliases
  RJ      + exact-name join of one-ended flows (L1 reconcile rule)
  RH      + head-noun join (shortened references)
  RHV     + every joined flow re-read against its evidence sentences (<= 1024 tokens per check);
          unsupported or uncertain joins are withdrawn

    python scripts/journal/run_l2.py run    --docs L2DEV --models gpt-5.5 --samples 3
    python scripts/journal/run_l2.py report --docs L2DEV --models gpt-5.5 --samples 3

Runs are written once (experiments/journal-v1/l2/<DOC>/runs/<model>/<cond>/s<k>.json) and every
model call is cached (cache/l2-runs/<model>), so ``report`` re-scores offline.
"""

from __future__ import annotations

import argparse
import json
import statistics
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))

import tiktoken  # noqa: E402

from t2m_eval.l2_ledger import clean, fit_text, head_match, join, select  # noqa: E402
from t2m_eval.l2_sysml import render  # noqa: E402
from t2m_eval.long_doc import CanonicalAligner, chunk_units, score_probes  # noqa: E402
from t2m_eval.long_memory import MEM_SCHEMA, Registry, mem_prompt, parse, resolve_facts  # noqa: E402
from t2m_eval.normalize import norm_text  # noqa: E402
from t2m_pipeline.llm_clients import CachedClient, load_registry, make_client  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

EXP = ROOT / "experiments" / "journal-v1"
L2 = EXP / "l2"
ENC = tiktoken.get_encoding("o200k_base")
CHUNK, MEMORY, V = 512, 512, 1024
CONDS = ("F", "C1", "C2", "C4", "OL")
MEMORY_KIND = {"C2": "summary", "C4": "graph", "OL": "ledger"}
SYSTEM = "You are a SysML v2 modeler. Return JSON only."
_lock = threading.Lock()


def ntok(text: str) -> int:
    return len(ENC.encode(text))


def usage_of(c) -> dict:
    u = c.last_usage or {}
    return {"input": u.get("input_tokens", u.get("prompt_tokens")), "output": u.get("output_tokens", u.get("completion_tokens")),
            "reasoning": (u.get("output_tokens_details") or {}).get("reasoning_tokens"), "cached": c.last_hit}


SUMMARY_SCHEMA = {"type": "object", "properties": {"summary": {"type": "string"}}, "required": ["summary"], "additionalProperties": False}
SUMMARY_PROMPT = """You maintain a running summary of a long engineering document that is being read part by part, so that a later reader can model the system in SysML v2 without seeing the earlier parts.
Update the summary with the new part. Keep, as compactly as possible: the full names of system elements, actors and items; every alias or call sign with the full name it stands for; which element produces, sends or receives which item; modes and normative requirements. At most 300 words.

Current summary:
{summary}

New part:
{units}

Return JSON {{"summary": "..."}}."""


def extractor(spec, model, sample, whole=False):
    spec = {**spec, "max_output_tokens": 100000 if whole else spec.get("max_output_tokens", 32768)}
    return CachedClient(make_client(spec, schema=MEM_SCHEMA, schema_name="sysml_facts_entities", system_prompt=SYSTEM),
                        EXP / "cache" / "l2-runs" / model, sample=sample)


def run(spec, model, units, cond, sample) -> dict:
    c = extractor(spec, model, sample, whole=cond == "F")
    if cond == "F":
        parts = [units]
    elif cond == "C1":
        parts = chunk_units(units, V, ntok)
    else:
        parts = chunk_units(units, CHUNK, ntok)
    summarizer = None
    if cond == "C2":
        summarizer = CachedClient(make_client(spec, schema=SUMMARY_SCHEMA, schema_name="running_summary",
                                              system_prompt="You summarize engineering documents. Return JSON only."),
                                  EXP / "cache" / "l2-runs" / model, sample=sample)
    reg, facts, entities, calls, summary = Registry(), [], [], [], ""
    for part in parts:
        memory = select(MEMORY_KIND[cond], reg, facts, part, MEMORY, ntok, summary) if cond in MEMORY_KIND else ""
        prompt = mem_prompt(part, memory)
        payload = json.loads(c.complete(prompt))
        ents, fs = parse(payload)
        reg.update(ents, part[0]["unit_id"])
        entities.extend(ents)
        facts.extend(fs)
        calls.append({"kind": "extract", "units": [part[0]["unit_id"], part[-1]["unit_id"]], "chunk_tokens": sum(ntok(u["text"]) for u in part),
                      "memory_tokens": ntok(memory), "prompt_tokens": ntok(prompt), **usage_of(c)})
        if summarizer is not None:
            raw = json.loads(summarizer.complete(SUMMARY_PROMPT.format(summary=summary or "(empty)",
                                                                       units="\n".join(f"{u['unit_id']}: {u['text']}" for u in part))))["summary"]
            summary = fit_text(raw, MEMORY, ntok)
            calls.append({"kind": "summary", "summary_tokens_raw": ntok(raw), "summary_tokens": ntok(summary), **usage_of(summarizer)})
    return {"facts": facts, "entities": entities, "calls": calls}


VERIFY_SCHEMA = {"type": "object", "properties": {"verdict": {"type": "string", "enum": ["supported", "unsupported", "uncertain"]},
                                                  "reason": {"type": "string"}},
                 "required": ["verdict", "reason"], "additionalProperties": False}
VERIFY_PROMPT = """Check one candidate model relation against the source sentences of a long document. The sentences come from different places in the document; unit ids show their order.

Candidate: {source} provides "{payload}" to {target} (an information or material flow).

Source sentences:
{evidence}

Answer "supported" only if the sentences state that {source} produces or sends this item AND that {target} receives or uses the same item (it may be named more briefly in one sentence). Answer "unsupported" if they describe different items, the wrong elements or the opposite direction. Answer "uncertain" if the text is not clear enough. Return JSON {{"verdict": ..., "reason": "one sentence"}}."""


VERIFIER = {"gpt-6.1-sol": "claude-opus-5-5", "claude-opus-5-5": "gpt-6.1-sol"}  # cross-vendor; other models self-verify


def verify_joins(spec, model, sample, joined: list[dict], units: list[dict], reg: Registry, cache: str = "l2-verify") -> tuple[list[dict], list[dict]]:
    """Stage 3: re-read each joined flow's evidence sentences (plus the sentence before each and any
    alias declarations of the endpoints) within the 1024-token variable budget."""
    c = CachedClient(make_client(spec, schema=VERIFY_SCHEMA, schema_name="flow_check",
                                 system_prompt="You check model relations against source text. Return JSON only."),
                     EXP / "cache" / cache / model, sample=sample)
    pos = {u["unit_id"]: i for i, u in enumerate(units)}
    kept, log = [], []
    for f in joined:
        ids = []
        for uid in f["evidence_units"]:
            if uid in pos:
                i = pos[uid]
                ids += [units[i - 1]["unit_id"]] if i > 0 else []
                ids.append(uid)
        for name in (f["source"], f["target"]):  # alias declarations: first unit where the canonical name was registered
            first = reg.first.get(name)
            if first in pos and reg.aliases.get(name):
                ids.append(first)
        ids = sorted(dict.fromkeys(ids), key=pos.get)
        lines = [f"{units[pos[i]]['unit_id']}: {units[pos[i]]['text']}" for i in ids]
        evidence = fit_text("\n".join(lines), V, ntok) if ntok("\n".join(lines)) > V else "\n".join(lines)
        prompt = VERIFY_PROMPT.format(source=f["source"], target=f["target"], payload=f["payload"], evidence=evidence)
        try:
            out = json.loads(c.complete(prompt))
            verdict = out["verdict"]
        except Exception as e:  # noqa: BLE001 - a failed check withdraws the join
            out, verdict = {"error": f"{type(e).__name__}: {str(e)[:200]}"}, "error"
        log.append({"flow": {k: f[k] for k in ("source", "target", "payload", "unit_id")}, "verdict": verdict,
                    "evidence_tokens": ntok(evidence), **usage_of(c)})
        if verdict == "supported":
            kept.append(f)
    return kept, log


JUDGE = "claude-sonnet-5-5"  # third model (not an L2 test extractor or join verifier) for join precision; was gpt-5.5 before amendment 1


def judge_joins(registry, sample, joined: list[dict], units: list[dict], reg: Registry) -> dict:
    """Independent precision estimate of joined flows: same evidence, different model, separate cache."""
    spec = registry[JUDGE]
    _, log = verify_joins(spec, JUDGE, sample, joined, units, reg, cache="l2-judge")
    n = len(log)
    sup = sum(x["verdict"] == "supported" for x in log)
    return {"judged": n, "judge_supported": sup, "judge_precision": sup / n if n else None}


def variants(rec: dict, cond: str, verify_fn=None, judge_fn=None) -> dict:
    reg = Registry()
    reg.update(rec["entities"])
    facts = clean(rec["facts"])
    resolved = resolve_facts(reg, facts)
    out = {"raw": (facts, {}), "R": (resolved, {})}
    for tag, mode in (("RJ", "exact"), ("RH", "head"), ("RN", "named")):
        j, held = join(resolved, mode)
        out[tag] = (j, {"joined": len(j) - len(resolved), "held": len(held)})
    for tag in ("RH", "RN"):
        joined = [f for f in out[tag][0] if f.get("joined")]
        if judge_fn is not None:
            out[tag] = (out[tag][0], {**out[tag][1], **judge_fn(joined, reg)})
        if verify_fn is not None:
            kept, log = verify_fn(joined, reg)
            info = {"joined": len(joined), "kept": len(kept), "checks": log}
            if judge_fn is not None:
                info.update(judge_fn(kept, reg))
            out[tag + "V"] = (resolved + kept, info)
    return out


def extra_metrics(gt: dict, facts: list[dict]) -> dict:
    """Wrong commitments: flows that deliver a probe item to its consumer from another producer."""
    align = CanonicalAligner(gt["entities"])
    names = {e["entity_id"]: e["canonical"] for e in gt["entities"]}
    wrong, flows = 0, [f for f in facts if f.get("type") == "flow"]
    for p in gt["probes"]:
        if p["type"] != "split_flow":
            continue
        short = norm_text(p.get("short_ref"))
        for f in flows:
            pay = f.get("payload")
            if not pay or not (head_match(names[p["item"]], pay) >= 2 or (short and norm_text(pay) == short)):
                continue
            src = align(f.get("source"))
            if align(f.get("target")) == p["consumer"] and f.get("source") and src != p["producer"]:
                wrong += 1
                break
    return {"wrong_producer_probes": wrong}


def score(gt: dict, facts: list[dict]) -> dict:
    sc = score_probes(gt, facts)
    ranged = [x for x in sc["probes"] if x["type"] != "homonym"]
    far = [x for x in ranged if x["distance_tokens"] > gt["budget"]]
    meta = {p["probe_id"]: p for p in gt["probes"]}
    rate = lambda xs: sum(x["hit"] for x in xs) / len(xs) if xs else None  # noqa: E731
    flows = [x for x in far if x["type"] == "split_flow"]
    return {"far": rate(far), "far_flow": rate(flows), "far_alias": rate([x for x in far if x["type"] == "alias_ref"]),
            "flow_full": rate([x for x in flows if meta[x["probe_id"]].get("link_ref") != "short"]),
            "flow_short": rate([x for x in flows if meta[x["probe_id"]].get("link_ref") == "short"]),
            "forbidden": sc["forbidden_rate"], "alias_unresolved": sc["alias_unresolved_rate"],
            "hits": {x["probe_id"]: x["hit"] for x in sc["probes"]}, **extra_metrics(gt, facts)}


def doc_inputs(doc: str):
    base = L2 / doc
    units = [{"unit_id": u["unit_id"], "text": u["text"]} for u in json.loads((base / "units.json").read_text(encoding="utf-8"))["units"]]
    gt = json.loads((base / "probes.gt.json").read_text(encoding="utf-8"))
    return base, units, gt


def cmd_run(args, registry):
    jobs = [(d, m, c, s) for d in args.docs for m in args.models for c in args.conditions for s in range(args.samples)]

    def work(job):
        d, m, c, s = job
        base, units, gt = doc_inputs(d)
        p = base / "runs" / m / c / f"s{s}.json"
        if p.is_file():
            return
        t0 = time.time()
        try:
            rec = run(registry[m], m, units, c, s)
        except Exception as e:  # noqa: BLE001 - an unusable output is a result of the condition
            rec = {"failed": True, "error": f"{type(e).__name__}: {str(e)[:400]}", "facts": [], "entities": [], "calls": []}
        rec["wall_s"] = round(time.time() - t0, 1)
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(json.dumps(rec, ensure_ascii=False, indent=1), encoding="utf-8")
        with _lock:
            print(f"{d} {m} {c} s{s}: {'FAILED ' + rec['error'][:120] if rec.get('failed') else str(len(rec['facts'])) + ' facts'} ({rec['wall_s']}s)", flush=True)

    with ThreadPoolExecutor(args.workers) as pool:
        list(pool.map(work, jobs))


class _Lsp:
    """One shared selab-rust-lsp session; analyses are serialized."""

    def __init__(self):
        from t2m_eval.sysml_graph import SysmlGraphClient
        self.client = SysmlGraphClient().__enter__()
        self.lock = threading.Lock()

    def check(self, facts):
        text, stats = render(facts)
        with self.lock:
            g = self.client.analyze(text)
        return {"sysml_errors": len(g.errors), "sysml_nodes": len(g.nodes), "sysml_flow_edges": len(g.edges_of("flow")), **stats}


def cmd_report(args, registry):
    rows, failures = [], []
    lsp = _Lsp() if args.sysml else None
    vjobs = []
    for d in args.docs:
        base, units, gt = doc_inputs(d)
        for m in args.models:
            for c in args.conditions:
                for s in range(args.samples):
                    p = base / "runs" / m / c / f"s{s}.json"
                    if not p.is_file():
                        failures.append({"doc": d, "model": m, "cond": c, "sample": s, "error": "missing"})
                        continue
                    rec = json.loads(p.read_text(encoding="utf-8"))
                    if rec.get("failed"):
                        failures.append({"doc": d, "model": m, "cond": c, "sample": s, "error": rec["error"]})
                        continue
                    vjobs.append((d, m, c, s, rec, units, gt))

    def work(job):
        d, m, c, s, rec, units, gt = job
        vm = VERIFIER.get(m, m)
        vf = (lambda joined, reg: verify_joins(registry[vm], vm, s, joined, units, reg)) if args.verify else None
        out = []
        jf = (lambda joined, reg: judge_joins(registry, s, joined, units, reg)) if args.judge else None
        for v, (facts, info) in variants(rec, c, vf, jf).items():
            ext = [x for x in rec["calls"] if x["kind"] == "extract"]
            if lsp is not None and v in ("R", "RH", "RHV", "RN", "RNV"):
                info = {**info, **lsp.check(facts)}
            out.append({"doc": d, "model": m, "cond": c, "variant": v, "sample": s, **score(gt, facts),
                        "calls": len(rec["calls"]) + len(info.get("checks", [])),
                        "input_tokens": sum(x["input"] or 0 for x in rec["calls"]) + sum(x["input"] or 0 for x in info.get("checks", [])),
                        "output_tokens": sum(x["output"] or 0 for x in rec["calls"]) + sum(x["output"] or 0 for x in info.get("checks", [])),
                        "max_variable_tokens": max((x["chunk_tokens"] + x["memory_tokens"] for x in ext), default=0),
                        "facts": len(facts), **{k: v2 for k, v2 in info.items() if k != "checks"},
                        "checks": info.get("checks")})
        return out

    with ThreadPoolExecutor(args.workers) as pool:
        for out in pool.map(work, vjobs):
            rows.extend(out)
    tag = args.tag or "report"
    out_dir = L2 / "analysis"
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / f"{tag}.json").write_text(json.dumps({"docs": args.docs, "models": args.models, "rows": rows, "failures": failures},
                                                    ensure_ascii=False, indent=1), encoding="utf-8")
    mean = lambda xs: statistics.mean([x for x in xs if x is not None]) if [x for x in xs if x is not None] else float("nan")  # noqa: E731
    md = [f"# L2 {tag}: docs {', '.join(args.docs)}", "",
          "| model | cond | variant | n | far | far flow | flow full | flow short | far alias | wrong prod | forbidden | joined | join prec (judge) | sysml err | calls | input tok | output tok |",
          "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    for m in args.models:
        for c in args.conditions:
            for v in ("raw", "R", "RJ", "RH", "RHV", "RN", "RNV"):
                sel = [r for r in rows if r["model"] == m and r["cond"] == c and r["variant"] == v]
                if not sel:
                    continue
                md.append(f"| {m} | {c} | {v} | {len(sel)} | {mean([r['far'] for r in sel]):.2f} | {mean([r['far_flow'] for r in sel]):.2f} | "
                          f"{mean([r['flow_full'] for r in sel]):.2f} | {mean([r['flow_short'] for r in sel]):.2f} | {mean([r['far_alias'] for r in sel]):.2f} | "
                          f"{mean([r['wrong_producer_probes'] for r in sel]):.2f} | {mean([r['forbidden'] for r in sel]):.2f} | "
                          f"{mean([r.get('joined') for r in sel]):.1f} | {mean([r.get('judge_precision') for r in sel]):.2f} | "
                          f"{mean([r.get('sysml_errors') for r in sel]):.1f} | {mean([r['calls'] for r in sel]):.0f} | {mean([r['input_tokens'] for r in sel]):.0f} | "
                          f"{mean([r['output_tokens'] for r in sel]):.0f} |")
    if failures:
        md += ["", "## Failed or missing runs (kept in the denominator of the run count)", ""] + \
              [f"- {f['doc']} {f['model']} {f['cond']} s{f['sample']}: {f['error'][:200]}" for f in failures]
    (out_dir / f"{tag}.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["run", "report"])
    ap.add_argument("--docs", default="L2DEV")
    ap.add_argument("--models", default="gpt-5.5")
    ap.add_argument("--conditions", default=",".join(CONDS))
    ap.add_argument("--samples", type=int, default=3)
    ap.add_argument("--workers", type=int, default=12)
    ap.add_argument("--verify", action="store_true", help="report: run stage-3 verification of joined flows (model calls)")
    ap.add_argument("--judge", action="store_true", help="report: third-model precision judgment of joined flows (model calls)")
    ap.add_argument("--sysml", action="store_true", help="report: render R/RH/RHV ledgers as SysML v2 and count LSP errors")
    ap.add_argument("--tag", default="")
    args = ap.parse_args()
    args.docs, args.models, args.conditions = args.docs.split(","), args.models.split(","), args.conditions.split(",")
    load_dotenv_if_present()
    registry = load_registry(EXP / "models-l2.json")
    {"run": cmd_run, "report": cmd_report}[args.command](args, registry)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
