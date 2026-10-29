#!/usr/bin/env python3
"""Document-level statistics for an L2 report (revision round 2, blocker B4; post-review reanalysis).

The unit of analysis is the document (n = 8 test documents). For every arm this script gives the
per-document mean over runs and a document-clustered percentile bootstrap CI for each metric used in
the paper. For every (proposed, reference) pair it gives the paired document-level difference with
its bootstrap CI, an exact sign-flip permutation test over the document means, an exact sign test,
and the descriptive probe-level discordant counts b/c restricted to the probes that the metric
counts (far: non-homonym probes with distance > budget; far_flow: far split flows; flow_short: far
split flows with a shortened reference). No p-value is attached to b/c because probes are clustered
within documents. With 8 documents the smallest attainable two-sided exact p is 2/256 = 0.0078.

Families: the five pre-registered contrasts of the primary arm C1/RNV (vs F/R, C1/R, C2/R, C4/R,
OL/R) on far recall form one Holm family per model; all other contrasts are exploratory and
reported unadjusted. The contrasts were pre-registered; the document-level test procedure itself
was added after review and is labelled accordingly. No equivalence test is run or claimed.

    python scripts/journal/analyze_l2_doclevel.py --tag test-main

Reads analysis/<tag>.json (frozen report) and <doc>/probes.gt.json; writes analysis/doclevel-<tag>.{json,md}.
"""

from __future__ import annotations

import argparse
import itertools
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
METRICS = ("far", "far_flow", "flow_short", "flow_full", "far_alias", "wrong_producer_probes", "judge_precision", "input_tokens", "output_tokens")
ARMS = ["F/R", "C1/R", "C2/R", "C4/R", "OL/R", "C1/RH", "C1/RN", "C1/RNV", "C2/RNV", "C4/RNV", "OL/RN", "OL/RNV"]
PREREG = [("C1/RNV", "F/R"), ("C1/RNV", "C1/R"), ("C1/RNV", "C2/R"), ("C1/RNV", "C4/R"), ("C1/RNV", "OL/R")]
PAIRS = [(p, r, "pre-registered contrast") for p, r in PREREG] + [
    ("C1/RNV", "C1/RH", "ablation"), ("C1/RNV", "C1/RN", "ablation"),
    ("OL/RNV", "F/R", "exploratory"), ("OL/RNV", "C1/RNV", "exploratory"), ("OL/RNV", "C2/RNV", "exploratory"), ("OL/RNV", "OL/R", "exploratory"),
    ("C1/RN", "OL/R", "exploratory"), ("C1/RN", "C4/R", "exploratory"), ("C1/RN", "C2/R", "exploratory")]
MODELS = ("gpt-6.1-sol", "claude-opus-5-5")
BC_METRICS = ("far", "far_flow", "flow_short")


def doc_means(rows, model, arm, metric):
    c, v = arm.split("/")
    out = {}
    for d in sorted({r["doc"] for r in rows}):
        xs = [r.get(metric) for r in rows if r["doc"] == d and r["model"] == model and r["cond"] == c and r["variant"] == v]
        xs = [x for x in xs if x is not None]
        if xs:
            out[d] = statistics.mean(xs)
    return out


def boot_ci(values, n=10000, seed=7):
    rnd = random.Random(seed)
    ms = sorted(statistics.mean(rnd.choices(values, k=len(values))) for _ in range(n))
    return ms[int(0.025 * n)], ms[int(0.975 * n) - 1]


def perm_p(diffs):
    obs = abs(sum(diffs))
    cnt = tot = 0
    for signs in itertools.product((1, -1), repeat=len(diffs)):
        tot += 1
        if abs(sum(x * y for x, y in zip(diffs, signs))) >= obs - 1e-12:
            cnt += 1
    return cnt / tot


def sign_p(diffs):
    pos, neg = sum(d > 0 for d in diffs), sum(d < 0 for d in diffs)
    n = pos + neg
    if n == 0:
        return 1.0
    k = min(pos, neg)
    return min(1.0, 2 * sum(math.comb(n, i) for i in range(k + 1)) / 2 ** n)


def holm(pvals: dict) -> dict:
    items = sorted(pvals.items(), key=lambda kv: kv[1])
    m, out, running = len(items), {}, 0.0
    for i, (k, p) in enumerate(items):
        running = max(running, min(1.0, (m - i) * p))
        out[k] = running
    return out


def eligible(docs):
    """(doc, probe_id) -> set of metrics the probe counts toward."""
    out = {}
    for d in docs:
        gt = json.loads((L2 / d / "probes.gt.json").read_text(encoding="utf-8"))
        for p in gt["probes"]:
            mets = set()
            if p["type"] != "homonym" and p["distance_tokens"] > gt["budget"]:
                mets.add("far")
                if p["type"] == "split_flow":
                    mets.add("far_flow")
                    if p.get("link_ref") == "short":
                        mets.add("flow_short")
            out[(d, p["probe_id"])] = mets
    return out


