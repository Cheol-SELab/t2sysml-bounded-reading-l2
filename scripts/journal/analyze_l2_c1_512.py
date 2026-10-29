#!/usr/bin/env python3
"""Document-level comparison of the post-hoc C1S arm (512-token chunks, no memory) with the frozen test arms.

Inputs : experiments/journal-v1/l2/analysis/test-main.json (frozen; read only)
         experiments/journal-v1/l2-posthoc-c1-512/analysis/c1s-main.json (this arm)
Outputs: experiments/journal-v1/l2-posthoc-c1-512/analysis/c1s-paired.{json,md}

Same statistics as the paper: document = unit (mean over its runs), 95% percentile bootstrap over documents
(10,000 resamples, seed 0), exact two-sided sign-flip permutation test over the eight document means. No Holm
adjustment: the arm is post-hoc and no contrast was pre-specified.
"""

from __future__ import annotations

import itertools
import json
import random
import statistics as st
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EXP = ROOT / "experiments" / "journal-v1"
FROZEN = EXP / "l2" / "analysis" / "test-main.json"
OUT = EXP / "l2-posthoc-c1-512" / "analysis"
MODELS = {"gpt-6.1-sol": "Sol", "claude-opus-5-5": "Opus"}
METRICS = ("far", "far_flow", "flow_short", "wrong_producer_probes")
CONTRASTS = [  # (proposed, reference, what it isolates)
    ("C1S/R", "C1/R", "chunk size without memory (512 vs 1,024), no join"),
    ("C1S/RNV", "C1/RNV", "chunk size without memory, with verified named join"),
    ("C2/R", "C1S/R", "rolling-summary memory at 512 tokens, no join"),
    ("C4/R", "C1S/R", "graph memory at 512 tokens, no join"),
    ("OL/R", "C1S/R", "open-end memory at 512 tokens, no join"),
    ("C1S/RNV", "C1S/R", "consolidation at 512 tokens without memory"),
    ("C1S/RNV", "C2/R", "join without memory vs summary memory, both 512"),
    ("C1S/RNV", "C4/R", "join without memory vs graph memory, both 512"),
    ("C1S/RNV", "OL/R", "join without memory vs open-end memory, both 512"),
    ("C2/RNV", "C1S/RNV", "memory on top of the join, both 512 (summary)"),
    ("C4/RNV", "C1S/RNV", "memory on top of the join, both 512 (graph)"),
    ("OL/RNV", "C1S/RNV", "memory on top of the join, both 512 (open-end)"),
    ("F/R", "C1S/RNV", "whole document vs 512 join"),
]


def load(path):
    return json.loads(path.read_text(encoding="utf-8"))["rows"]


def doc_means(rows, metric):
    g = defaultdict(lambda: defaultdict(list))
    for r in rows:
        if r.get(metric) is None:
            continue
        g[(r["model"], f"{r['cond']}/{r['variant']}")][r["doc"]].append(r[metric])
    return {k: {d: st.mean(v) for d, v in dd.items()} for k, dd in g.items()}


def exact_p(diffs):
    n = len(diffs)
    obs = abs(sum(diffs))
    cnt = sum(1 for s in itertools.product((1, -1), repeat=n) if abs(sum(a * b for a, b in zip(s, diffs))) >= obs - 1e-12)
    return cnt / 2 ** n


