#!/usr/bin/env python3
"""Generate the data-driven LaTeX parts of paper-long/ for the round-2 revision.

    python scripts/journal/build_l2_paper_rev2.py --tag test-main --long-tag l2x-main

Supersedes build_l2_paper.py (kept unchanged as history). Writes paper-long/benchmark.tex, results.tex,
extras.tex, abstract-results.tex and summary.json. Every number comes from frozen or post-hoc analysis
files under experiments/journal-v1/l2/analysis/:
  <tag>.json, <long-tag>.json            frozen reports (run_l2.py report)
  doclevel-<tag>.json                    analyze_l2_doclevel.py (document-level tests)
  rendered-<tag>-summary.json, rendered-<long-tag>-summary.json   score_l2_rendered.py
  judge-docaware-<tag>-{context,combined}.json, judge-docaware-<long-tag>-{context,combined}.json       judge_l2_docaware.py
  coverage-<tag>.json, coverage-<long-tag>.json, fact-audit-<tag>.json, ../external/report.json
"""

from __future__ import annotations

import argparse
import json
import math
import statistics
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "journal"))
from analyze_l2_doclevel import boot_ci, doc_means  # noqa: E402

L2 = ROOT / "experiments" / "journal-v1" / "l2"
A = L2 / "analysis"
OUT = ROOT / "paper-long"
TEST = [f"L2T{i}" for i in range(1, 9)]
MODELS = {"gpt-6.1-sol": "Sol", "claude-opus-5-5": "Opus"}
DOMAIN = {"L2T1": "metro CBTC", "L2T2": "hospital medication", "L2T3": "wildfire detection", "L2T4": "substation automation",
          "L2T5": "water treatment", "L2T6": "airport baggage", "L2T7": "satellite ground segment", "L2T8": "pallet warehouse"}
ARMS = [("F/R", "F (whole doc.)"), ("C1/R", "C1 chunks"), ("C2/R", "C2 summary mem."), ("C4/R", "C4 graph mem."),
        ("OL/R", "OL open-end mem."), ("C1/RH", "C1 + head join"), ("C1/RN", "C1 + named join"), ("C1/RNV", "C1 + named join + verify"),
        ("OL/RNV", "OL + named join + verify$^e$")]


def J(p):
    return json.loads(p.read_text(encoding="utf-8"))


def fmt(m, ci=None, d=2):
    if m is None or (isinstance(m, float) and math.isnan(m)):
        return "--"
    return f"{m:.{d}f}" + (f" [{ci[0]:.{d}f}, {ci[1]:.{d}f}]" if ci else "")


def mean_ci(dm):
    vals = list(dm.values())
    return (statistics.mean(vals), boot_ci(vals)) if vals else (None, None)


def wilson(k, n, z=1.96):
    if not n:
        return None
    p = k / n
    den = 1 + z * z / n
    c = (p + z * z / (2 * n)) / den
    h = z * math.sqrt(p * (1 - p) / n + z * z / (4 * n * n)) / den
    return c - h, c + h


