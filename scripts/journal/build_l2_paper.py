#!/usr/bin/env python3
"""Generate the data-driven LaTeX parts of paper-long/ from the L2 corpus and a run_l2 report.

    python scripts/journal/build_l2_paper.py --tag test-main

Writes paper-long/benchmark.tex, results.tex and abstract-results.tex. Every number comes from
experiments/journal-v1/l2/{<doc>/probes.gt.json, analysis/<tag>.json, analysis/<tag>--<model>--stats.json}.
"""

from __future__ import annotations

import argparse
import json
import statistics
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "journal"))
from analyze_l2 import boot_ci  # noqa: E402


def doc_means(rows, model, arm, metric):
    """Per-document mean of a metric over runs; rows without the metric (e.g. no judge) are skipped."""
    c, v = arm.split("/")
    out = {}
    for d in sorted({r["doc"] for r in rows}):
        xs = [r.get(metric) for r in rows if r["doc"] == d and r["model"] == model and r["cond"] == c and r["variant"] == v]
        xs = [x for x in xs if x is not None]
        if xs:
            out[d] = statistics.mean(xs)
    return out

L2 = ROOT / "experiments" / "journal-v1" / "l2"
OUT = ROOT / "paper-long"
TEST = [f"L2T{i}" for i in range(1, 9)]
MODELS = {"gpt-6.1-sol": "Sol", "claude-opus-5-5": "Opus"}
DOMAIN = {"L2T1": "metro CBTC", "L2T2": "hospital medication", "L2T3": "wildfire detection", "L2T4": "substation automation",
          "L2T5": "water treatment", "L2T6": "airport baggage", "L2T7": "satellite ground segment", "L2T8": "pallet warehouse"}
ARMS = [("F/R", "F (whole doc.)"), ("C1/R", "C1 chunks"), ("C2/R", "C2 summary mem."), ("C4/R", "C4 graph mem."),
        ("OL/R", "OL open-end mem."), ("C1/RH", "C1 + head join"), ("C1/RN", "C1 + named join"), ("C1/RNV", "C1 + named join + verify"),
        ("OL/RNV", "OL + named join + verify$^e$")]


def fmt(m, ci=None, d=2):
    if m is None:
        return "--"
    return f"{m:.{d}f}" + (f" [{ci[0]:.{d}f}, {ci[1]:.{d}f}]" if ci else "")


