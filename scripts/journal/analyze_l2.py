#!/usr/bin/env python3
"""Statistics for an L2 report (run_l2.py report --tag <tag>): document-clustered bootstrap CIs,
paired differences against reference arms, and probe-level McNemar tests with Holm correction.

    python scripts/journal/analyze_l2.py --tag test-main --model gpt-5.5

Unit of analysis: the document. Each document's score is the mean over its successful samples;
probes are pooled per document. Failed runs are reported separately (run_l2 report keeps them).
"""

from __future__ import annotations

import argparse
import json
import math
import random
import statistics
import sys
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[2]
L2 = ROOT / "experiments" / "journal-v1" / "l2"
METRICS = ("far", "far_flow", "flow_full", "flow_short", "far_alias", "wrong_producer_probes", "forbidden")


def doc_means(rows, model, arm, metric):
    c, v = arm.split("/")
    out = {}
    for d in sorted({r["doc"] for r in rows}):
        xs = [r[metric] for r in rows if r["doc"] == d and r["model"] == model and r["cond"] == c and r["variant"] == v and r[metric] is not None]
        if xs:
            out[d] = statistics.mean(xs)
    return out


def boot_ci(values: list[float], n=10000, seed=7):
    rnd = random.Random(seed)
    ms = sorted(statistics.mean(rnd.choices(values, k=len(values))) for _ in range(n))
    return ms[int(0.025 * n)], ms[int(0.975 * n) - 1]


def probe_majority(rows, model, arm):
    """(doc, probe) -> hit by majority over successful samples."""
    c, v = arm.split("/")
    acc = {}
    for r in rows:
        if r["model"] == model and r["cond"] == c and r["variant"] == v:
            for pid, hit in r["hits"].items():
                acc.setdefault((r["doc"], pid), []).append(hit)
    return {k: sum(h) * 2 > len(h) for k, h in acc.items()}


def mcnemar(a: dict, b: dict):
    keys = sorted(set(a) & set(b))
    n01 = sum(1 for k in keys if not a[k] and b[k])
    n10 = sum(1 for k in keys if a[k] and not b[k])
    n = n01 + n10
    if n == 0:
        return n01, n10, 1.0
    k = min(n01, n10)
    p = min(1.0, 2 * sum(math.comb(n, i) for i in range(k + 1)) / 2 ** n)  # exact binomial
    return n01, n10, p


def holm(pvals: dict) -> dict:
    items = sorted(pvals.items(), key=lambda kv: kv[1])
    m, out, running = len(items), {}, 0.0
    for i, (k, p) in enumerate(items):
        running = max(running, min(1.0, (m - i) * p))
        out[k] = running
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--tag", required=True)
    ap.add_argument("--model", required=True)
    ap.add_argument("--arms", default="F/R,C1/raw,C1/R,C1/RJ,C1/RH,C1/RHV,C2/raw,C2/RH,C4/raw,C4/RH,C4/RHV,OL/raw,OL/RH,OL/RHV")
    ap.add_argument("--proposed", default="OL/RHV")
    ap.add_argument("--references", default="F/R,C1/raw,C1/RH,C2/RH,C4/RH,C1/RHV,C4/RHV")
    args = ap.parse_args()
    data = json.loads((L2 / "analysis" / f"{args.tag}.json").read_text(encoding="utf-8"))
    rows = data["rows"]
    arms = [a for a in args.arms.split(",") if any(r["cond"] == a.split("/")[0] and r["variant"] == a.split("/")[1] for r in rows)]
    res = {"tag": args.tag, "model": args.model, "arms": {}, "paired": {}, "mcnemar": {}}
    md = [f"# L2 statistics — {args.tag}, {args.model}", "",
          "Document-clustered means with 95% bootstrap CI (10,000 resamples of documents).", "",
          "| arm | docs | " + " | ".join(METRICS) + " | input tokens |", "|---|---|" + "---|" * (len(METRICS) + 1)]
    for arm in arms:
        cells, entry = [], {}
        for mtr in METRICS:
            dm = doc_means(rows, args.model, arm, mtr)
            if not dm:
                cells.append("—")
                continue
            vals = list(dm.values())
            lo, hi = boot_ci(vals)
            entry[mtr] = {"mean": statistics.mean(vals), "ci": [lo, hi], "docs": len(vals)}
            cells.append(f"{statistics.mean(vals):.2f} [{lo:.2f}, {hi:.2f}]")
        tok = doc_means(rows, args.model, arm, "input_tokens")
        entry["input_tokens"] = statistics.mean(tok.values()) if tok else None
        res["arms"][arm] = entry
        n_docs = len(doc_means(rows, args.model, arm, "far"))
        md.append(f"| {arm} | {n_docs} | " + " | ".join(cells) + f" | {entry['input_tokens'] or float('nan'):.0f} |")
    md += ["", f"## Paired differences: {args.proposed} minus reference (document-clustered bootstrap)", "",
           "| reference | far Δ [95% CI] | far flow Δ | wrong producer Δ |", "|---|---|---|---|"]
    pvals = {}
    prop = probe_majority(rows, args.model, args.proposed)
    for ref in args.references.split(","):
        if ref == args.proposed or ref not in arms:
            continue
        cells, entry = [], {}
        for mtr in ("far", "far_flow", "wrong_producer_probes"):
            a, b = doc_means(rows, args.model, args.proposed, mtr), doc_means(rows, args.model, ref, mtr)
            docs = sorted(set(a) & set(b))
            if not docs:
                cells.append("—")
                continue
            diffs = [a[d] - b[d] for d in docs]
            lo, hi = boot_ci(diffs)
            entry[mtr] = {"diff": statistics.mean(diffs), "ci": [lo, hi], "docs": len(docs)}
            cells.append(f"{statistics.mean(diffs):+.2f} [{lo:+.2f}, {hi:+.2f}]")
        res["paired"][ref] = entry
        n01, n10, p = mcnemar(probe_majority(rows, args.model, ref), prop)
        res["mcnemar"][ref] = {"ref_only": n10, "proposed_only": n01, "p": p}
        pvals[ref] = p
        md.append(f"| {ref} | " + " | ".join(cells) + " |")
    adj = holm(pvals)
    md += ["", "## Probe-level McNemar (majority over samples, all probe types), Holm-adjusted", "",
           "| reference | proposed only | reference only | p | p (Holm) |", "|---|---|---|---|---|"]
    for ref, p in pvals.items():
        res["mcnemar"][ref]["p_holm"] = adj[ref]
        m = res["mcnemar"][ref]
        md.append(f"| {ref} | {m['proposed_only']} | {m['ref_only']} | {p:.4f} | {adj[ref]:.4f} |")
    stem = f"{args.tag}--{args.model}--stats"
    (L2 / "analysis" / f"{stem}.json").write_text(json.dumps(res, ensure_ascii=False, indent=1), encoding="utf-8")
    (L2 / "analysis" / f"{stem}.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
