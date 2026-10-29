#!/usr/bin/env python3
"""Build the author-held, content-addressed evidence archive for the L2 study (revision round 2, blocker B6).

    python scripts/journal/build_l2_archive.py build  [--dest paper-long/ieee-access/review-cycle/evidence-archive-rev2]
    python scripts/journal/build_l2_archive.py verify --dest <dir>

``build`` copies, mirroring the text2model/ layout, exactly:
  * the 28 frozen files (scripts/journal/run_l2.py, analyze_l2.py, build_l2_corpus.py; src/t2m_eval/{l2_ledger,
    l2_sysml,long_memory,long_doc,adapters,normalize,dc_gt}.py; src/t2m_pipeline/llm_clients.py;
    experiments/journal-v1/models-l2.json; L2T1-8 units.json and probes.gt.json) and freeze.json,
  * the 20K inputs (L2X1/L2X2 units, probes, blueprint, check, verify) and build_l2x_corpus.py,
  * the post-hoc and revision scripts (run_l2_external.py, fact_audit_l2.py, coverage_l2.py, build_l2_paper.py,
    build_l2_paper_rev2.py, build_l2_ieee_body.py, build_l2_ieee_appendix.py, freeze_l2.py, score_l2_rendered.py,
    judge_l2_docaware.py, analyze_l2_doclevel.py, build_l2_archive.py) and the checker client sysml_graph.py,
  * every run output (L2T*/runs, L2X*/runs, L2X*/runs-quota-failed, L2DEV/runs, external/runs), every rendered
    model (L2*/rendered), the probe check/verify files,
  * the caches l2-runs, l2-verify, l2-judge, l2-fact-audit, l2-judge-docaware, l2-judge-docaware-ctx,
  * every file under experiments/journal-v1/l2/analysis and l2/external report files, and the run logs,
  * the external corpus inputs (long-source-holdout-v2/<doc>/units.json, corpus-freeze.json),
  * the paper sources (paper-long/*.tex, refs.bib, ieee-access/*.tex, figures, cls files).
It writes MANIFEST.sha256 (one line per file: sha256, size, path), computes the EVIDENCE BUNDLE HASH as the
SHA-256 of the sorted manifest lines of everything except the paper sources (so the manuscript can quote it
without a hash cycle), a separate MANUSCRIPT-MANIFEST.sha256 for the paper sources, and
experiments/journal-v1/l2/freeze-extension.json (hashes of the 20K inputs, post-hoc scripts, checker client and
language-server binary; references freeze.json by hash; records that the pre-amendment run_l2.py is not retained).
It also writes paper-long/archive-hash.tex, the Data Availability paragraph quoting the bundle hash.
Nothing under the source tree is modified except these three generated files (freeze-extension.json,
archive-hash.tex, and the copy under --dest).

``verify`` recomputes every hash in MANIFEST.sha256 under --dest and runs the archived freeze_l2.py verify
against the archived tree; exit 0 only if both pass.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EXP = ROOT / "experiments" / "journal-v1"
L2 = EXP / "l2"
LSP_DEFAULT = ROOT.parents[1] / "selab-ex-system-modeler" / "packages" / "selab-rust-lsp" / "target" / "release" / "sysml-lsp.exe"
LSP_BIN = Path(os.environ.get("SELAB_LSP_BIN", str(LSP_DEFAULT)))

FROZEN_SCRIPTS = ["run_l2.py", "analyze_l2.py", "build_l2_corpus.py"]
POSTHOC_SCRIPTS = ["build_l2x_corpus.py", "run_l2_external.py", "fact_audit_l2.py", "coverage_l2.py", "build_l2_paper.py",
                   "build_l2_paper_rev2.py", "build_l2_ieee_body.py", "build_l2_ieee_appendix.py", "freeze_l2.py",
                   "score_l2_rendered.py", "judge_l2_docaware.py", "analyze_l2_doclevel.py", "build_l2_archive.py",
                   "run_l2_c1_512.py", "analyze_l2_c1_512.py"]
SRC = ["src/t2m_eval/l2_ledger.py", "src/t2m_eval/l2_sysml.py", "src/t2m_eval/long_memory.py", "src/t2m_eval/long_doc.py",
       "src/t2m_eval/adapters.py", "src/t2m_eval/normalize.py", "src/t2m_eval/dc_gt.py", "src/t2m_pipeline/llm_clients.py",
       "src/t2m_pipeline/openai_client.py", "src/t2m_eval/sysml_graph.py", "src/t2m_eval/__init__.py", "src/t2m_pipeline/__init__.py"]
CACHES = ["l2-runs", "l2-verify", "l2-judge", "l2-fact-audit", "l2-judge-docaware", "l2-judge-docaware-ctx"]
# generated table sources (outputs of build_l2_paper_rev2.py / build_l2_ieee_appendix.py); the public archive carries only these
TABLE_FILES = ["paper-long/benchmark.tex", "paper-long/results.tex", "paper-long/extras.tex", "paper-long/abstract-results.tex",
               "paper-long/summary.json", "paper-long/ieee-access/appendix.tex"]
PAPER_GLOBS = ["paper-long/*.tex", "paper-long/refs.bib", "paper-long/main.pdf", "paper-long/ieee-access/manuscript-ieee-access.pdf", "paper-long/summary.json", "paper-long/ieee-access/*.tex",
               "paper-long/ieee-access/*.cls", "paper-long/ieee-access/figures/*", "paper-long/ieee-access/*.png"]


def sha(p: Path) -> str:
    h = hashlib.sha256()
    with open(p, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def rel(p: Path) -> str:
    return p.relative_to(ROOT).as_posix()


def evidence_files() -> list[Path]:
    files: list[Path] = []
    files += [ROOT / "scripts" / "journal" / s for s in FROZEN_SCRIPTS + POSTHOC_SCRIPTS]
    files += [ROOT / s for s in SRC]
    files += [EXP / "models-l2.json", L2 / "freeze.json"]
    for d in L2.iterdir():
        if d.is_dir() and (d.name.startswith("L2T") or d.name.startswith("L2X") or d.name == "L2DEV"):
            for sub in ("units.json", "probes.gt.json", "blueprint.json", "probes.check.json", "doc.md"):
                if (d / sub).is_file():
                    files.append(d / sub)
            files += sorted(d.glob("probes.*.verify.json"))
            for sub in ("runs", "runs-quota-failed", "runs-superseded", "rendered", "sections"):
                if (d / sub).is_dir():
                    files += sorted(p for p in (d / sub).rglob("*") if p.is_file())
    files += sorted(p for p in (L2 / "analysis").rglob("*") if p.is_file())
    files += sorted(p for p in (L2 / "external").rglob("*") if p.is_file())
    files += sorted(p for p in L2.glob("*.log"))
    posthoc = EXP / "l2-posthoc-c1-512"  # post-hoc arm C1S (512-token chunks, no memory), added after review round 12
    if posthoc.is_dir():
        files += sorted(p for p in posthoc.rglob("*") if p.is_file())
    for c in CACHES:
        if (EXP / "cache" / c).is_dir():
            files += sorted(p for p in (EXP / "cache" / c).rglob("*") if p.is_file())
    ext = EXP / "long-source-holdout-v2"
    if ext.is_dir():
        files += [ext / "corpus-freeze.json"] + sorted(ext.glob("*/units.json"))
    # LaTeX build logs (LATEX-*.log) are not evidence and embed local MiKTeX paths with the account name; they stay out of the archive.
    return [f for f in dict.fromkeys(files) if f.is_file() and not f.name.startswith("LATEX")]


def paper_files(tables_only: bool = False) -> list[Path]:
    if tables_only:  # --no-manuscript: nothing from paper-long/ is copied (the public archive carries evidence only)
        return []
    out: list[Path] = []
    for g in PAPER_GLOBS:
        out += sorted(p for p in ROOT.glob(g) if p.is_file())
    return out


def manifest_lines(files: list[Path]) -> list[str]:
    return sorted(f"{sha(f)}  {f.stat().st_size:>10d}  {rel(f)}" for f in files)


def bundle_hash(lines: list[str]) -> str:
    return hashlib.sha256(("\n".join(lines) + "\n").encode("utf-8")).hexdigest()


def write_extension_freeze(dest_note: str, bundle: str) -> Path:
    base = json.loads((L2 / "freeze.json").read_text(encoding="utf-8"))
    files = {}
    for d in ("L2X1", "L2X2"):
        for sub in ("units.json", "probes.gt.json", "blueprint.json", "probes.check.json"):
            p = L2 / d / sub
            if p.is_file():
                files[rel(p)] = sha(p)
    for s in POSTHOC_SCRIPTS:
        files[f"scripts/journal/{s}"] = sha(ROOT / "scripts" / "journal" / s)
    files["src/t2m_eval/sysml_graph.py"] = sha(ROOT / "src/t2m_eval/sysml_graph.py")
    rec = {"created": time.strftime("%Y-%m-%dT%H:%M:%S"),
           "note": "Revision-2 extension record. Lists files that produced tables but were outside the pre-registered freeze: the 20K inputs "
                   "(built after the freeze), the post-hoc and revision scripts (including the post-hoc C1S arm under "
                   "experiments/journal-v1/l2-posthoc-c1-512), the language-server client and binary. Nothing here is "
                   "retroactively pre-registered; freeze.json is unchanged and referenced by hash.",
           "references": {"experiments/journal-v1/l2/freeze.json": sha(L2 / "freeze.json"), "freeze_created": base.get("created"),
                          "amendments": len(base.get("amendments", []))},
           "gaps": {"G1_pre_amendment_run_l2_py": "The pre-amendment run_l2.py (sha256 " + base["files"]["scripts/journal/run_l2.py"][:16]
                    + "...) and models-l2.json are not retained on disk or in version control; the amendment's statement that only the judge "
                      "line changed rests on the authors' record and cannot be verified by diff."},
           "language_server": {"path": str(LSP_BIN), "sha256": sha(LSP_BIN) if LSP_BIN.is_file() else None},
           "files": files, "evidence_bundle_sha256": bundle, "archive_location": dest_note}
    out = L2 / "freeze-extension.json"
    out.write_text(json.dumps(rec, ensure_ascii=False, indent=1), encoding="utf-8")
    return out


def write_archive_tex(bundle: str, n_files: int, size_mb: float, dest_note: str, public_url: str = "", tables_only: bool = False):
    bundle_tex = "\\allowbreak ".join(bundle[i:i + 8] for i in range(0, len(bundle), 8))
    if public_url:
        where = (f"is public under the MIT License at \\url{{{public_url}}} (a Zenodo deposit with a DOI will follow on acceptance) and "
                 "mirrors the project layout under \\texttt{text2model/}")
    else:
        where = "is not yet public; it mirrors the project layout under \\texttt{text2model/} and will be deposited with a public identifier on acceptance"
    text = (
        "The benchmark documents, probes and blueprints, all run outputs (including the runs that failed for provider-credit reasons and "
        "were re-executed), the rendered models, every verification and judge cache (so that all tables regenerate offline without a model "
        "call), the analysis reports, the freeze record with its amendment, the extension record for post-hoc files, the post-hoc 512-token "
        f"arm (C1S), and the scripts that regenerate every table are held in a content-addressed archive ({n_files:,} files, {size_mb:,.0f}~MB) whose "
        f"evidence-bundle SHA-256 is \\texttt{{{bundle_tex}}}. The archive {where}. The pre-amendment version of the run script is "
        "not retained (only its hash). "
        + ("No manuscript material is part of the archive, so the manuscript can quote the evidence hash without a "
           "self-reference; the tables regenerate from the archive with the listed scripts." if tables_only else
           "Hashes of the rendered manuscript sources are kept in a separate manifest so that the manuscript can quote the evidence hash "
           "without a self-reference.")
    )
    (ROOT / "paper-long" / "archive-hash.tex").write_text(text + "\n", encoding="utf-8")


def cmd_build(args):
    dest = Path(args.dest)
    if not dest.is_absolute():
        dest = ROOT / dest
    if dest.exists():
        if not args.force:
            print(f"refusing to overwrite existing {dest}; pass --force", file=sys.stderr)
            return 2
        # Replace only the mirrored subtrees and generated manifests; keep .git, LICENSE, README.md and other top-level files.
        for sub in ("experiments", "paper-long", "scripts", "src"):
            if (dest / sub).is_dir():
                shutil.rmtree(dest / sub)
        for name in ("MANIFEST.sha256", "MANUSCRIPT-MANIFEST.sha256", "TABLES-MANIFEST.sha256", "BUNDLE-HASH.txt", "README-ARCHIVE.md"):
            (dest / name).unlink(missing_ok=True)
    ev = evidence_files()
    lines = manifest_lines(ev)
    bundle = bundle_hash(lines)
    write_extension_freeze(rel(dest) if dest.is_relative_to(ROOT) else str(dest), bundle)
    ev = evidence_files() + [L2 / "freeze-extension.json"]  # the extension record is copied but is not in the bundle hash fixed above
    size = sum(f.stat().st_size for f in ev) / 1e6
    write_archive_tex(bundle, len(lines), size, str(dest), args.public_url, args.no_manuscript)
    pf = paper_files(tables_only=args.no_manuscript)
    pf_manifest = "TABLES-MANIFEST.sha256" if args.no_manuscript else "MANUSCRIPT-MANIFEST.sha256"
    for f in ev + pf:
        t = dest / rel(f)
        t.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(f, t)
    (dest / "MANIFEST.sha256").write_text("\n".join(lines) + "\n", encoding="utf-8")
    if pf:
        (dest / pf_manifest).write_text("\n".join(manifest_lines(pf)) + "\n", encoding="utf-8")
    (dest / "BUNDLE-HASH.txt").write_text(f"{bundle}  evidence bundle = sha256 of MANIFEST.sha256 content (sorted lines)\n", encoding="utf-8")
    title = (f"# Evidence archive — public release ({args.public_url})\n\n" if args.public_url else
             "# L2 evidence archive (revision 2) — author-held, not public\n\n")
    (dest / "README-ARCHIVE.md").write_text(
        title +
        f"Evidence bundle SHA-256: `{bundle}` (hash of MANIFEST.sha256 content). {len(lines):,} evidence files, {size:,.0f} MB.\n" +
        ("No manuscript material is included; the table generators write their output under paper-long/ when run.\n\n"
         if args.no_manuscript else
         f"Paper sources are listed separately in {pf_manifest} and are not part of the bundle hash.\n\n") +
        "Offline verification (no API key, no model call), from this directory:\n\n"
        "```\n"
        "python scripts/journal/build_l2_archive.py verify --dest .\n"
        "python scripts/journal/freeze_l2.py verify\n"
        "set T2M_OFFLINE=1\n"
        "python scripts/journal/judge_l2_docaware.py report --tag l2x-main --prompt context\n"
        "python scripts/journal/judge_l2_docaware.py report --tag l2x-main --prompt combined\n"
        "python scripts/journal/judge_l2_docaware.py report --tag test-main --prompt context --sample 120 --seed 7\n"
        "python scripts/journal/judge_l2_docaware.py report --tag test-main --prompt combined --sample 120 --seed 7\n"
        "set SELAB_LSP_BIN=<path to sysml-lsp.exe, sha256 in experiments/journal-v1/l2/freeze-extension.json>\n"
        "python scripts/journal/score_l2_rendered.py --tag test-main --docs L2T1,L2T2,L2T3,L2T4,L2T5,L2T6,L2T7,L2T8 --models gpt-6.1-sol,claude-opus-5-5 --conditions F,C1,C2,C4,OL --samples 3\n"
        "python scripts/journal/score_l2_rendered.py --tag l2x-main --docs L2X1,L2X2 --models gpt-6.1-sol,claude-opus-5-5 --conditions F,C1,C2,OL --samples 2\n"
        "python scripts/journal/analyze_l2_doclevel.py --tag test-main\n"
        "python scripts/journal/build_l2_paper_rev2.py --tag test-main --long-tag l2x-main\n"
        "python scripts/journal/run_l2_c1_512.py report --verify --judge --sysml --tag c1s-main\n"
        "python scripts/journal/analyze_l2_c1_512.py\n"
        "```\n\n"
        "The frozen `run_l2.py report --verify --judge --sysml` re-scores from the caches `l2-verify` and `l2-judge` when run with an\n"
        "offline CachedClient; the historical report files it produced are under experiments/journal-v1/l2/analysis/.\n"
        "The pre-amendment run_l2.py is not retained (see freeze-extension.json, gap G1).\n\n"
        "Note on experiments/journal-v1/l2/analysis/doclevel-l2x-main.{json,md}: analyze_l2_doclevel.py applies the labels of the\n"
        "5K test set to any tag, so these files call the C1/RNV contrasts on the two 20K documents \"pre-registered contrast\" and give\n"
        "them Holm-adjusted p-values and bootstrap intervals over two documents (at most three distinct resample means). The 20K\n"
        "documents were built after the freeze: every 20K contrast is post-hoc, an exact test on two documents cannot go below\n"
        "p = 0.5, and these intervals are not informative. The manuscript cites no 20K p-value or interval from these files and\n"
        "reports the 20K rows as post-hoc directions without tests. The files are kept unchanged as generated.\n", encoding="utf-8")
    print(f"archive at {dest}: {len(lines)} evidence files ({size:,.0f} MB), {len(pf)} paper files; bundle sha256 {bundle}")
    return 0


def cmd_verify(args):
    dest = Path(args.dest)
    if not dest.is_absolute():
        dest = ROOT / dest
    lines = (dest / "MANIFEST.sha256").read_text(encoding="utf-8").splitlines()
    bad = 0
    for line in lines:
        h, _size, path = line.split(None, 2)
        p = dest / path
        if not p.is_file() or sha(p) != h:
            bad += 1
            print("MISMATCH", path)
    bundle = bundle_hash(lines)
    recorded = (dest / "BUNDLE-HASH.txt").read_text(encoding="utf-8").split()[0]
    print(f"manifest: {len(lines)} files, {bad} mismatches; bundle {bundle} ({'matches' if bundle == recorded else 'DIFFERS FROM'} recorded)")
    r = subprocess.run([sys.executable, "-B", "-X", "utf8", str(dest / "scripts" / "journal" / "freeze_l2.py"), "verify"], capture_output=True, text=True)
    print("freeze_l2.py verify (archived tree):", r.stdout.strip() or r.stderr.strip(), "exit", r.returncode)
    return 0 if (bad == 0 and bundle == recorded and r.returncode == 0) else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("command", choices=["build", "verify"])
    ap.add_argument("--dest", default="paper-long/ieee-access/review-cycle/evidence-archive-rev2")
    ap.add_argument("--force", action="store_true")
    ap.add_argument("--public-url", default="", help="public repository URL; switches archive-hash.tex and README to the public wording")
    ap.add_argument("--no-manuscript", action="store_true", help="copy only the generated table sources, not the manuscript text or PDFs")
    args = ap.parse_args()
    return {"build": cmd_build, "verify": cmd_verify}[args.command](args)


if __name__ == "__main__":
    raise SystemExit(main())
