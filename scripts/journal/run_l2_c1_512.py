#!/usr/bin/env python3
"""Post-hoc L2 arm C1S: chunks of <= 512 document tokens, no memory (added 2026-10-29, not pre-specified).

Why: the frozen protocol's no-memory arm C1 reads 1,024-token chunks while the memory arms C2, C4 and OL read
512-token chunks plus a 512-token memory block, so the pre-specified contrasts cross chunk size and memory.
C1S closes the 2 x 2 (chunk size x memory) at fixed consolidation. Reviewer rounds 7, 9 and 11 asked for it.

Everything else is the frozen code path of scripts/journal/run_l2.py (same prompt, schema, models, consolidation,
verifier, judge, scorer); this wrapper only adds the condition and redirects outputs so the frozen folder
experiments/journal-v1/l2/ is read but never written:

  runs      experiments/journal-v1/l2-posthoc-c1-512/<DOC>/runs/<model>/C1S/s<k>.json
  analysis  experiments/journal-v1/l2-posthoc-c1-512/analysis/<tag>.{json,md}

Model calls share the frozen caches (experiments/journal-v1/cache/l2-runs, l2-verify, l2-judge), so the first
512-token chunk of a document, whose prompt is identical to the memory arms' first chunk (empty memory block),
is served from the cache and is the same output those arms saw.

    python scripts/journal/run_l2_c1_512.py run    --docs L2T1,...,L2T8 --models gpt-6.1-sol,claude-opus-5-5 --samples 3 --allow-provider-calls
    python scripts/journal/run_l2_c1_512.py report --docs ... --models ... --samples 3 --verify --judge --tag c1s-main --allow-provider-calls
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import run_l2 as base  # noqa: E402  (frozen script, imported unchanged)
from t2m_eval.long_doc import chunk_units  # noqa: E402
from t2m_eval.long_memory import Registry, mem_prompt, parse  # noqa: E402
from t2m_pipeline.llm_clients import load_registry  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

FROZEN = base.L2
OUT = base.EXP / "l2-posthoc-c1-512"
COND = "C1S"


def run_c1s(spec, model, units, sample) -> dict:
    """Same loop as run_l2.run for C1, with the memory arms' chunk budget and no memory block."""
    c = base.extractor(spec, model, sample, whole=False)
    parts = chunk_units(units, base.CHUNK, base.ntok)
    reg, facts, entities, calls = Registry(), [], [], []
    for part in parts:
        memory = ""
        prompt = mem_prompt(part, memory)
        payload = json.loads(c.complete(prompt))
        ents, fs = parse(payload)
        reg.update(ents, part[0]["unit_id"])
        entities.extend(ents)
        facts.extend(fs)
        calls.append({"kind": "extract", "units": [part[0]["unit_id"], part[-1]["unit_id"]],
                      "chunk_tokens": sum(base.ntok(u["text"]) for u in part), "memory_tokens": 0,
                      "prompt_tokens": base.ntok(prompt), **base.usage_of(c)})
    return {"facts": facts, "entities": entities, "calls": calls, "cond_note": "C1S post-hoc: 512-token chunks, no memory"}


_orig_run = base.run


def _run(spec, model, units, cond, sample):
    if cond == COND:
        return run_c1s(spec, model, units, sample)
    return _orig_run(spec, model, units, cond, sample)


def _doc_inputs(doc: str):
    src = FROZEN / doc
    units = [{"unit_id": u["unit_id"], "text": u["text"]}
             for u in json.loads((src / "units.json").read_text(encoding="utf-8"))["units"]]
    gt = json.loads((src / "probes.gt.json").read_text(encoding="utf-8"))
    return OUT / doc, units, gt


base.run = _run
base.doc_inputs = _doc_inputs
base.L2 = OUT  # analysis output directory; inputs come from FROZEN through _doc_inputs


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["run", "report"])
    ap.add_argument("--docs", default=",".join(f"L2T{i}" for i in range(1, 9)))
    ap.add_argument("--models", default="gpt-6.1-sol,claude-opus-5-5")
    ap.add_argument("--conditions", default=COND)
    ap.add_argument("--samples", type=int, default=3)
    ap.add_argument("--workers", type=int, default=12)
    ap.add_argument("--verify", action="store_true")
    ap.add_argument("--judge", action="store_true")
    ap.add_argument("--sysml", action="store_true")
    ap.add_argument("--tag", default="")
    ap.add_argument("--allow-provider-calls", action="store_true")
    args = ap.parse_args()
    args.docs, args.models, args.conditions = args.docs.split(","), args.models.split(","), args.conditions.split(",")
    if args.conditions != [COND]:
        ap.error(f"this wrapper runs only the post-hoc condition {COND}")
    if "gpt-5.5" in args.models:
        ap.error("gpt-5.5 calls are banned (freeze amendment 1)")
    if (args.command == "run" or args.verify or args.judge) and not args.allow_provider_calls:
        ap.error("Provider calls require --allow-provider-calls and prior authorization")
    load_dotenv_if_present()
    registry = load_registry(base.EXP / "models-l2.json")
    OUT.mkdir(parents=True, exist_ok=True)
    {"run": base.cmd_run, "report": base.cmd_report}[args.command](args, registry)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