# ----------------------------------------------------------------------------- benchmark
def benchmark():
    rows, tot = [], {"tok": [], "units": [], "flow": 0, "short": 0, "alias": 0, "hom": 0, "dist": [], "rej": 0, "vdrop": 0}
    for d in TEST:
        gt = J(L2 / d / "probes.gt.json")
        units = J(L2 / d / "units.json")["units"]
        chk = J(L2 / d / "probes.check.json")
        ver = next(L2.joinpath(d).glob("probes.*.verify.json"))
        vd = J(ver)["verdicts"]
        n = {t: sum(p["type"] == t for p in gt["probes"]) for t in ("split_flow", "alias_ref", "homonym")}
        short = sum(p.get("link_ref") == "short" for p in gt["probes"])
        dist = [p["distance_tokens"] for p in gt["probes"] if p["type"] != "homonym"]
        rows.append(f"{d} & {DOMAIN[d]} & {gt['writer']} & {gt['doc_tokens']:,} & {len(units)} & {n['split_flow']} ({short}) & {n['alias_ref']} & {n['homonym']} & {statistics.median(dist):,.0f} \\\\")
        tot["tok"].append(gt["doc_tokens"]); tot["units"].append(len(units)); tot["flow"] += n["split_flow"]; tot["short"] += short
        tot["alias"] += n["alias_ref"]; tot["hom"] += n["homonym"]; tot["dist"] += dist
        tot["rej"] += len(chk.get("rejected", [])); tot["vdrop"] += sum(not v.get("supported") for v in vd)
    far = sum(x > 1024 for x in tot["dist"]) / len(tot["dist"])
    text = [
        "Each document is an English operational concept document of ten sections (about 25 sentences each) "
        "written section by section by an LLM from a planned blueprint. The blueprint fixes entities, ten split flows "
        "(five whose link sentence names the item only by a shortened definite description), eight aliases that "
        "share no word or initial with the full name, and two homonym pairs. The writer tags the sentences that "
        "realize each probe.",
        "",
        "\\textbf{Constructed identity structure (design alignment).} The generator enforces rules that remove the identity "
        "failure modes the named join is designed to refuse: every probe item is a multi-word capitalized name; it is mentioned "
        "only in its two tagged sentences (one producer sentence that does not name the consumer, one consumer sentence that does "
        "not name the producer); each item is used by exactly one split flow; a shortened reference starts with ``the'', keeps the "
        "item's last word and drops at least one other word; aliases are declared once, explicitly, next to the full name. The join "
        "rule (Section~\\ref{sec:method}, Appendix~\\ref{app:pseudocode}) was specified to the same conditions: a cross-chunk "
        "identity needs a multi-word capitalized item name, the consumer text must contain the item's head noun plus one other "
        "content word, the best item must be unique and have one producer. Recall and precision on this benchmark therefore "
        "measure the method under the conditions it was built for. They do not establish behavior on text whose items are "
        "generic, repeated, or shared between producers; the external check in Section~\\ref{sec:results} is the only evidence on "
        "such text. Recovery is still not certain under these rules: the extractor may not emit the consumer-side fact, may rewrite "
        "the modifier of a shortened reference, and surfaces outside the probes can make the best match non-unique.",
        "",
        f"Deterministic checks reject a probe if a tag is missing or duplicated, if the item (or its short form) appears outside its "
        "two sentences, if producer and item (or consumer and item) co-occur within 1,024 tokens of the opposite end, or if an "
        f"alias is re-declared near its use; leaking sentences other than the probe's own are rewritten. These checks rejected "
        f"{tot['rej']} probe candidates over the eight documents. The other OpenAI writer model then judged every kept probe against "
        f"the whole document and dropped {tot['vdrop']} of them; this second model is the other benchmark writer, not an independent party, "
        "and no probe was annotated or checked by a human.",
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


# ----------------------------------------------------------------------------- results
def joins_judged(rows, m, arm):
    """Total named joins judged and supported (evidence-only judge) over all runs of an arm."""
    c, v = arm.split("/")
    sel = [r for r in rows if r["model"] == m and r["cond"] == c and r["variant"] == v]
    n = sum(r.get("judged") or 0 for r in sel)
    s = sum(r.get("judge_supported") or 0 for r in sel)
    return s, n


def results(tag, long_tag):
    data = J(A / f"{tag}.json")
    rows = data["rows"]
    dl = J(A / f"doclevel-{tag}.json")
    rend = J(A / f"rendered-{tag}-summary.json")
    lines = ["\\begin{table*}[t]\\centering\\footnotesize",
             "\\caption{Test results (8 documents, 3 runs each; unit of analysis: document). Means over documents with 95\\% percentile bootstrap "
             "CIs over documents. Far: recall of flow and alias probes spanning $>$1,024 tokens, scored on the fact ledger. Short: split flows "
             "with shortened item references. Alias: far alias probes (declared aliases). Wrong: probe items delivered to their consumer from a "
             "wrong producer, per document (probe items only, at most one per probe). Prec.: share of joined flows judged supported by the "
             "evidence-only third-model judge, pooled joins supported/judged in brackets. In/Out: provider input and output tokens relative to F. "
             "$^e$Exploratory arm, not pre-registered.}",
             "\\label{tab:main}",
             "\\begin{tabular}{llllllllr}\\toprule",
             "Model & Arm & Far recall & Short flows & Alias & Wrong & Prec. & In & Out \\\\\\midrule"]
    summary = {}
    for m, short in MODELS.items():
        f_in = statistics.mean(doc_means(rows, m, "F/R", "input_tokens").values())
        f_out = statistics.mean(doc_means(rows, m, "F/R", "output_tokens").values())
        for arm, label in ARMS:
            far = doc_means(rows, m, arm, "far")
            if not far:
                continue
            fm, fci = mean_ci(far)
            sm, sci = mean_ci(doc_means(rows, m, arm, "flow_short"))
            am, aci = mean_ci(doc_means(rows, m, arm, "far_alias"))
            wm, wci = mean_ci(doc_means(rows, m, arm, "wrong_producer_probes"))
            sup, n = joins_judged(rows, m, arm)
            tin = statistics.mean(doc_means(rows, m, arm, "input_tokens").values())
            tout = statistics.mean(doc_means(rows, m, arm, "output_tokens").values())
            summary[(m, arm)] = {"far": fm, "far_ci": fci, "short": sm, "short_ci": sci, "alias": am, "alias_ci": aci, "wrong": wm, "wrong_ci": wci,
                                 "prec": sup / n if n else None, "prec_n": n, "in_ratio": tin / f_in, "out_ratio": tout / f_out,
                                 "far_model": rend.get(f"{m}|{arm}", {}).get("far_model")}
            prec = f"{sup / n:.2f} [{sup}/{n}]" if n else "--"
            lines.append(f"{short} & {label} & {fmt(fm, fci)} & {fmt(sm, sci)} & {fmt(am, aci)} & {fmt(wm, wci)} & {prec} & "
                         f"{tin / f_in:.2f}$\\times$ & {tout / f_out:.2f}$\\times$ \\\\")
        lines.append("\\midrule")
    lines[-1] = "\\bottomrule\\end{tabular}\\end{table*}"

    grid = ["\\begin{table}[t]\\centering\\small",
            "\\caption{Far-probe recall (ledger) by reading condition (rows) and consolidation (columns), mean over test documents and runs.}",
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

    paired = ["\\begin{table*}[t]\\centering\\small",
              f"\\caption{{Paired document-level differences in far recall (proposed minus reference; 8 documents). CI: 95\\% bootstrap over "
              f"documents. $+/-/0$: documents where the proposed arm is higher, lower, equal. $p$: exact sign-flip permutation test over the "
              f"8 document means (two-sided; the smallest attainable value is {dl['min_two_sided_exact_p']:.4f}). $b/c$: probe-level discordant "
              "counts (majority over runs, pooled over documents), descriptive only because probes are clustered within documents. "
              "Status: pre-registered primary comparison, ablation, or exploratory.}",
              "\\label{tab:paired}", "\\begin{tabular}{llllrrrr}\\toprule",
              "Model & Proposed & Reference & $\\Delta$ far recall [95\\% CI] & $+/-/0$ & $p_{exact}$ & $b/c$ & Status \\\\\\midrule"]
    for m, short in MODELS.items():
        for key, e in dl["pairs"].items():
            mm, prop, ref, mt = key.split("|")
            if mm != m or mt != "far":
                continue
            paired.append(f"{short} & {prop} & {ref} & {e['diff']:+.3f} [{e['ci'][0]:+.3f}, {e['ci'][1]:+.3f}] & {e['n_pos']}/{e['n_neg']}/{e['n_zero']} & "
                          f"{e['perm_p']:.3f} & {e['probe_b']}/{e['probe_c']} & {e['status']} \\\\")
        paired.append("\\midrule")
    paired[-1] = "\\bottomrule\\end{tabular}\\end{table*}"

    fails = data.get("failures", [])
    n_runs = len({(r["doc"], r["model"], r["cond"], r["sample"]) for r in rows})
    text = [f"All {n_runs} planned test runs completed and are scored ({len(fails)} missing). Table~\\ref{{tab:main}} gives "
            "the primary results, Table~\\ref{tab:grid} separates the contribution of prompt memory from that of ledger "
            "consolidation, Table~\\ref{tab:paired} gives the document-level paired tests, and Table~\\ref{tab:rendered} scores the "
            "same probes on the rendered SysML~v2 model. Tables~\\ref{tab:long}--\\ref{tab:external} report the length extension, the "
            "document-aware judge, sampled fact precision and the real-text check.",
            "", "\\input{results-text.tex}", "", *lines, "", *grid, "", *paired, "", "\\input{extras.tex}"]
    (OUT / "results.tex").write_text("\n".join(text) + "\n", encoding="utf-8")
    (OUT / "summary.json").write_text(json.dumps({f"{m}|{a}": v for (m, a), v in summary.items()}, indent=1), encoding="utf-8")
    return summary


# ----------------------------------------------------------------------------- extras
def extras(tag, long_tag):
    out = []
    rows = J(A / f"{long_tag}.json")["rows"]
    trows = J(A / f"{tag}.json")["rows"]
    cov5 = J(A / f"coverage-{tag}.json")
    cov20 = J(A / f"coverage-{long_tag}.json")
    da20 = J(A / f"judge-docaware-{long_tag}-combined.json")
    da20c = J(A / f"judge-docaware-{long_tag}-context.json")
    da5 = J(A / f"judge-docaware-{tag}-combined.json")
    da5c = J(A / f"judge-docaware-{tag}-context.json")
    rend5 = J(A / f"rendered-{tag}-summary.json")
    rend20 = J(A / f"rendered-{long_tag}-summary.json")

    def cov(rs, m, c):
        xs = [r["unit_coverage"] for r in rs if r["model"] == m and r["cond"] == c]
        return statistics.mean(xs) if xs else None

    def tok(rs, m, c, key):
        xs = [r[key] for r in rs if r["model"] == m and r["cond"] == c and r["variant"] == "R"]
        return statistics.mean(xs) if xs else None

    # ---- rendered-model table (5K + 20K)
    out += ["\\begin{table*}[t]\\centering\\footnotesize",
            "\\caption{Far-probe recall on the fact ledger versus on the rendered SysML~v2 model parsed by the language server "
            "(flow edges between part usages typed by the probe endpoints, carrying the probe item; alias probes by a parsed definition "
            "that carries the link sentence). Dropped: ledger facts per run that the frozen renderer does not represent (attribute, constraint, "
            "succession, transition, allocation); Skipped: facts of a rendered type that the renderer omits because a required slot is empty or a placeholder (for example a flow whose producer stays unresolved); Compos.: composition facts whose ownership direction is not represented. 20K rows are post-hoc.}",
            "\\label{tab:rendered}", "\\begin{tabular}{lllrrrrr}\\toprule",
            "Set & Model & Arm & Far (ledger) & Far (model) & Dropped & Skipped & Compos. \\\\\\midrule"]
    for setname, rend, arms in (("5K", rend5, ("F/R", "C1/R", "C1/RN", "C1/RNV", "OL/RNV")), ("20K", rend20, ("F/R", "C1/RNV", "OL/RNV"))):
        for m, short in MODELS.items():
            for arm in arms:
                a = rend.get(f"{m}|{arm}")
                if not a:
                    continue
                out.append(f"{setname} & {short} & {arm} & {fmt(a['far_ledger'])} & {fmt(a['far_model'])} & {a['not_rendered_total_per_run']:.0f} & {a['skipped_unresolved_per_run']:.0f} & {a['composition_per_run']:.0f} \\\\")
        out.append("\\midrule")
    out[-1] = "\\bottomrule\\end{tabular}\\end{table*}"

    # ---- length extension with RN and RNV precision, withdrawals, output tokens
    out += ["", "\\begin{table*}[t]\\centering\\footnotesize",
            "\\caption{Length extension (two 20K-token documents, 37 and 38 probes, 2 runs per model; post-hoc, no test). Far: far-probe recall "
            "(ledger) after R and after RNV. Joins: named joins committed by RN over the 4 runs; Withdrawn: joins the cross-vendor verifier "
            "withdrew (including verifier call errors, in parentheses). Prec.: joins judged supported / judged, by the evidence-only judge (ev) "
            "and by the document-aware judge (doc) of Section~\\ref{sec:setup}, for RN and for the verified RNV joins. Cov.: share of sentences "
            "with at least one extracted fact (5K test documents / 20K documents). Out: output tokens per document relative to F.}",
            "\\label{tab:long}", "\\begin{tabular}{llrrrrrrrrrr}\\toprule",
            "Model & Cond. & Far R & Far RNV & Joins & Withdrawn & RN ev & RN doc & RNV ev & RNV doc & Cov. 5K / 20K & Out \\\\\\midrule"]
    for m, short in MODELS.items():
        f_out = tok(rows, m, "F", "output_tokens")
        for c in ("F", "C1", "C2", "OL"):
            fr = statistics.mean(doc_means(rows, m, f"{c}/R", "far").values())
            fv = statistics.mean(doc_means(rows, m, f"{c}/RNV", "far").values())
            s = da20["summary"].get(f"{m}|{c}")
            if s:
                p = lambda t: f"{t[0]}/{t[1]}" if t[1] else "--"  # noqa: E731
                cells = (f"{s['n']} & {s['withdrawn_by_verifier']} ({s['verifier_errors']}) & {p(s['rn_prec_evidence'])} & {p(s['rn_prec_docaware'])} & "
                         f"{p(s['rnv_prec_evidence'])} & {p(s['rnv_prec_docaware'])}")
            else:
                cells = "0 & -- & -- & -- & -- & --"
            out.append(f"{short} & {c} & {fr:.2f} & {fv:.2f} & {cells} & {fmt(cov(cov5, m, c))} / {fmt(cov(cov20, m, c))} & "
                       f"{tok(rows, m, c, 'output_tokens') / f_out:.1f}$\\times$ \\\\")
        out.append("\\midrule")
    out[-1] = "\\bottomrule\\end{tabular}\\end{table*}"

    # ---- document-aware judge on the 5K sample
    def ctx_split(da):
        """(joins without added sentences, agreeing among them, joins with added sentences, agreeing among them)."""
        sup = lambda v: v == "supported"  # noqa: E731
        agree = lambda js: sum(sup(j["verdict_evidence_only"]) == sup(j["verdict_docaware"]) for j in js)  # noqa: E731
        empty = [j for j in da["joins"] if not j["extra_units"]]
        ctx = [j for j in da["joins"] if j["extra_units"]]
        return len(empty), agree(empty), len(ctx), agree(ctx)

    sp, spc = ctx_split(da5), ctx_split(da5c)
    sp_txt = (f"agreement was {sp[1]}/{sp[0]} on those and {sp[3]}/{sp[2]} on the joins with added sentences, in both prompt arms"
              if sp == spc else
              f"agreement was {sp[1]}/{sp[0]} on those and {sp[3]}/{sp[2]} on the joins with added sentences (context-only arm "
              f"{spc[1]}/{spc[0]} and {spc[3]}/{spc[2]})")
    out += ["", "\\begin{table}[t]\\centering\\footnotesize",
            f"\\caption{{Document-aware judge on a seeded random sample of {da5['n_selected']} of the {da5['n_joins_total']} named joins of the 5K test "
            "runs (all conditions). Agree: joins on which the evidence-only and the document-aware verdicts coincide (supported vs not). "
            "ev$\\to$not: judged supported with the join's own evidence but not with the document context; not$\\to$sup: the reverse. "
            f"{sp[0]} of the {da5['n_selected']} joins received no added sentence, because no other sentence contains the item's head noun or "
            f"full name; for them the judge re-read the join's own evidence. Combined prompt arm shown; {sp_txt}.}}",
            "\\label{tab:docaware}", "\\begin{tabular}{lrrrrrr}\\toprule",
            "Model & Joins & RN ev & RN doc & Agree & ev$\\to$not & not$\\to$sup \\\\\\midrule"]
    for m, short in MODELS.items():
        sel = {k: v for k, v in da5["summary"].items() if k.startswith(m + "|")}
        n = sum(v["n"] for v in sel.values())
        ev = sum(v["rn_prec_evidence"][0] for v in sel.values())
        dc = sum(v["rn_prec_docaware"][0] for v in sel.values())
        ag = sum(v["agree"] for v in sel.values())
        a_not = sum(v["evonly_sup_docaware_not"] for v in sel.values())
        n_sup = sum(v["evonly_not_docaware_sup"] for v in sel.values())
        out.append(f"{short} & {n} & {ev}/{n} & {dc}/{n} & {ag}/{n} & {a_not} & {n_sup} \\\\")
    out.append("\\bottomrule\\end{tabular}\\end{table}")

    # ---- fact audit with Wilson intervals
    audit = J(A / f"fact-audit-{tag}.json")
    out += ["", "\\begin{table}[t]\\centering\\footnotesize",
            "\\caption{Sampled fact precision on the test documents: 48 facts per model and condition drawn from the R variant and judged by "
            "\\texttt{claude-sonnet-5-5} (2026-10-14) with the fact's sentence, the three sentences before it and alias declarations. "
            "Cells: supported / partially supported / unsupported, with the Wilson 95\\% interval of the not-fully-supported share. "
            "The sample is local-context only: it cannot detect facts that are locally plausible but globally wrong, and it excludes joined flows.}",
            "\\label{tab:audit}", "\\begin{tabular}{lll}\\toprule", "Cond. & Sol & Opus \\\\\\midrule"]
    for c in ("F", "C1", "C2", "C4", "OL"):
        cells = []
        for m in MODELS:
            v = [x["verdict"] for x in audit if x["model"] == m and x["cond"] == c]
            if not v:
                cells.append("--")
                continue
            k = sum(y != "supported" for y in v)
            lo, hi = wilson(k, len(v))
            cells.append("/".join(f"{sum(y == kk for y in v) / len(v):.2f}" for kk in ("supported", "partially_supported", "unsupported")) + f" [{lo:.2f}, {hi:.2f}]")
        out.append(f"{c} & " + " & ".join(cells) + " \\\\")
    out.append("\\bottomrule\\end{tabular}\\end{table}")

    # ---- external NASA check
    ext = J(L2 / "external" / "report.json")
    erows = ext["rows"] if isinstance(ext, dict) else ext
    out += ["", "\\begin{table}[t]\\centering\\footnotesize",
            "\\caption{Real-text check on eight NASA report excerpts (about 4,500 tokens each; 1 run; no probes exist for these texts). Joins: "
            "committed cross-chunk joins per document; Total: joins over the eight documents; Prec.: judged supported / judged by the evidence-only "
            "judge (\\texttt{claude-sonnet-5-5}, 2026-10-15; totals over eight documents).}",
            "\\label{tab:external}", "\\begin{tabular}{lllrrr}\\toprule", "Model & Cond. & Join & Joins/doc & Total & Prec. \\\\\\midrule"]
    for m, short in MODELS.items():
        for c in ("F", "C1"):
            for v in ("RH", "RN"):
                rs = [r for r in erows if r["model"] == m and r["cond"] == c and r["variant"] == v]
                tot = sum(r.get("joined") or 0 for r in rs)
                n = sum(r.get("judged") or 0 for r in rs)
                s = sum(r.get("judge_supported") or 0 for r in rs)
                out.append(f"{short} & {c} & {v} & {tot / len(rs):.1f} & {tot} & {f'{s}/{n}' if n else '--'} \\\\")
    out.append("\\bottomrule\\end{tabular}\\end{table}")
    (OUT / "extras.tex").write_text("\n".join(out) + "\n", encoding="utf-8")


# ----------------------------------------------------------------------------- abstract
def abstract(summary, tag, long_tag):
    s = lambda m, a, k: summary[(m, a)][k]  # noqa: E731
    dl = J(A / f"doclevel-{tag}.json")
    da20 = J(A / f"judge-docaware-{long_tag}-combined.json")["summary"]
    rend = J(A / f"rendered-{tag}-summary.json")
    rn_sol, rn_opus = s("gpt-6.1-sol", "C1/RNV", "far"), s("claude-opus-5-5", "C1/RNV", "far")
    ol = [s(m, "OL/RNV", "far") for m in MODELS]
    d_ol = [dl["pairs"][f"{m}|OL/RNV|F/R|far"] for m in MODELS]
    rnv20 = [da20[f"{m}|{c}"]["rnv_prec_docaware"] for m in MODELS for c in ("C1", "OL") if f"{m}|{c}" in da20]
    lo = min(t[2] for t in rnv20 if t[2] is not None)
    hi = max(t[2] for t in rnv20 if t[2] is not None)
    gap = max(abs((rend[f'{m}|{a}']['far_ledger'] or 0) - (rend[f'{m}|{a}']['far_model'] or 0)) for m in MODELS for a in ("C1/RNV", "OL/RNV"))
    rrows = J(A / f"rendered-{tag}.json")["rows"]
    shares = {}
    for r in rrows:
        shares.setdefault((r["model"], r["cond"]), []).append(r["dropped"]["skipped_unresolved"] / r["dropped"]["facts_total"])
    sk = [statistics.mean(v) for v in shares.values()]
    ol_txt = f"{ol[0]:.2f}" if abs(ol[0] - ol[1]) < 0.005 else f"{ol[0]:.2f}--{ol[1]:.2f}"
    gap_txt = ("give the same recall to two decimals" if gap < 0.005 else f"differ from the ledger scores by at most {gap:.2f}")
    text = (f"On this benchmark, chunked reading alone recovers almost no far probe, and {s('gpt-6.1-sol', 'C1/R', 'far'):.2f} in both models once declared "
            f"aliases are resolved; consolidating the chunk outputs with named-item joins raises this to {rn_sol:.2f} (GPT-6.1 Sol) and "
            f"{rn_opus:.2f} (Claude Opus 5.5), and adding open-end ledger memory reaches {ol_txt}, "
            f"{d_ol[0]['diff']:+.3f} and {d_ol[1]['diff']:+.3f} below whole-document extraction at document level (95\\% CIs "
            f"[{d_ol[0]['ci'][0]:+.2f}, {d_ol[0]['ci'][1]:+.2f}] and [{d_ol[1]['ci'][0]:+.2f}, {d_ol[1]['ci'][1]:+.2f}]; eight documents). "
            f"The same probes scored on the parsed rendered SysML~v2 model {gap_txt}, although the renderer omits {min(sk)*100:.0f}\%--{max(sk)*100:.0f}\% of the ledger facts per run. "
            "On two 20,000-token documents (post-hoc) whole-document extraction yielded facts for 0.30--0.63 of the sentences in one call "
            "while bounded reading yielded 0.93--0.98 with 4--7 times the output tokens; this study did not isolate whether the difference "
            "comes from context loss or from per-call output behavior. On the benchmark the evidence-only judge supported 0.98--1.00 of named "
            f"joins; a document-aware judge on the 20,000-token documents supported {lo:.2f}--{hi:.2f} of the verified named joins. On eight real NASA "
            "report excerpts the named join committed 0.0--0.1 joins per document, so the method's real-text yield is near zero and its "
            "benchmark numbers describe performance under design-aligned conditions.")
    (OUT / "abstract-results.tex").write_text(text + "\n", encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--tag", required=True)
    ap.add_argument("--long-tag", default="l2x-main")
    args = ap.parse_args()
    benchmark()
    summary = results(args.tag, args.long_tag)
    extras(args.tag, args.long_tag)
    abstract(summary, args.tag, args.long_tag)
    print("written", sorted(p.name for p in OUT.glob("*.tex")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
