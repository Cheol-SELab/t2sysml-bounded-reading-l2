#!/usr/bin/env python3
"""Document-aware precision judge for L2 named joins (revision round 2, blocker B3).

The frozen study judged every joined flow on the join's own evidence (two evidence sentences, the
sentence before each, alias declarations) with the verifier's prompt (run_l2.VERIFY_PROMPT). That
judge cannot see a competing producer or a second item with the same head noun elsewhere in the
document. This post-hoc sensitivity analysis asks the configured third-model judge (claude-sonnet-5-5,
freeze amendment 1) again with an expanded context: the join's own evidence plus every other sentence
of the document that mentions the item's head noun or full surface, in document order, cut to
--context-cap tokens (evidence first; truncation is recorded per join).

Two prompt arms, selected with --prompt:
  context   the frozen VERIFY_PROMPT decision wording unchanged, with the extra sentences appended
            as a labelled block. Differences to the evidence-only verdict isolate the effect of the
            added context (cache l2-judge-docaware-ctx).
  combined  a rewritten prompt that also asks the judge to consider competing producers and similarly
            named items (DOCAWARE_PROMPT). Differences reflect prompt wording AND context together
            (cache l2-judge-docaware). This arm is reported as a combined sensitivity, not as a causal
            context effect.

Historical values are never recomputed by new calls: the verifier verdict (RNV membership, including
recorded verifier errors) is read from the saved checks of the frozen report (analysis/<tag>.json);
the evidence-only judge verdict is read from the historical judge cache (l2-judge) in offline mode and
reconciled per run against the saved judged/judge_supported counts; any mismatch fails the run.
Cache misses and provider errors of the new arm are reported as "unresolved", excluded from every
precision denominator, and make the exit code nonzero unless --allow-unresolved is given.

    python scripts/journal/judge_l2_docaware.py report --tag l2x-main --prompt context
    python scripts/journal/judge_l2_docaware.py report --tag l2x-main --prompt combined
    python scripts/journal/judge_l2_docaware.py report --tag test-main --prompt context --sample 120 --seed 7

Set T2M_OFFLINE=1 to forbid model calls (every new-arm request must then be a cache hit).
No gpt-5.5 call is possible from this script. Outputs: analysis/judge-docaware-<tag>-<prompt>.{json,md}.
"""

from __future__ import annotations

import argparse
import functools
import hashlib
import json
import os
import random
import sys
from collections import Counter
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))
sys.path.insert(0, str(ROOT / "scripts" / "journal"))

from t2m_eval.l2_ledger import clean, join, words  # noqa: E402  (frozen)
from t2m_eval.long_memory import Registry, resolve_facts  # noqa: E402  (frozen)
from t2m_eval.normalize import norm_text  # noqa: E402
from t2m_pipeline.llm_clients import CachedClient, LLMCallError, load_registry, make_client  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

import run_l2  # noqa: E402  (frozen; imported, not modified)

L2, EXP = run_l2.L2, run_l2.EXP
JUDGE = run_l2.JUDGE  # claude-sonnet-5-5 (amendment 1)
assert JUDGE != "gpt-5.5"
OFFLINE = bool(os.environ.get("T2M_OFFLINE"))
TAG_PLAN = {"test-main": ([f"L2T{i}" for i in range(1, 9)], ["F", "C1", "C2", "C4", "OL"], 3),
            "l2x-main": (["L2X1", "L2X2"], ["F", "C1", "C2", "OL"], 2)}
CACHE = {"context": "l2-judge-docaware-ctx", "combined": "l2-judge-docaware"}

CONTEXT_BLOCK = """

Other sentences of the same document that mention this item or a similarly named item (for context only):
{context}"""

DOCAWARE_PROMPT = """Check one candidate model relation against sentences of a long engineering document. Unit ids show the order of the sentences in the document; the sentences come from different places.

Candidate: {source} provides "{payload}" to {target} (an information or material flow).

Evidence sentences used to propose the candidate:
{evidence}

Other sentences of the same document that mention this item, a similarly named item, or another element that produces or sends such an item:
{context}

Answer "supported" only if the document states that {source} produces or sends this item AND that {target} receives or uses the same item (it may be named more briefly in one sentence), and no other sentence shows that the item {target} uses comes from a different producer or is a different item with a similar name. Answer "unsupported" if the sentences describe different items, the wrong elements, the opposite direction, or if another producer of the item the consumer uses is stated. Answer "uncertain" if the text is not clear enough. Return JSON {{"verdict": ..., "reason": "one sentence"}}."""