def main() -> int:
    rows = load(FROZEN) + load(OUT / "c1s-main.json")
    rng = random.Random(0)
    report = {"contrasts": [], "arm_means": {}}
    md = ["# C1S (post-hoc, 512-token chunks, no memory) against the frozen test arms", "",
          "Document-level means over 8 documents (3 runs each). CI: 95% percentile bootstrap over documents. p: exact sign-flip test, two-sided, unadjusted. +/-/0: documents where the proposed arm is higher, lower, equal.", ""]
    # arm means
    md += ["## Arm means (C1S variants; frozen arms for reference)", "", "| model | arm | far | far flow | short flow | wrong | joined | judge prec | in tok | out tok | calls |", "|---|---|---|---|---|---|---|---|---|---|---|"]
    by = defaultdict(list)
    for r in rows:
        by[(r["model"], f"{r['cond']}/{r['variant']}")].append(r)
    mean = lambda xs: st.mean([x for x in xs if x is not None]) if any(x is not None for x in xs) else float("nan")  # noqa: E731
    for m, label in MODELS.items():
        f_in = mean([r["input_tokens"] for r in by[(m, "F/R")]])
        f_out = mean([r["output_tokens"] for r in by[(m, "F/R")]])
        for arm in ("F/R", "C1/R", "C1/RN", "C1/RNV", "C1S/raw", "C1S/R", "C1S/RH", "C1S/RN", "C1S/RNV", "C2/R", "C4/R", "OL/R", "C2/RNV", "C4/RNV", "OL/RNV"):
            sel = by.get((m, arm))
            if not sel:
                continue
            jp = [r.get("judge_supported") for r in sel], [r.get("judged") for r in sel]
            pooled = (sum(x or 0 for x in jp[0]), sum(x or 0 for x in jp[1]))
            rec = {"far": mean([r["far"] for r in sel]), "far_flow": mean([r["far_flow"] for r in sel]),
                   "flow_short": mean([r["flow_short"] for r in sel]), "wrong": mean([r["wrong_producer_probes"] for r in sel]),
                   "joined": mean([r.get("joined") for r in sel]), "judge": f"{pooled[0]}/{pooled[1]}" if pooled[1] else "--",
                   "in_x": mean([r["input_tokens"] for r in sel]) / f_in, "out_x": mean([r["output_tokens"] for r in sel]) / f_out,
                   "calls": mean([r["calls"] for r in sel]), "n": len(sel)}
            report["arm_means"][f"{label} {arm}"] = rec
            md.append(f"| {label} | {arm} | {rec['far']:.3f} | {rec['far_flow']:.3f} | {rec['flow_short']:.3f} | {rec['wrong']:.2f} | {rec['joined']:.1f} | {rec['judge']} | {rec['in_x']:.2f}x | {rec['out_x']:.2f}x | {rec['calls']:.1f} |")
    md += ["", "## Paired document-level contrasts", ""]
    for metric in ("far", "far_flow"):
        dm = doc_means(rows, metric)
        md += [f"### {metric}", "", "| model | proposed | reference | what | delta [95% CI] | +/-/0 | p exact |", "|---|---|---|---|---|---|---|"]
        for m, label in MODELS.items():
            for prop, ref, what in CONTRASTS:
                a, b = dm.get((m, prop)), dm.get((m, ref))
                if not a or not b:
                    continue
                docs = sorted(set(a) & set(b))
                diffs = [a[d] - b[d] for d in docs]
                boots = sorted(st.mean(rng.choices(diffs, k=len(diffs))) for _ in range(10000))
                pos, neg = sum(x > 1e-12 for x in diffs), sum(x < -1e-12 for x in diffs)
                rec = {"model": label, "metric": metric, "proposed": prop, "reference": ref, "what": what, "n": len(docs),
                       "delta": st.mean(diffs), "ci": [boots[250], boots[9749]], "pos": pos, "neg": neg, "tie": len(docs) - pos - neg,
                       "p_exact": exact_p(diffs), "doc_diffs": dict(zip(docs, diffs))}
                report["contrasts"].append(rec)
                md.append(f"| {label} | {prop} | {ref} | {what} | {rec['delta']:+.3f} [{rec['ci'][0]:+.3f}, {rec['ci'][1]:+.3f}] | {pos}/{neg}/{rec['tie']} | {rec['p_exact']:.3f} |")
        md.append("")
    (OUT / "c1s-paired.json").write_text(json.dumps(report, ensure_ascii=False, indent=1), encoding="utf-8")
    (OUT / "c1s-paired.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
