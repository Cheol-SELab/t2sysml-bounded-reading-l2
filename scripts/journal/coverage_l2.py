#!/usr/bin/env python3
"""Extraction coverage of L2 runs (post-hoc, no model calls, does not change any frozen file).

Probe recall measures selected long-range facts; it does not show how much of the document a
condition models at all. Coverage reports, per run, the share of sentence units that yield at
least one fact, the number of facts, and the number of typed relations (flow, succession,
transition, allocation), after alias resolution (variant R).

    python scripts/journal/coverage_l2.py --docs L2T1,...,L2T8 --models claude-opus-5-5 --tag test
"""

from __future__ import annotations

import argparse
import json
import statistics
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))
sys.path.insert(0, str(ROOT / "scripts" / "journal"))

import run_l2 as R  # noqa: E402

RELATIONS = ("flow", "succession", "transition", "allocation")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--docs", required=True)
    ap.add_argument("--models", required=True)
    ap.add_argument("--conditions", default="F,C1,C2,C4,OL")
    ap.add_argument("--samples", type=int, default=3)
    ap.add_argument("--tag", required=True)
    args = ap.parse_args()
    rows = []
    for d in args.docs.split(","):
        units = json.loads((R.L2 / d / "units.json").read_text(encoding="utf-8"))["units"]
        ids = {u["unit_id"] for u in units}
        for m in args.models.split(","):
            for c in args.conditions.split(","):
                for s in range(args.samples):
                    p = R.L2 / d / "runs" / m / c / f"s{s}.json"
                    if not p.is_file():
                        continue
                    rec = json.loads(p.read_text(encoding="utf-8"))
                    if rec.get("failed"):
                        continue
                    facts = R.variants(rec, c)["R"][0]
                    covered = {f.get("unit_id") for f in facts} & ids
                    rows.append({"doc": d, "model": m, "cond": c, "sample": s, "unit_coverage": len(covered) / len(ids),
                                 "facts": len(facts), "relations": sum(f.get("type") in RELATIONS for f in facts)})
    out = R.L2 / "analysis" / f"coverage-{args.tag}.json"
    out.write_text(json.dumps(rows, indent=1), encoding="utf-8")
    md = [f"# Extraction coverage — {args.tag}", "", "| model | cond | runs | sentence coverage | facts | relations |", "|---|---|---|---|---|---|"]
    for m in args.models.split(","):
        for c in args.conditions.split(","):
            sel = [r for r in rows if r["model"] == m and r["cond"] == c]
            if sel:
                md.append(f"| {m} | {c} | {len(sel)} | {statistics.mean(r['unit_coverage'] for r in sel):.2f} | "
                          f"{statistics.mean(r['facts'] for r in sel):.0f} | {statistics.mean(r['relations'] for r in sel):.0f} |")
    out.with_suffix(".md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