def build_prompt(arm: str, f: dict, evidence: str, context: str) -> str:
    if arm == "combined":
        return DOCAWARE_PROMPT.format(source=f["source"], target=f["target"], payload=f["payload"], evidence=evidence, context=context)
    base = run_l2.VERIFY_PROMPT.format(source=f["source"], target=f["target"], payload=f["payload"], evidence=evidence)
    return base + CONTEXT_BLOCK.format(context=context)


def head_noun(item: str) -> str:
    ws = words(item)
    return ws[-1] if ws else norm_text(item)


def context_units(units, pos, item: str, evidence_ids: set[str]) -> list[str]:
    hn, full = head_noun(item), norm_text(item)
    out = []
    for u in units:
        if u["unit_id"] in evidence_ids:
            continue
        t = norm_text(u["text"])
        if (hn and hn in set(t.split())) or (full and f" {full} " in f" {t} "):
            out.append(u["unit_id"])
    return sorted(out, key=pos.get)


def evidence_ids(f, units, pos, reg):
    """Same evidence selection as the frozen run_l2.verify_joins."""
    ids = []
    for uid in f["evidence_units"]:
        if uid in pos:
            i = pos[uid]
            ids += [units[i - 1]["unit_id"]] if i > 0 else []
            ids.append(uid)
    for name in (f["source"], f["target"]):
        first = reg.first.get(name)
        if first in pos and reg.aliases.get(name):
            ids.append(first)
    return sorted(dict.fromkeys(ids), key=pos.get)


