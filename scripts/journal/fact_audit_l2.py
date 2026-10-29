#!/usr/bin/env python3
"""Sampled precision audit of extracted facts per reading condition (post-hoc, cross-vendor judge).

Coverage counts facts; this audit asks whether they are supported. For each (model, condition)
it samples facts from the R variant (seeded, spread evenly over documents and runs), and a model
from the other vendor judges each fact against its sentence, the three sentences before it and
the sentences that declare an alias of any element it names.

    python scripts/journal/fact_audit_l2.py --docs L2T1,...,L2T8 --models claude-opus-5-5 --per-arm 60 --tag test

Judge: claude-sonnet-5-5 for both extractors (freeze amendment 1; gpt-5.5 banned). Verdicts are LLM
opinions, not human ground truth.
"""

from __future__ import annotations

import argparse
import json
import random
import statistics
import sys
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "src"))
sys.path.insert(0, str(ROOT / "scripts" / "journal"))

import run_l2 as R  # noqa: E402
from t2m_eval.long_memory import Registry  # noqa: E402
from t2m_eval.normalize import norm_text  # noqa: E402
from t2m_pipeline.llm_clients import CachedClient, load_registry, make_client  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

JUDGE = {"claude-opus-5-5": "claude-sonnet-5-5", "gpt-6.1-sol": "claude-sonnet-5-5"}
SCHEMA = {"type": "object", "properties": {"verdict": {"type": "string", "enum": ["supported", "partially_supported", "unsupported"]},
                                           "reason": {"type": "string"}}, "required": ["verdict", "reason"], "additionalProperties": False}
PROMPT = """Judge one fact extracted for a SysML v2 model from an engineering document. The fact names elements by their full names; the document may refer to them by aliases declared elsewhere (those declarations are included).

Fact: {fact}

Source sentences (the last one is where the fact was extracted):
{evidence}

"supported": every slot value is stated or directly implied by the sentences. "partially_supported": the main relation is right but a slot is wrong, over-specific or unsupported. "unsupported": the fact is not stated, contradicts the text, or assigns the wrong element. Return JSON {{"verdict": ..., "reason": "one sentence"}}."""


def fact_text(f: dict) -> str:
    slots = ", ".join(f"{k}={v}" for k, v in f.items() if k not in ("unit_id", "type", "joined", "match", "evidence_units") and v not in (None, "", []))
    return f"{f['type']}({slots})"


def evidence(f, units, pos, reg: Registry):
    i = pos.get(f.get("unit_id"))
    if i is None:
        return None
    ids = [units[j]["unit_id"] for j in range(max(0, i - 3), i + 1)]
    for k, v in f.items():
        if isinstance(v, str) and reg.aliases.get(v) and reg.first.get(v) in pos:
            ids.insert(0, reg.first[v])
    ids = sorted(dict.fromkeys(ids), key=pos.get)
    return "\n".join(f"{u}: {units[pos[u]]['text']}" for u in ids)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--docs", required=True)
    ap.add_argument("--models", required=True)
    ap.add_argument("--conditions", default="F,C1,C2,C4,OL")
    ap.add_argument("--samples", type=int, default=3)
    ap.add_argument("--per-arm", type=int, default=60)
    ap.add_argument("--tag", required=True)
    args = ap.parse_args()
    load_dotenv_if_present()
    registry = load_registry(R.EXP / "models-l2.json")
    docs = args.docs.split(",")
    jobs = []
    for m in args.models.split(","):
        for c in args.conditions.split(","):
            pool = []
            for d in docs:
                units = [{"unit_id": u["unit_id"], "text": u["text"]} for u in json.loads((R.L2 / d / "units.json").read_text(encoding="utf-8"))["units"]]
                pos = {u["unit_id"]: i for i, u in enumerate(units)}
                for s in range(args.samples):
                    p = R.L2 / d / "runs" / m / c / f"s{s}.json"
                    if not p.is_file():
                        continue
                    rec = json.loads(p.read_text(encoding="utf-8"))
                    if rec.get("failed"):
                        continue
                    reg = Registry()
                    reg.update(rec["entities"])
                    facts = [f for f in R.variants(rec, c)["R"][0] if f.get("unit_id") in pos]
                    rnd = random.Random(f"{args.tag}|{m}|{c}|{d}|{s}")
                    k = max(1, args.per_arm // (len(docs) * args.samples))
                    for f in rnd.sample(facts, min(k, len(facts))):
                        ev = evidence(f, units, pos, reg)
                        if ev:
                            pool.append((d, s, f, ev))
            jobs += [(m, c, *x) for x in pool]

    def work(job):
        m, c, d, s, f, ev = job
        jm = JUDGE[m]
        client = CachedClient(make_client(registry[jm], schema=SCHEMA, schema_name="fact_check",
                                          system_prompt="You check extracted model facts against source text. Return JSON only."),
                              R.EXP / "cache" / "l2-fact-audit" / jm)
        try:
            out = json.loads(client.complete(PROMPT.format(fact=fact_text(f), evidence=ev)))
            v = out["verdict"]
        except Exception as e:  # noqa: BLE001
            v, out = "error", {"reason": str(e)[:200]}
        return {"model": m, "cond": c, "doc": d, "sample": s, "fact": f, "verdict": v, "reason": out.get("reason"), "judge": jm}

    with ThreadPoolExecutor(16) as ex:
        rows = list(ex.map(work, jobs))
    out = R.L2 / "analysis" / f"fact-audit-{args.tag}.json"
    out.write_text(json.dumps(rows, ensure_ascii=False, indent=1), encoding="utf-8")
    md = [f"# Sampled fact precision — {args.tag}", "", "| model | cond | judged | supported | partial | unsupported | errors |", "|---|---|---|---|---|---|---|"]
    for m in args.models.split(","):
        for c in args.conditions.split(","):
            sel = [r for r in rows if r["model"] == m and r["cond"] == c]
            ok = [r for r in sel if r["verdict"] != "error"]
            if sel:
                rate = lambda v: sum(r["verdict"] == v for r in ok) / len(ok) if ok else float("nan")  # noqa: E731
                md.append(f"| {m} | {c} | {len(ok)} | {rate('supported'):.2f} | {rate('partially_supported'):.2f} | {rate('unsupported'):.2f} | {len(sel) - len(ok)} |")
    out.with_suffix(".md").write_text("\n".join(md) + "\n", encoding="utf-8")
    print("\n".join(md))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
