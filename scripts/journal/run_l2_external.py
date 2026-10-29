#!/usr/bin/env python3
"""External check of the frozen L2 method on eight real NASA report excerpts (no probe GT).

Runs F and C1 with the frozen run_l2 code and reports, per document and model, how many flows the
ledger joins (RH, RN), how many survive cross-vendor verification (RNV), the third-model judged
precision of the joined flows, and the LSP errors of the rendered SysML v2 model.

    python scripts/journal/run_l2_external.py run
    python scripts/journal/run_l2_external.py report

Inputs: experiments/journal-v1/long-source-holdout-v2/<doc>/units.json (frozen, see corpus-freeze.json).
Outputs: experiments/journal-v1/l2/external/.
"""

from __future__ import annotations

import argparse
import json
import statistics
import sys
import threading
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))
sys.path.insert(0, str(ROOT / "scripts" / "journal"))

import run_l2 as R  # noqa: E402
from t2m_pipeline.llm_clients import load_registry  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

SRC = R.EXP / "long-source-holdout-v2"
OUT = R.L2 / "external"
DOCS = sorted(p.parent.name for p in SRC.glob("*/units.json"))
MODELS = ["gpt-6.1-sol", "claude-opus-5-5"]
CONDS = ["F", "C1"]
_lock = threading.Lock()


def units_of(doc):
    d = json.loads((SRC / doc / "units.json").read_text(encoding="utf-8"))
    return [{"unit_id": u["unit_id"], "text": u["text"]} for u in d["units"]]


def cmd_run(registry):
    jobs = [(d, m, c) for d in DOCS for m in MODELS for c in CONDS]

    def work(job):
        d, m, c = job
        p = OUT / "runs" / d / m / f"{c}.json"
        if p.is_file():
            return
        try:
            rec = R.run(registry[m], m, units_of(d), c, 0)
        except Exception as e:  # noqa: BLE001
            rec = {"failed": True, "error": f"{type(e).__name__}: {str(e)[:400]}", "facts": [], "entities": [], "calls": []}
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(json.dumps(rec, ensure_ascii=False, indent=1), encoding="utf-8")
        with _lock:
            print(d, m, c, "FAILED" if rec.get("failed") else f"{len(rec['facts'])} facts", flush=True)

    with ThreadPoolExecutor(16) as pool:
        list(pool.map(work, jobs))


def cmd_report(registry):
    lsp = R._Lsp()
    rows, fails = [], []
    jobs = []
    for d in DOCS:
        units = units_of(d)
        for m in MODELS:
            for c in CONDS:
                p = OUT / "runs" / d / m / f"{c}.json"
                rec = json.loads(p.read_text(encoding="utf-8")) if p.is_file() else {"failed": True, "error": "missing"}
                if rec.get("failed"):
                    fails.append({"doc": d, "model": m, "cond": c, "error": rec["error"]})
                    continue
                jobs.append((d, m, c, rec, units))

    def work(job):
        d, m, c, rec, units = job
        vm = R.VERIFIER.get(m, m)
        vf = lambda joined, reg: R.verify_joins(registry[vm], vm, 0, joined, units, reg)  # noqa: E731
        jf = lambda joined, reg: R.judge_joins(registry, 0, joined, units, reg)  # noqa: E731
        out = []
        for v, (facts, info) in R.variants(rec, c, vf, jf).items():
            if v not in ("R", "RH", "RN", "RNV"):
                continue
            out.append({"doc": d, "model": m, "cond": c, "variant": v, "facts": len(facts),
                        "input_tokens": sum(x["input"] or 0 for x in rec["calls"]) + sum(x["input"] or 0 for x in info.get("checks", [])),
                        **{k: x for k, x in info.items() if k != "checks"}, **lsp.check(facts)})
        return out

    with ThreadPoolExecutor(12) as pool:
        for out in pool.map(work, jobs):
            rows.extend(out)
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "report.json").write_text(json.dumps({"docs": DOCS, "rows": rows, "failures": fails}, ensure_ascii=False, indent=1), encoding="utf-8")
    mean = lambda xs: statistics.mean([x for x in xs if x is not None]) if [x for x in xs if x is not None] else float("nan")  # noqa: E731
    md = ["# L2 external check: 8 NASA report excerpts", "",
          "| model | cond | variant | docs | joined | kept | judged precision | flows | sysml errors | input tokens |", "|---|---|---|---|---|---|---|---|---|---|"]
    for m in MODELS:
        for c in CONDS:
            for v in ("R", "RH", "RN", "RNV"):
                sel = [r for r in rows if r["model"] == m and r["cond"] == c and r["variant"] == v]
                if sel:
                    md.append(f"| {m} | {c} | {v} | {len(sel)} | {mean([r.get('joined') for r in sel]):.1f} | {mean([r.get('kept') for r in sel]):.1f} | "
                              f"{mean([r.get('judge_precision') for r in sel]):.2f} | {mean([r['flows'] for r in sel]):.1f} | "
                              f"{mean([r['sysml_errors'] for r in sel]):.1f} | {mean([r['input_tokens'] for r in sel]):.0f} |")
    if fails:
        md += ["", "Failed: " + "; ".join(f"{f['doc']} {f['model']} {f['cond']}: {f['error'][:120]}" for f in fails)]
    (OUT / "report.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["run", "report"])
    args = ap.parse_args()
    load_dotenv_if_present()
    registry = load_registry(R.EXP / "models-l2.json")
    {"run": cmd_run, "report": cmd_report}[args.command](registry)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