def probe_majority(rows, model, arm, elig, metric):
    c, v = arm.split("/")
    acc = {}
    for r in rows:
        if r["model"] == model and r["cond"] == c and r["variant"] == v:
            for pid, hit in r["hits"].items():
                if metric in elig.get((r["doc"], pid), set()):
                    acc.setdefault((r["doc"], pid), []).append(hit)
    return {k: sum(h) * 2 > len(h) for k, h in acc.items()}


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--tag", required=True)
    args = ap.parse_args()
    rows = json.loads((L2 / "analysis" / f"{args.tag}.json").read_text(encoding="utf-8"))["rows"]
    docs = sorted({r["doc"] for r in rows})
    elig = eligible(docs)
    n_docs = len(docs)
    res = {"tag": args.tag, "procedure": "post-review reanalysis (document-level exact tests added after round-1 review)",
           "n_docs": n_docs, "min_two_sided_exact_p": 2 / 2 ** n_docs, "arms": {}, "pairs": {}}
    md = [f"# Document-level statistics — {args.tag} (post-review reanalysis)", "",
          f"Unit: document (n = {n_docs}). Per-document mean over runs; 95% percentile bootstrap over documents (10,000 resamples, seed 7). "
          f"Exact tests on {n_docs} documents cannot go below p = {2 / 2 ** n_docs:.4f}. Holm family: the five pre-registered contrasts of C1/RNV on far recall "
          "(per model); other contrasts exploratory, unadjusted. b/c: probe-level discordant counts restricted to the probes the metric counts (descriptive). "
          "No equivalence test is claimed.", ""]
    for m in MODELS:
        md += [f"## {m}: arms", "", "| arm | " + " | ".join(METRICS) + " |", "|---|" + "---|" * len(METRICS)]
        for arm in ARMS:
            entry, cells = {}, []
            for mt in METRICS:
                dm = doc_means(rows, m, arm, mt)
                if not dm:
                    cells.append("--")
                    continue
                vals = list(dm.values())
                lo, hi = boot_ci(vals)
                entry[mt] = {"mean": statistics.mean(vals), "ci": [lo, hi], "docs": len(vals), "per_doc": dm}
                cells.append(f"{statistics.mean(vals):.0f} [{lo:.0f}, {hi:.0f}]" if mt.endswith("tokens") else f"{statistics.mean(vals):.2f} [{lo:.2f}, {hi:.2f}]")
            if entry:
                res["arms"][f"{m}|{arm}"] = entry
                md.append(f"| {arm} | " + " | ".join(cells) + " |")
        md += ["", f"## {m}: paired document-level differences (proposed minus reference)", "",
               "| status | proposed | reference | metric | mean diff [95% CI] | docs +/-/0 | exact perm. p | Holm p (prereg. family, far) | exact sign p | probe b/c (metric-eligible) |",
               "|---|---|---|---|---|---|---|---|---|---|"]
        fam = {}
        entries = {}
        for prop, ref, status in PAIRS:
            for mt in ("far", "far_flow", "flow_short", "wrong_producer_probes"):
                a, r = doc_means(rows, m, prop, mt), doc_means(rows, m, ref, mt)
                dd = sorted(set(a) & set(r))
                if not dd:
                    continue
                diffs = [a[d] - r[d] for d in dd]
                lo, hi = boot_ci(diffs)
                e = {"status": status, "metric": mt, "diff": statistics.mean(diffs), "ci": [lo, hi], "docs": len(dd),
                     "n_pos": sum(x > 0 for x in diffs), "n_neg": sum(x < 0 for x in diffs), "n_zero": sum(x == 0 for x in diffs),
                     "perm_p": perm_p(diffs), "sign_p": sign_p(diffs), "per_doc_diff": dict(zip(dd, diffs))}
                if mt in BC_METRICS:
                    pm, rm = probe_majority(rows, m, prop, elig, mt), probe_majority(rows, m, ref, elig, mt)
                    keys = sorted(set(pm) & set(rm))
                    e["probe_b"] = sum(1 for k in keys if pm[k] and not rm[k])
                    e["probe_c"] = sum(1 for k in keys if rm[k] and not pm[k])
                    e["probe_n"] = len(keys)
                if (prop, ref) in PREREG and mt == "far":
                    fam[(prop, ref)] = e["perm_p"]
                entries[(prop, ref, mt)] = e
        adj = holm(fam)
        for (prop, ref, mt), e in entries.items():
            e["holm_p"] = adj.get((prop, ref)) if mt == "far" and (prop, ref) in PREREG else None
            res["pairs"][f"{m}|{prop}|{ref}|{mt}"] = e
            bc = f"{e['probe_b']}/{e['probe_c']} (n={e['probe_n']})" if "probe_b" in e else "--"
            hp = f"{e['holm_p']:.3f}" if e["holm_p"] is not None else "--"
            md.append(f"| {e['status']} | {prop} | {ref} | {mt} | {e['diff']:+.3f} [{e['ci'][0]:+.3f}, {e['ci'][1]:+.3f}] | {e['n_pos']}/{e['n_neg']}/{e['n_zero']} | "
                      f"{e['perm_p']:.3f} | {hp} | {e['sign_p']:.3f} | {bc} |")
        md.append("")
    (L2 / "analysis" / f"doclevel-{args.tag}.json").write_text(json.dumps(res, ensure_ascii=False, indent=1), encoding="utf-8")
    (L2 / "analysis" / f"doclevel-{args.tag}.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
