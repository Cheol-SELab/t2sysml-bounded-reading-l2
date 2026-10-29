#!/usr/bin/env python3
"""Freeze (or verify) the L2 test protocol: SHA256 of every file that decides a test result.

    python scripts/journal/freeze_l2.py freeze --note "after dev tuning round 1"
    python scripts/journal/freeze_l2.py verify
    python scripts/journal/freeze_l2.py amend --note "why" --files scripts/journal/run_l2.py,...

``freeze`` refuses to overwrite an existing freeze.json; ``verify`` exits 1 on any drift.
``amend`` records a dated, justified change of named files (old and new hash) without touching the
original snapshot; ``verify`` then checks those files against their latest amended hash.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
L2 = ROOT / "experiments" / "journal-v1" / "l2"
FILES = [
    "scripts/journal/run_l2.py", "scripts/journal/analyze_l2.py", "scripts/journal/build_l2_corpus.py",
    "src/t2m_eval/l2_ledger.py", "src/t2m_eval/l2_sysml.py", "src/t2m_eval/long_memory.py", "src/t2m_eval/long_doc.py",
    "src/t2m_eval/adapters.py", "src/t2m_eval/normalize.py", "src/t2m_eval/dc_gt.py", "src/t2m_pipeline/llm_clients.py",
    "experiments/journal-v1/models-l2.json",
]
TEST_DOCS = [f"L2T{i}" for i in range(1, 9)]


def sha(p: Path) -> str:
    return hashlib.sha256(p.read_bytes()).hexdigest()


def snapshot() -> dict:
    files = {f: sha(ROOT / f) for f in FILES}
    for d in TEST_DOCS:
        for name in ("units.json", "probes.gt.json"):
            files[f"experiments/journal-v1/l2/{d}/{name}"] = sha(L2 / d / name)
    return files


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["freeze", "verify", "amend"])
    ap.add_argument("--note", default="")
    ap.add_argument("--files", default="", help="amend: comma-separated files whose change is recorded")
    args = ap.parse_args()
    path = L2 / "freeze.json"
    if args.command == "freeze":
        if path.is_file():
            print("freeze.json exists; refusing to overwrite", file=sys.stderr)
            return 1
        path.write_text(json.dumps({"created": time.strftime("%Y-%m-%dT%H:%M:%S"), "note": args.note, "files": snapshot()},
                                   ensure_ascii=False, indent=1), encoding="utf-8")
        print(f"frozen {len(FILES) + 2 * len(TEST_DOCS)} files")
        return 0
    data = json.loads(path.read_text(encoding="utf-8"))
    frozen = dict(data["files"])
    for a in data.get("amendments", []):
        frozen.update({f: h["new"] for f, h in a["files"].items()})
    now = snapshot()
    if args.command == "amend":
        names = [f for f in args.files.split(",") if f]
        if not names or not args.note or any(f not in frozen for f in names):
            print("amend needs --note and --files from the frozen set", file=sys.stderr)
            return 1
        data.setdefault("amendments", []).append({
            "created": time.strftime("%Y-%m-%dT%H:%M:%S"), "note": args.note,
            "files": {f: {"old": frozen[f], "new": now[f]} for f in names}})
        path.write_text(json.dumps(data, ensure_ascii=False, indent=1), encoding="utf-8")
        print(f"amendment {len(data['amendments'])}: {len(names)} files")
        return 0
    drift = [f for f in frozen if now.get(f) != frozen[f]]
    for f in drift:
        print("DRIFT", f)
    print("verify:", "ok" if not drift else f"{len(drift)} drifted")
    return 1 if drift else 0


if __name__ == "__main__":
    raise SystemExit(main())