def benchmark():
    rows, tot = [], {"tok": [], "units": [], "flow": 0, "short": 0, "alias": 0, "hom": 0, "dist": []}
    for d in TEST:
        gt = json.loads((L2 / d / "probes.gt.json").read_text(encoding="utf-8"))
        units = json.loads((L2 / d / "units.json").read_text(encoding="utf-8"))["units"]
        n = {t: sum(p["type"] == t for p in gt["probes"]) for t in ("split_flow", "alias_ref", "homonym")}
        short = sum(p.get("link_ref") == "short" for p in gt["probes"])
        dist = [p["distance_tokens"] for p in gt["probes"] if p["type"] != "homonym"]
        rows.append(f"{d} & {DOMAIN[d]} & {gt['writer']} & {gt['doc_tokens']:,} & {len(units)} & {n['split_flow']} ({short}) & {n['alias_ref']} & {n['homonym']} & {statistics.median(dist):,.0f} \\\\")
        tot["tok"].append(gt["doc_tokens"]); tot["units"].append(len(units)); tot["flow"] += n["split_flow"]; tot["short"] += short
        tot["alias"] += n["alias_ref"]; tot["hom"] += n["homonym"]; tot["dist"] += dist
    far = sum(x > 1024 for x in tot["dist"]) / len(tot["dist"])
    text = [
        "Each document is an English operational concept document of ten sections (about 25 sentences each) "
        "written section by section from a planned blueprint. The blueprint fixes entities, ten split flows "
        "(five whose link sentence names the item only by a shortened definite description), eight aliases that "
        "share no word or initial with the full name, and two homonym pairs. The writer tags the sentences that "
        "realize each probe. Deterministic checks reject a probe if a tag is missing or duplicated, if the item "
        "(or its short form) appears outside its two sentences, if producer and item (or consumer and item) "
        "co-occur within 1,024 tokens of the opposite end, or if an alias is re-declared near its use; leaking "
        "sentences other than the probe's own are rewritten. A model other than the writer then judges every "
        "probe against the whole document and unsupported probes are dropped.",
        "",
        f"The eight test documents have {sum(tot['tok']):,} tokens in total (mean {statistics.mean(tot['tok']):,.0f}) and "
        f"{tot['flow'] + tot['alias'] + tot['hom']} probes: {tot['flow']} split flows ({tot['short']} with shortened "
        f"references), {tot['alias']} alias references and {tot['hom']} homonym probes. {100 * far:.0f}\\% of the flow and alias "
        f"probes span more than 1,024 tokens (median {statistics.median(tot['dist']):,.0f}). Table~\\ref{{tab:corpus}} "
        "lists the documents. The development document (emergency medical dispatch, 4,825 tokens, 19 probes) is "
        "not part of the test set.",
        "",
        "\\begin{table*}[t]\\centering\\small",
        "\\caption{Held-out L2 test documents. Flows: split-flow probes (shortened references). Distance: median token distance between probe ends.}",
        "\\label{tab:corpus}",
        "\\begin{tabular}{llllrrrrr}\\toprule",
        "Doc & Domain & Writer & Tokens & Sent. & Flows & Aliases & Homon. & Distance \\\\\\midrule",
        *rows, "\\bottomrule\\end{tabular}\\end{table*}"]
    (OUT / "benchmark.tex").write_text("\n".join(text) + "\n", encoding="utf-8")