def flow_key(f):
    return (norm_text(f.get("source")), norm_text(f.get("target")), norm_text(f.get("payload")), f.get("unit_id"))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["report"])
    ap.add_argument("--tag", required=True, choices=sorted(TAG_PLAN))
    ap.add_argument("--prompt", required=True, choices=sorted(CACHE))
    ap.add_argument("--models", default="gpt-6.1-sol,claude-opus-5-5")
    ap.add_argument("--sample", type=int, default=0, help="seeded random sample of named joins (0 = all)")
    ap.add_argument("--seed", type=int, default=7)
    ap.add_argument("--context-cap", type=int, default=4096)
    ap.add_argument("--allow-unresolved", action="store_true")
    args = ap.parse_args()
    models = args.models.split(",")
    load_dotenv_if_present()
    registry = load_registry(EXP / "models-l2.json")
    run_l2.CachedClient = functools.partial(CachedClient, offline=True)  # historical judge verdicts: cache only
    docs, conds, nsamp = TAG_PLAN[args.tag]
    saved = json.loads((L2 / "analysis" / f"{args.tag}.json").read_text(encoding="utf-8"))["rows"]
    saved_by = {(r["doc"], r["model"], r["cond"], r["sample"], r["variant"]): r for r in saved}
    ntok = run_l2.ntok
    problems: list[str] = []

    # 1. join universe with historical verifier verdict (saved checks) and evidence-only judge verdict (historical cache)
    joins, universe = [], Counter()
    for d in docs:
        base, units, gt = run_l2.doc_inputs(d)
        pos = {u["unit_id"]: i for i, u in enumerate(units)}
        for m in models:
            for c in conds:
                for s in range(nsamp):
                    p = base / "runs" / m / c / f"s{s}.json"
                    if not p.is_file():
                        problems.append(f"missing planned run {d} {m} {c} s{s}")
                        continue
                    rec = json.loads(p.read_text(encoding="utf-8"))
                    if rec.get("failed"):
                        problems.append(f"failed run {d} {m} {c} s{s}")
                        continue
                    reg = Registry()
                    reg.update(rec["entities"])
                    resolved = resolve_facts(reg, clean(rec["facts"]))
                    j, _held = join(resolved, "named")
                    joined = [f for f in j if f.get("joined")]
                    universe[(m, c)] += len(joined)
                    if not joined:
                        continue
                    rnv_row, rn_row = saved_by.get((d, m, c, s, "RNV")), saved_by.get((d, m, c, s, "RN"))
                    if rnv_row is None or rn_row is None:
                        problems.append(f"no saved RN/RNV rows for {d} {m} {c} s{s}")
                        continue
                    by_key = {}
                    for ch in rnv_row.get("checks") or []:
                        by_key.setdefault(flow_key(ch["flow"]), []).append(ch["verdict"])
                    _k, jlog = run_l2.verify_joins(registry[JUDGE], JUDGE, s, joined, units, reg, cache="l2-judge")
                    ev_sup = 0
                    for f, jl in zip(joined, jlog):
                        vs = by_key.get(flow_key(f))
                        vv = vs.pop(0) if vs else None
                        if vv is None:
                            problems.append(f"no saved verifier check for {d} {m} {c} s{s} {flow_key(f)}")
                        ev = jl["verdict"] if jl["verdict"] != "error" else "unresolved_historical"
                        ev_sup += ev == "supported"
                        joins.append({"doc": d, "model": m, "cond": c, "sample": s, "source": f["source"], "target": f["target"],
                                      "payload": f["payload"], "unit_id": f["unit_id"], "evidence_units": f["evidence_units"], "match": f.get("match"),
                                      "verifier": run_l2.VERIFIER.get(m, m), "verifier_verdict": vv, "in_rnv": vv == "supported",
                                      "verdict_evidence_only": ev, "_units": units, "_pos": pos, "_reg": reg})
                    if (rn_row.get("judged"), rn_row.get("judge_supported")) != (len(joined), ev_sup):
                        problems.append(f"evidence-only judge reconciliation failed {d} {m} {c} s{s}: saved {rn_row.get('judged')}/{rn_row.get('judge_supported')} vs cache {len(joined)}/{ev_sup}")
    print(f"{args.tag}: {len(joins)} named joins; universe per (model, cond): {dict(universe)}; historical problems: {len(problems)}")
    if problems and not args.allow_unresolved:
        for pr in problems[:20]:
            print("  !", pr)
        for jn in joins:
            jn.pop("_units", None), jn.pop("_pos", None), jn.pop("_reg", None)
        (L2 / "analysis" / f"judge-docaware-{args.tag}-{args.prompt}.FAILED.json").write_text(json.dumps({"problems": problems}, indent=1), encoding="utf-8")
        return 3
    selected = joins
    if args.sample and args.sample < len(joins):
        rnd = random.Random(args.seed)
        idx = sorted(rnd.sample(range(len(joins)), args.sample))
        selected = [joins[i] for i in idx]

    # 2. new-arm judgment
    spec = registry[JUDGE]
    unresolved = Counter()
    prompt_hashes = set()
    for jn in selected:
        units, pos, reg = jn["_units"], jn["_pos"], jn["_reg"]
        ev_ids = evidence_ids(jn, units, pos, reg)
        extra = context_units(units, pos, jn["payload"], set(ev_ids))
        byid = {u["unit_id"]: u["text"] for u in units}
        ev_text = "\n".join(f"{i}: {byid[i]}" for i in ev_ids)
        budget, shown, used = args.context_cap - ntok(ev_text), [], 0
        for i in extra:
            t = ntok(f"{i}: {byid[i]}") + 1
            if used + t > budget:
                break
            shown.append(i)
            used += t
        ctx_text = "\n".join(f"{i}: {byid[i]}" for i in shown) or "(none found)"
        prompt = build_prompt(args.prompt, jn, ev_text, ctx_text)
        prompt_hashes.add(hashlib.sha256(prompt.split("Candidate:")[0].encode("utf-8")).hexdigest()[:16])
        c = CachedClient(make_client(spec, schema=run_l2.VERIFY_SCHEMA, schema_name="flow_check",
                                     system_prompt="You check model relations against source text. Return JSON only."),
                         EXP / "cache" / CACHE[args.prompt] / JUDGE, sample=jn["sample"], offline=OFFLINE)
        try:
            out = json.loads(c.complete(prompt))
            verdict, reason = out["verdict"], out.get("reason", "")
        except LLMCallError as e:
            kind = "cache_miss" if "cache miss" in str(e) else "provider_error"
            unresolved[kind] += 1
            verdict, reason = "unresolved", f"{kind}: {str(e)[:160]}"
        except Exception as e:  # noqa: BLE001
            unresolved["other_error"] += 1
            verdict, reason = "unresolved", f"{type(e).__name__}: {str(e)[:160]}"
        jn.update({"evidence_ids_shown": ev_ids, "extra_units": shown, "extra_units_available": len(extra), "truncated": len(shown) < len(extra),
                   "context_tokens": ntok(ev_text) + used, "verdict_docaware": verdict, "reason_docaware": reason, "judge": JUDGE,
                   "prompt_arm": args.prompt, "cached": c.last_hit})
    for jn in joins:
        jn.pop("_units", None), jn.pop("_pos", None), jn.pop("_reg", None)

    # 3. report
    def prec(sel, key):
        sel = [x for x in sel if x[key] in ("supported", "unsupported", "uncertain")]
        n = len(sel)
        sup = sum(x[key] == "supported" for x in sel)
        return [sup, n, (sup / n if n else None)]

    f2 = lambda t: "--" if t[2] is None else f"{t[2]:.2f} ({t[0]}/{t[1]})"  # noqa: E731
    md = [f"# Document-aware judge — {args.tag}, prompt arm `{args.prompt}` (post-hoc sensitivity analysis)", "",
          f"Judge `{JUDGE}` (amendment 1); context cap {args.context_cap} tokens; {len(selected)} of {len(joins)} named joins selected"
          + (f" (seeded sample, seed {args.seed})" if args.sample else " (all)") + f"; unresolved new-arm judgments: {dict(unresolved)}; offline: {OFFLINE}; "
          f"prompt-template hashes: {sorted(prompt_hashes)}.", "",
          "Join universe (named joins per model and condition over all runs): " + ", ".join(f"{m}/{c}: {n}" for (m, c), n in sorted(universe.items())) + ".", "",
          "Evidence-only verdicts are the historical judge verdicts (same sentences and prompt as the verifier). RNV = joins the cross-vendor verifier kept "
          "(saved checks; verifier errors withdrew the join). Denominators count only resolved new-arm verdicts.", "",
          "| model | cond | selected | RN prec. evidence-only | RN prec. doc-aware | RNV joins | RNV prec. evidence-only | RNV prec. doc-aware | withdrawn by V (errors) | truncated contexts | agree | ev-only sup / doc-aware not | ev-only not / doc-aware sup | unresolved |",
          "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    summary = {}
    for m in models:
        for c in conds:
            sel = [x for x in selected if x["model"] == m and x["cond"] == c]
            if not sel:
                continue
            res = [x for x in sel if x["verdict_docaware"] != "unresolved"]
            rnv = [x for x in sel if x["in_rnv"]]
            withdrawn = sum(not x["in_rnv"] for x in sel)
            verr = sum(x["verifier_verdict"] == "error" for x in sel)
            agree = sum((x["verdict_evidence_only"] == "supported") == (x["verdict_docaware"] == "supported") for x in res)
            a_not = sum(x["verdict_evidence_only"] == "supported" and x["verdict_docaware"] != "supported" for x in res)
            n_sup = sum(x["verdict_evidence_only"] != "supported" and x["verdict_docaware"] == "supported" for x in res)
            e = {"n": len(sel), "n_resolved": len(res), "rn_prec_evidence": prec(sel, "verdict_evidence_only"), "rn_prec_docaware": prec(sel, "verdict_docaware"),
                 "rnv_n": len(rnv), "rnv_prec_evidence": prec(rnv, "verdict_evidence_only"), "rnv_prec_docaware": prec(rnv, "verdict_docaware"),
                 "withdrawn_by_verifier": withdrawn, "verifier_errors": verr, "truncated": sum(x["truncated"] for x in sel),
                 "agree": agree, "evonly_sup_docaware_not": a_not, "evonly_not_docaware_sup": n_sup,
                 "docaware_verdicts": dict(Counter(x["verdict_docaware"] for x in sel)), "unresolved": len(sel) - len(res)}
            summary[f"{m}|{c}"] = e
            md.append(f"| {m} | {c} | {len(sel)} | {f2(e['rn_prec_evidence'])} | {f2(e['rn_prec_docaware'])} | {len(rnv)} | {f2(e['rnv_prec_evidence'])} | "
                      f"{f2(e['rnv_prec_docaware'])} | {withdrawn} ({verr}) | {e['truncated']} | {agree}/{len(res)} | {a_not} | {n_sup} | {e['unresolved']} |")
    out_dir = L2 / "analysis"
    stem = f"judge-docaware-{args.tag}-{args.prompt}"
    (out_dir / f"{stem}.json").write_text(json.dumps({"tag": args.tag, "prompt_arm": args.prompt, "judge": JUDGE, "context_cap": args.context_cap,
                                                       "sample": args.sample, "seed": args.seed, "offline": OFFLINE, "n_joins_total": len(joins),
                                                       "n_selected": len(selected), "universe": {f"{m}|{c}": n for (m, c), n in universe.items()},
                                                       "unresolved": dict(unresolved), "prompt_template_hashes": sorted(prompt_hashes),
                                                       "historical_problems": problems, "summary": summary, "joins": selected},
                                                      ensure_ascii=False, indent=1), encoding="utf-8")
    (out_dir / f"{stem}.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))
    print(f"unresolved: {dict(unresolved)}")
    return 1 if (sum(unresolved.values()) and not args.allow_unresolved) else 0


if __name__ == "__main__":
    raise SystemExit(main())
