#!/usr/bin/env python3
"""Score the L2 far probes on the *rendered* SysML v2 model (revision round 2, blocker B5).

The frozen study scored probes on the fact ledger. This post-hoc script renders each run's
consolidated ledger with the frozen renderer (t2m_eval.l2_sysml.render), parses the text with the
local selab SysML v2 language server, and scores the split-flow and alias probes on what the parsed
model contains:

  split_flow  a ``flow`` edge returned by the language server whose source and target part usages
              are typed by part definitions aligning to the probe's producer and consumer, and whose
              declared item type aligns to the probe item. Endpoints come from the graph; the item
              type is read from the rendered ``flow fK of XItem`` line that the edge label names and
              is accepted only if the language server also parsed ``XItem`` as an ItemDefinition.
  alias_ref   a part or item definition parsed by the language server whose identifier aligns to the
              canonical entity and whose doc comment carries the probe's link unit id (doc comments
              are read from the rendered text; the graph does not expose them).
  homonym     not scored on the model; ledger numbers are kept for completeness.

This is a structural check of the parsed model, not a semantic validation of SysML v2 behavior.
Alignment mirrors long_doc.CanonicalAligner on identifier strings (exact identifier, else a unique
containment hit of at least 4 characters; an alias identifier is unresolved); identifiers that two
canonical entities share are rejected as ambiguous and counted.

Historical RNV membership is reconstructed from the saved verifier checks in the frozen report
(analysis/<tag>.json), never from new or missing cache entries; a join without a saved check fails
the run. Ledger scores recomputed here are compared with the saved rows and any mismatch fails the
run. Per run the script also counts ledger facts that the renderer cannot represent.

    python scripts/journal/score_l2_rendered.py --tag test-main --docs L2T1,...,L2T8 --models gpt-6.1-sol,claude-opus-5-5 --conditions F,C1,C2,C4,OL --samples 3 --variants R,RN,RNV
    python scripts/journal/score_l2_rendered.py --tag l2x-main --docs L2X1,L2X2 --models gpt-6.1-sol,claude-opus-5-5 --conditions F,C1,C2,OL --samples 2 --variants R,RN,RNV

Outputs: experiments/journal-v1/l2/analysis/rendered-<tag>.{json,md}, rendered-<tag>-summary.json, and the
rendered text per run under experiments/journal-v1/l2/<DOC>/rendered/<model>/<cond>/<variant>/s<k>.sysml.
Exit code 0 only if every planned run was scored and every reconciliation check passed. No frozen file is modified.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import statistics
import sys
from collections import Counter
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))
sys.path.insert(0, str(ROOT / "scripts" / "journal"))

from t2m_eval.l2_ledger import clean, join  # noqa: E402  (frozen)
from t2m_eval.l2_sysml import ident, render  # noqa: E402  (frozen)
from t2m_eval.long_memory import Registry, resolve_facts  # noqa: E402  (frozen)
from t2m_eval.normalize import norm_text  # noqa: E402
from t2m_eval.sysml_graph import LSP_BIN, SysmlGraphClient  # noqa: E402

import run_l2  # noqa: E402  (frozen; imported for score() and doc_inputs(), not modified)

L2 = ROOT / "experiments" / "journal-v1" / "l2"
RENDERED_TYPES = {"flow", "action", "requirement", "state", "composition"}
_PART = re.compile(r"^\s*part (\w+) : (\w+)[ ;{]", re.M)
_FLOW = re.compile(r"^\s*flow (f\d+) of (\w+) from (\w+) to (\w+)", re.M)
_DEF = re.compile(r"^\s*(part|item) def (\w+) \{ doc /\* @([^*]*) \*/", re.M)


def flow_key(f: dict) -> tuple:
    return (norm_text(f.get("source")), norm_text(f.get("target")), norm_text(f.get("payload")), f.get("unit_id"))


class IdentAligner:
    """CanonicalAligner on rendered identifiers; identifiers shared by two entities are ambiguous."""

    def __init__(self, entities):
        self.canon: dict[str, set[str]] = {}
        self.alias: dict[str, set[str]] = {}
        for e in entities:
            self.canon.setdefault(ident(e["canonical"]).lower(), set()).add(e["entity_id"])
            for a in e.get("aliases", []):
                self.alias.setdefault(ident(a).lower(), set()).add(e["entity_id"])
        self.collisions = sorted(k for k, v in self.canon.items() if len(v) > 1)

    def __call__(self, name):
        k = (name or "").lower()
        if not k:
            return None
        if k in self.canon:
            return next(iter(self.canon[k])) if len(self.canon[k]) == 1 else None
        if k in self.alias:
            return None
        hits = {eid for c, eids in self.canon.items() if (c in k or k in c) and min(len(c), len(k)) >= 4 for eid in eids}
        return hits.pop() if len(hits) == 1 else None


def item_matches(entities, item_id, rendered_item_ident) -> bool:
    e = next(x for x in entities if x["entity_id"] == item_id)
    keys = {ident(e["canonical"]).lower(), *(ident(a).lower() for a in e.get("aliases", []))}
    k = rendered_item_ident.lower()
    return any(k == x or x in k or k in x for x in keys if x)


def score_model(gt: dict, text: str, graph) -> dict:
    """Probe hits on the parsed model with the graph evidence that produced each hit."""
    align = IdentAligner(gt["entities"])
    usage_type = {u: t for u, t in _PART.findall(text)}
    flow_decl = {f: (item, s, t) for f, item, s, t in _FLOW.findall(text)}
    defs: dict[str, set[str]] = {}
    for _kind, name, units in _DEF.findall(text):
        defs.setdefault(name, set()).update(u for u in units.split(",") if u)
    parsed_defs = {n.get("declaredName") or n.get("name") for n in graph.nodes_of("PartDefinition")}
    parsed_items = {n.get("declaredName") or n.get("name") for n in graph.nodes_of("ItemDefinition")}
    edges = []
    for e in graph.edges_of("flow"):
        su, tu = e["source"].split("::")[-1], e["target"].split("::")[-1]
        label = e.get("label") or (e.get("data") or {}).get("declaredName")
        decl = flow_decl.get(label)
        item = decl[0] if decl and decl[0].endswith("Item") and decl[0] in parsed_items else None
        item_core = item[:-4] if item else None
        edges.append({"edge_id": e.get("id"), "label": label, "source_usage": su, "target_usage": tu,
                      "source_def": usage_type.get(su), "target_def": usage_type.get(tu), "item_def": item,
                      "source_eid": align(usage_type.get(su)), "target_eid": align(usage_type.get(tu)), "item_core": item_core})
    results, evidence = [], {}
    for p in gt["probes"]:
        out = {"probe_id": p["probe_id"], "type": p["type"], "distance_tokens": p["distance_tokens"], "hit": False}
        if p["type"] == "split_flow":
            for ed in edges:
                if (ed["source_eid"] == p["producer"] and ed["target_eid"] == p["consumer"] and ed["item_core"]
                        and item_matches(gt["entities"], p["item"], ed["item_core"])):
                    out["hit"] = True
                    evidence[p["probe_id"]] = {k: ed[k] for k in ("edge_id", "label", "source_usage", "target_usage", "source_def", "target_def", "item_def")}
                    break
        elif p["type"] == "alias_ref":
            want = p["entity_id"]
            for name, units in defs.items():
                if align(name) == want and p["link_unit"] in units and (name in parsed_defs or name in parsed_items):
                    out["hit"] = True
                    evidence[p["probe_id"]] = {"definition": name, "doc_units": sorted(units)}
                    break
        else:
            out["hit"] = None
        results.append(out)
    meta = {p["probe_id"]: p for p in gt["probes"]}
    far = [r for r in results if r["type"] != "homonym" and r["distance_tokens"] > gt["budget"]]
    rate = lambda xs: (sum(bool(x["hit"]) for x in xs) / len(xs)) if xs else None  # noqa: E731
    flows = [r for r in far if r["type"] == "split_flow"]
    return {"far_model": rate(far), "far_flow_model": rate(flows), "far_alias_model": rate([r for r in far if r["type"] == "alias_ref"]),
            "flow_short_model": rate([r for r in flows if meta[r["probe_id"]].get("link_ref") == "short"]),
            "flow_full_model": rate([r for r in flows if meta[r["probe_id"]].get("link_ref") != "short"]),
            "hits_model": {r["probe_id"]: r["hit"] for r in results}, "evidence_model": evidence,
            "flow_edges": len(edges), "flow_edges_with_item": sum(1 for e in edges if e["item_core"]),
            "parsed_part_defs": len(parsed_defs), "parsed_item_defs": len(parsed_items), "ident_collisions": align.collisions}


def dropped(facts: list[dict], stats: dict) -> dict:
    types = Counter(f.get("type") for f in facts)
    not_rendered = {str(t): n for t, n in types.items() if t not in RENDERED_TYPES}
    return {"facts_total": len(facts), "not_rendered_by_type": dict(sorted(not_rendered.items())), "not_rendered_total": sum(not_rendered.values()),
            "composition_facts_direction_lost": types.get("composition", 0), "skipped_unresolved": stats.get("skipped_unresolved", 0)}


def ledger_variants(rec: dict, saved_checks: list[dict] | None):
    """R, RN and historical RNV ledgers; RNV from the saved verifier checks of the frozen report."""
    reg = Registry()
    reg.update(rec["entities"])
    resolved = resolve_facts(reg, clean(rec["facts"]))
    j, held = join(resolved, "named")
    joined = [f for f in j if f.get("joined")]
    out = {"R": (resolved, {}), "RN": (j, {"joined": len(joined), "held": len(held)})}
    if saved_checks is not None:
        by_key = {}
        for ch in saved_checks:
            by_key.setdefault(flow_key(ch["flow"]), []).append(ch["verdict"])
        kept, problems = [], []
        for f in joined:
            vs = by_key.get(flow_key(f))
            if not vs:
                problems.append(f"no saved verifier check for join {flow_key(f)}")
                continue
            if vs.pop(0) == "supported":
                kept.append(f)
        leftover = sum(len(v) for v in by_key.values())
        if leftover:
            problems.append(f"{leftover} saved checks did not match any join")
        out["RNV"] = (resolved + kept, {"joined": len(joined), "kept": len(kept), "reconstruction_problems": problems})
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--tag", required=True)
    ap.add_argument("--docs", required=True)
    ap.add_argument("--models", required=True)
    ap.add_argument("--conditions", required=True, help="planned conditions, e.g. F,C1,C2,C4,OL (20K: F,C1,C2,OL)")
    ap.add_argument("--samples", type=int, required=True, help="planned runs per cell (test 3, 20K 2)")
    ap.add_argument("--variants", default="R,RN,RNV")
    args = ap.parse_args()
    docs, models, conds, variants = args.docs.split(","), args.models.split(","), args.conditions.split(","), args.variants.split(",")
    saved = json.loads((L2 / "analysis" / f"{args.tag}.json").read_text(encoding="utf-8"))["rows"]
    saved_by = {(r["doc"], r["model"], r["cond"], r["sample"], r["variant"]): r for r in saved}
    rows, failures = [], []
    with SysmlGraphClient() as lsp:
        for d in docs:
            base, units, gt = run_l2.doc_inputs(d)
            for m in models:
                for c in conds:
                    for s in range(args.samples):
                        p = base / "runs" / m / c / f"s{s}.json"
                        if not p.is_file():
                            failures.append(f"missing planned run {d} {m} {c} s{s}")
                            continue
                        rec = json.loads(p.read_text(encoding="utf-8"))
                        if rec.get("failed"):
                            failures.append(f"failed run recorded {d} {m} {c} s{s}")
                            continue
                        rnv_row = saved_by.get((d, m, c, s, "RNV"))
                        var = ledger_variants(rec, (rnv_row or {}).get("checks") if "RNV" in variants else None)
                        if "RNV" in variants and rnv_row is None:
                            failures.append(f"no saved RNV row for {d} {m} {c} s{s}")
                        for v in variants:
                            if v not in var:
                                failures.append(f"variant {v} not reconstructable for {d} {m} {c} s{s}")
                                continue
                            facts, info = var[v]
                            for prob in info.get("reconstruction_problems", []):
                                failures.append(f"{d} {m} {c} s{s} {v}: {prob}")
                            text, stats = render(facts)
                            out = base / "rendered" / m / c / v / f"s{s}.sysml"
                            out.parent.mkdir(parents=True, exist_ok=True)
                            out.write_text(text, encoding="utf-8")
                            g = lsp.analyze(text)
                            ledger = run_l2.score(gt, facts)
                            sv = saved_by.get((d, m, c, s, v))
                            recon = None
                            if sv is not None:
                                recon = {k: (ledger[k] == sv[k]) for k in ("far", "far_flow", "far_alias", "flow_short", "flow_full", "hits")}
                                if not all(recon.values()):
                                    failures.append(f"ledger score mismatch vs saved row {d} {m} {c} s{s} {v}: {recon}")
                            else:
                                failures.append(f"no saved row for {d} {m} {c} s{s} {v}")
                            model = score_model(gt, text, g)
                            rows.append({"doc": d, "model": m, "cond": c, "variant": v, "sample": s,
                                         "far_ledger": ledger["far"], "far_flow_ledger": ledger["far_flow"], "far_alias_ledger": ledger["far_alias"],
                                         "flow_short_ledger": ledger["flow_short"], "flow_full_ledger": ledger["flow_full"], "hits_ledger": ledger["hits"],
                                         "ledger_matches_saved": recon, **model,
                                         "lsp_errors": len(g.errors), "lsp_nodes": len(g.nodes), "lsp_flow_edges": len(g.edges_of("flow")),
                                         "render_stats": stats, "dropped": dropped(facts, stats),
                                         "joined": info.get("joined"), "kept": info.get("kept"),
                                         "rendered_sha256": hashlib.sha256(text.encode("utf-8")).hexdigest(),
                                         "rendered_path": str(out.relative_to(ROOT)).replace("\\", "/")})
                        done = rows[-len([v for v in variants if v in var]):]
                        print(f"{d} {m} {c} s{s}: " + ", ".join(f"{r['variant']} ledger/model {r['far_ledger']:.2f}/{r['far_model']:.2f}" for r in done), flush=True)
    out_dir = L2 / "analysis"
    meta = {"tag": args.tag, "docs": docs, "models": models, "conditions": conds, "samples": args.samples, "variants": variants,
            "lsp_binary": str(LSP_BIN), "lsp_binary_sha256": hashlib.sha256(LSP_BIN.read_bytes()).hexdigest() if LSP_BIN.is_file() else None,
            "renderer": "src/t2m_eval/l2_sysml.py (frozen)", "rnv_source": "saved verifier checks in analysis/<tag>.json",
            "failures": failures, "n_rows": len(rows)}
    (out_dir / f"rendered-{args.tag}.json").write_text(json.dumps({**meta, "rows": rows}, ensure_ascii=False, indent=1), encoding="utf-8")

    def mean_doc(m, c, v, key):
        per = []
        for d in docs:
            xs = [r[key] for r in rows if r["doc"] == d and r["model"] == m and r["cond"] == c and r["variant"] == v and r[key] is not None]
            if xs:
                per.append(statistics.mean(xs))
        return statistics.mean(per) if per else None

    f2 = lambda x: "--" if x is None else f"{x:.2f}"  # noqa: E731
    md = [f"# Probe recall on the rendered SysML v2 model — {args.tag} (post-hoc, structural check)", "",
          f"Renderer: frozen `l2_sysml.render`; checker `{LSP_BIN.name}` sha256 `{meta['lsp_binary_sha256']}`; RNV membership from saved verifier checks. "
          f"Means over documents (then runs). Planned {len(docs)}x{len(models)}x{len(conds)}x{args.samples} runs; failures: {len(failures)}.", "",
          "| model | cond | variant | far (ledger) | far (model) | far flow (ledger/model) | far alias (ledger/model) | short flows (ledger/model) | LSP errors | not rendered per run (by type) | composition facts per run | skipped unresolved per run | ident collisions |",
          "|---|---|---|---|---|---|---|---|---|---|---|---|---|"]
    agg = {}
    for m in models:
        for c in conds:
            for v in variants:
                sel = [r for r in rows if r["model"] == m and r["cond"] == c and r["variant"] == v]
                if not sel:
                    continue
                nr = Counter()
                for r in sel:
                    nr.update(r["dropped"]["not_rendered_by_type"])
                per_run = {t: n / len(sel) for t, n in nr.items()}
                a = {"far_ledger": mean_doc(m, c, v, "far_ledger"), "far_model": mean_doc(m, c, v, "far_model"),
                     "far_flow_ledger": mean_doc(m, c, v, "far_flow_ledger"), "far_flow_model": mean_doc(m, c, v, "far_flow_model"),
                     "far_alias_ledger": mean_doc(m, c, v, "far_alias_ledger"), "far_alias_model": mean_doc(m, c, v, "far_alias_model"),
                     "flow_short_ledger": mean_doc(m, c, v, "flow_short_ledger"), "flow_short_model": mean_doc(m, c, v, "flow_short_model"),
                     "lsp_errors": statistics.mean(r["lsp_errors"] for r in sel), "not_rendered_per_run": per_run,
                     "not_rendered_total_per_run": sum(per_run.values()),
                     "composition_per_run": statistics.mean(r["dropped"]["composition_facts_direction_lost"] for r in sel),
                     "skipped_unresolved_per_run": statistics.mean(r["dropped"]["skipped_unresolved"] for r in sel),
                     "ident_collisions": sum(len(r["ident_collisions"]) for r in sel), "runs": len(sel)}
                agg[(m, c, v)] = a
                md.append(f"| {m} | {c} | {v} | {f2(a['far_ledger'])} | {f2(a['far_model'])} | {f2(a['far_flow_ledger'])}/{f2(a['far_flow_model'])} | "
                          f"{f2(a['far_alias_ledger'])}/{f2(a['far_alias_model'])} | {f2(a['flow_short_ledger'])}/{f2(a['flow_short_model'])} | {a['lsp_errors']:.1f} | "
                          f"{a['not_rendered_total_per_run']:.1f} ({', '.join(f'{t} {n:.1f}' for t, n in sorted(per_run.items()))}) | {a['composition_per_run']:.1f} | "
                          f"{a['skipped_unresolved_per_run']:.1f} | {a['ident_collisions']} |")
    if failures:
        md += ["", "## Failures", ""] + [f"- {f}" for f in failures]
    (out_dir / f"rendered-{args.tag}.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    (out_dir / f"rendered-{args.tag}-summary.json").write_text(json.dumps({f"{m}|{c}/{v}": a for (m, c, v), a in agg.items()}, indent=1), encoding="utf-8")
    print("\n".join(md))
    return 2 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