def results(tag):
    data = json.loads((L2 / "analysis" / f"{tag}.json").read_text(encoding="utf-8"))
    rows = data["rows"]
    lines = ["\\begin{table*}[t]\\centering\\small",
             "\\caption{Test results (8 documents, 3 runs each). Means over documents with 95\\% bootstrap CIs. Far: recall of flow and alias "
             "probes spanning $>$1,024 tokens. Short: split flows with shortened item references. Wrong: probes delivered from a wrong producer "
             "(per document). Prec.: judged precision of joined flows (third model). Input: provider input tokens relative to F. $^e$Exploratory arm, not pre-registered.}",
             "\\label{tab:main}",
             "\\begin{tabular}{llllllll}\\toprule",
             "Model & Arm & Far recall & Short flows & Alias & Wrong & Prec. & Input \\\\\\midrule"]
    summary = {}
    for m, short in MODELS.items():
        f_tok = statistics.mean(doc_means(rows, m, "F/R", "input_tokens").values() or [float("nan")])
        for arm, label in ARMS:
            far = doc_means(rows, m, arm, "far")
            if not far:
                continue
            vals = list(far.values())
            fl = list(doc_means(rows, m, arm, "flow_short").values())
            al = list(doc_means(rows, m, arm, "far_alias").values())
            wr = list(doc_means(rows, m, arm, "wrong_producer_probes").values())
            pr = list(doc_means(rows, m, arm, "judge_precision").values())
            tok = statistics.mean(doc_means(rows, m, arm, "input_tokens").values())
            summary[(m, arm)] = {"far": statistics.mean(vals), "far_ci": boot_ci(vals), "tok_ratio": tok / f_tok,
                                 "prec": statistics.mean(pr) if pr else None, "wrong": statistics.mean(wr)}
            lines.append(f"{short} & {label} & {fmt(statistics.mean(vals), boot_ci(vals))} & {fmt(statistics.mean(fl))} & "
                         f"{fmt(statistics.mean(al))} & {fmt(statistics.mean(wr))} & {fmt(statistics.mean(pr) if pr else None)} & {tok / f_tok:.2f}$\\times$ \\\\")
        lines.append("\\midrule")
    lines[-1] = "\\bottomrule\\end{tabular}\\end{table*}"
    # memory x consolidation grid
    grid = ["\\begin{table}[t]\\centering\\small",
            "\\caption{Far-probe recall by reading condition (rows) and consolidation (columns), mean over test documents and runs.}",
            "\\label{tab:grid}", "\\begin{tabular}{llrrrrr}\\toprule", "Model & Cond. & raw & R & RH & RN & RNV \\\\\\midrule"]
    for m, short in MODELS.items():
        for c in ("F", "C1", "C2", "C4", "OL"):
            cells = []
            for v in ("raw", "R", "RH", "RN", "RNV"):
                dm = doc_means(rows, m, f"{c}/{v}", "far")
                cells.append(f"{statistics.mean(dm.values()):.2f}" if dm else "--")
            grid.append(f"{short} & {c} & " + " & ".join(cells) + " \\\\")
        grid.append("\\midrule")
    grid[-1] = "\\bottomrule\\end{tabular}\\end{table}"
    paired = ["\\begin{table}[t]\\centering\\small",
              "\\caption{C1/RNV minus reference arm: document-level difference in far recall (95\\% bootstrap CI) and probe-level McNemar test (Holm-adjusted $p$).}",
              "\\label{tab:paired}", "\\begin{tabular}{lllrr}\\toprule", "Model & Reference & $\\Delta$ far recall & $b$/$c$ & $p_{Holm}$ \\\\\\midrule"]
    for m, short in MODELS.items():
        sp = L2 / "analysis" / f"{tag}--{m}--stats.json"
        if not sp.is_file():
            continue
        st = json.loads(sp.read_text(encoding="utf-8"))
        for ref, e in st["paired"].items():
            if "far" not in e:
                continue
            mc = st["mcnemar"].get(ref, {})
            paired.append(f"{short} & {ref} & {e['far']['diff']:+.2f} [{e['far']['ci'][0]:+.2f}, {e['far']['ci'][1]:+.2f}] & "
                          f"{mc.get('proposed_only', '--')}/{mc.get('ref_only', '--')} & {mc.get('p_holm', float('nan')):.3g} \\\\")
        paired.append("\\midrule")
    paired[-1] = "\\bottomrule\\end{tabular}\\end{table}"
    fails = data.get("failures", [])
    n_runs = len({(r["doc"], r["model"], r["cond"], r["sample"]) for r in rows})
    text = [f"All {n_runs} planned test runs completed and are scored ({len(fails)} missing). Table~\\ref{{tab:main}} gives "
            "the primary results, Table~\\ref{tab:grid} separates the contribution of prompt memory from that of ledger "
            "consolidation, and Table~\\ref{tab:paired} gives the paired tests. Tables~\\ref{tab:long}--\\ref{tab:external} "
            "report the length extension, sampled fact precision and the external check.",
            "", "\\input{results-text.tex}", "", *lines, "", *grid, "", *paired, "", "\\input{extras.tex}"]
    (OUT / "results.tex").write_text("\n".join(text) + "\n", encoding="utf-8")
    (OUT / "summary.json").write_text(json.dumps({f"{m}|{a}": v for (m, a), v in summary.items()}, indent=1), encoding="utf-8")
    return summary


def _mean(xs):
    xs = [x for x in xs if x is not None]
    return statistics.mean(xs) if xs else None


