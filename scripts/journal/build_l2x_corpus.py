#!/usr/bin/env python3
"""Build L2X: ~20K-token documents (40 sections) for the length extension of the L2 study.

Reuses the frozen L2 builder unchanged (build_l2_corpus.py) and only overrides its size constants,
domains and the length sentence of the planning prompt. Probe counts scale with length.

    python scripts/journal/build_l2x_corpus.py --doc L2X1
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "journal"))

import build_l2_corpus as B  # noqa: E402
from t2m_pipeline.llm_clients import load_registry  # noqa: E402
from t2m_pipeline.openai_client import load_dotenv_if_present  # noqa: E402

B.DOCS.update({
    "L2X1": ("gpt-5.5", "a regional air traffic flow management and airport collaborative decision-making system (flow managers, airline operations centres, towers, ramp control, slot allocation)"),
    "L2X2": ("gpt-6-luna", "an offshore wind farm operation and maintenance system (turbine controllers, substation, SCADA, crew transfer vessels, maintenance planning, weather service)"),
})
B.N_SECTIONS, B.N_SPLIT, B.N_SHORT, B.N_ALIAS, B.N_FAR_FLOW, B.N_FAR_ALIAS = 40, 20, 10, 16, 14, 12
B.PLAN_PROMPT = B.PLAN_PROMPT.replace("(about 5,000 tokens in total)", "(about 20,000 tokens in total)").replace(
    "24-32 system elements", "60-80 system elements")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--doc", required=True, choices=["L2X1", "L2X2"])
    args = ap.parse_args()
    load_dotenv_if_present()
    B.cmd_all(args, load_registry(B.REGISTRY))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
