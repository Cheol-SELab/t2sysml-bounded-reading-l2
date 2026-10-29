# Bounded-context fact extraction toward SysML v2: evidence archive

Public evidence archive for the manuscript

> *Ledger Consolidation versus Prompt-Memory Configurations for Bounded-Context Fact Extraction toward SysML v2 Models: A Controlled Study on a Constructed Long-Range Probe Benchmark*

(authorship pending; under preparation for IEEE Access). The manuscript text itself is not part of this archive.

The repository is a content-addressed snapshot: every table and figure in the manuscript regenerates offline from the
files here, without an API key or a model call. The evidence-bundle SHA-256 quoted in the manuscript's Data Availability
statement is the hash of `MANIFEST.sha256` (see `BUNDLE-HASH.txt`). A Zenodo deposit with a DOI will follow on acceptance.

## What is here

| Path | Content |
| --- | --- |
| `experiments/journal-v1/l2/L2T1`–`L2T8` | The eight 5K-token test documents: `units.json`, `probes.gt.json`, `blueprint.json`, run outputs (`runs/`), rendered SysML v2 (`rendered/`), probe check and verify files |
| `experiments/journal-v1/l2/L2X1`, `L2X2` | The two 20K-token documents (built after the freeze; post-hoc) |
| `experiments/journal-v1/l2/L2DEV` | Development document |
| `experiments/journal-v1/l2/analysis/` | All analysis reports (`test-main.*`, `doclevel-*`, fact audit, coverage, judge reports) and build logs |
| `experiments/journal-v1/l2/freeze.json`, `freeze-extension.json` | Pre-registration freeze record with its amendment; extension record listing post-hoc files by hash |
| `experiments/journal-v1/l2-posthoc-c1-512/` | Post-hoc arm C1S (512-token chunks, no memory), added after review: run outputs, `analysis/c1s-main.*`, `analysis/c1s-paired.*`, `posthoc-record.json` |
| `experiments/journal-v1/cache/` | Provider response caches (`l2-runs`, `l2-verify`, `l2-judge`, `l2-fact-audit`, `l2-judge-docaware`, `l2-judge-docaware-ctx`), keyed by (provider status, sample index, prompt), so that every score recomputes offline |
| `experiments/journal-v1/long-source-holdout-v2/` | External corpus inputs (`corpus-freeze.json`, per-document `units.json`) |
| `experiments/journal-v1/models-l2.json` | Model table used by the runs |
| `scripts/journal/` | Frozen scripts (`run_l2.py`, `analyze_l2.py`, `build_l2_corpus.py`) and the post-hoc/revision scripts, including `run_l2_c1_512.py`, `analyze_l2_c1_512.py` and this archive's builder `build_l2_archive.py` |
| `src/t2m_eval/`, `src/t2m_pipeline/` | The modules the scripts import (ledger, SysML rendering, memory, document handling, adapters, normalisation, LLM clients, language-server client) |
| `MANIFEST.sha256`, `BUNDLE-HASH.txt`, `README-ARCHIVE.md` | Hash manifest, bundle hash and the offline regeneration commands |

Models: extraction with `gpt-6.1-sol` and `claude-opus-5-5`; verification by the other vendor's model; judge `claude-sonnet-5-5`.
Model identifiers and provider settings are recorded in `experiments/journal-v1/models-l2.json` and in each run file.

## Verify and regenerate

Requirements: Python 3.11, no API key. Set `T2M_OFFLINE=1` so that the clients only read the caches. The SysML v2
language-server binary used for syntactic scoring is not included; its SHA-256 is recorded in
`experiments/journal-v1/l2/freeze-extension.json`, and `score_l2_rendered.py` needs it through `SELAB_LSP_BIN`.

```
python scripts/journal/build_l2_archive.py verify --dest .
python scripts/journal/freeze_l2.py verify
set T2M_OFFLINE=1
python scripts/journal/analyze_l2_doclevel.py --tag test-main
python scripts/journal/build_l2_paper_rev2.py --tag test-main --long-tag l2x-main
python scripts/journal/run_l2_c1_512.py report --verify --judge --sysml --tag c1s-main
python scripts/journal/analyze_l2_c1_512.py
```

`README-ARCHIVE.md` lists the full command set, including the judge and rendered-model scoring reports.

## What is not here

* The pre-amendment version of `run_l2.py` (only its hash is retained; see gap G1 in `freeze-extension.json`).
* The language-server binary (hash recorded).
* The manuscript text, PDFs and generated table sources (the table generators write them under `paper-long/` when run), the review-round correspondence and earlier manuscript revisions.
* Any provider credential. The caches contain prompts and responses only.

## Notes on the record

* `freeze.json` was written before the test runs; `freeze-extension.json` lists every file added afterwards and does not
  retroactively pre-register anything.
* The two 20K documents and the C1S arm are post-hoc; the manuscript reports them as such.
* The `doclevel-l2x-main.*` files label 20K contrasts with the 5K test-set wording; the manuscript cites no p-value or
  interval from them (see `README-ARCHIVE.md`).

## License

MIT License (see `LICENSE`). It covers the code, the constructed benchmark documents and the run outputs in this repository.