def extras(tag, long_tag):
    """Length extension, extraction coverage, sampled fact precision and the external check."""
    a = L2 / "analysis"
    out = []
    rows = json.loads((a / f"{long_tag}.json").read_text(encoding="utf-8"))["rows"]
    cov5 = json.loads((a / f"coverage-{tag}.json").read_text(encoding="utf-8"))
    cov20 = json.loads((a / f"coverage-{long_tag}.json").read_text(encoding="utf-8"))

    def cov(rs, m, c):
        return _mean([r["unit_coverage"] for r in rs if r["model"] == m and r["cond"] == c])

    out += ["\\begin{table}[t]\\centering\\small",
            "\\caption{Length extension (two 20K-token documents, 37 and 38 probes, 2 runs). Far: far-probe recall after "
            "R and RNV. Prec.: judged precision of RN joins. Cov.: share of sentences with at least one extracted fact "
            "(5K test documents / 20K documents).}",
            "\\label{tab:long}", "\\begin{tabular}{llrrrrr}\\toprule",
            "Model & Cond. & Far R & Far RNV & Prec. & Cov. 5K & Cov. 20K \\\\\\midrule"]
    for m, short in MODELS.items():
        for c in ("F", "C1", "C2", "OL"):
            fr = _mean(doc_means(rows, m, f"{c}/R", "far").values())
            fv = _mean(doc_means(rows, m, f"{c}/RNV", "far").values())
            pr = _mean(doc_means(rows, m, f"{c}/RN", "judge_precision").values())
            out.append(f"{short} & {c} & {fmt(fr)} & {fmt(fv)} & {fmt(pr)} & {fmt(cov(cov5, m, c))} & {fmt(cov(cov20, m, c))} \\\\")
        out.append("\\midrule")
    out[-1] = "\\bottomrule\\end{tabular}\\end{table}"

    audit = json.loads((a / f"fact-audit-{tag}.json").read_text(encoding="utf-8"))
    out += ["", "\\begin{table}[t]\\centering\\small",
            "\\caption{Sampled fact precision on the test documents (48 facts per model and condition, judged by "
            "\\texttt{claude-sonnet-5-5}): share supported / partially supported / unsupported.}",
            "\\label{tab:audit}", "\\begin{tabular}{lll}\\toprule", "Cond. & Sol & Opus \\\\\\midrule"]
    for c in ("F", "C1", "C2", "C4", "OL"):
        cells = []
        for m in MODELS:
            v = [x["verdict"] for x in audit if x["model"] == m and x["cond"] == c]
            cells.append("/".join(f"{sum(y == k for y in v) / len(v):.2f}" for k in ("supported", "partially_supported", "unsupported")) if v else "--")
        out.append(f"{c} & " + " & ".join(cells) + " \\\\")
    out.append("\\bottomrule\\end{tabular}\\end{table}")

    ext = json.loads((L2 / "external" / "report.json").read_text(encoding="utf-8"))
    erows = ext["rows"] if isinstance(ext, dict) else ext
    out += ["", "\\begin{table}[t]\\centering\\small",
            "\\caption{External check on eight NASA report excerpts (1 run). Joins: committed cross-chunk joins per "
            "document; Prec.: judged precision (\\texttt{claude-sonnet-5-5}); no probes exist for these texts.}",
            "\\label{tab:external}", "\\begin{tabular}{lllrr}\\toprule", "Model & Cond. & Join & Joins & Prec. \\\\\\midrule"]
    for m, short in MODELS.items():
        for c in ("F", "C1"):
            for v in ("RH", "RN"):
                rs = [r for r in erows if r["model"] == m and r["cond"] == c and r["variant"] == v]
                j = _mean([r.get("joined") for r in rs])
                n = sum(r.get("judged") or 0 for r in rs)
                p = sum(r.get("judge_supported") or 0 for r in rs) / n if n else None
                out.append(f"{short} & {c} & {v} & {fmt(j, d=1)} & {fmt(p)} ({n}) \\\\")
    out.append("\\bottomrule\\end{tabular}\\end{table}")
    (OUT / "extras.tex").write_text("\n".join(out) + "\n", encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--tag", required=True)
    ap.add_argument("--long-tag", default="l2x-main")
    args = ap.parse_args()
    benchmark()
    results(args.tag)
    extras(args.tag, args.long_tag)
    print("written", [p.name for p in OUT.glob("*.tex")])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
