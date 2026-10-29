# Evidence archive — public release (https://github.com/Cheol-SELab/t2sysml-bounded-reading-l2)

Evidence bundle SHA-256: `303ab1d61e0ae0c80578e4e6b751d120efe7b3399f77f46843962a4ca0a32ac5` (hash of MANIFEST.sha256 content). 10,587 evidence files, 286 MB.
No manuscript material is included; the table generators write their output under paper-long/ieee-access/ when run.

Offline verification (no API key, no model call), from this directory:

```
python scripts/journal/build_l2_archive.py verify --dest .
python scripts/journal/freeze_l2.py verify
set T2M_OFFLINE=1
python scripts/journal/judge_l2_docaware.py report --tag l2x-main --prompt context
python scripts/journal/judge_l2_docaware.py report --tag l2x-main --prompt combined
python scripts/journal/judge_l2_docaware.py report --tag test-main --prompt context --sample 120 --seed 7
python scripts/journal/judge_l2_docaware.py report --tag test-main --prompt combined --sample 120 --seed 7
set SELAB_LSP_BIN=<path to sysml-lsp.exe, sha256 in experiments/journal-v1/l2/freeze-extension.json>
python scripts/journal/score_l2_rendered.py --tag test-main --docs L2T1,L2T2,L2T3,L2T4,L2T5,L2T6,L2T7,L2T8 --models gpt-6.1-sol,claude-opus-5-5 --conditions F,C1,C2,C4,OL --samples 3
python scripts/journal/score_l2_rendered.py --tag l2x-main --docs L2X1,L2X2 --models gpt-6.1-sol,claude-opus-5-5 --conditions F,C1,C2,OL --samples 2
python scripts/journal/analyze_l2_doclevel.py --tag test-main
python scripts/journal/build_l2_paper_rev2.py --tag test-main --long-tag l2x-main
python scripts/journal/run_l2_c1_512.py report --verify --judge --sysml --tag c1s-main
python scripts/journal/analyze_l2_c1_512.py
```

The frozen `run_l2.py report --verify --judge --sysml` re-scores from the caches `l2-verify` and `l2-judge` when run with an
offline CachedClient; the historical report files it produced are under experiments/journal-v1/l2/analysis/.
The pre-amendment run_l2.py is not retained (see freeze-extension.json, gap G1).

Note on experiments/journal-v1/l2/analysis/doclevel-l2x-main.{json,md}: analyze_l2_doclevel.py applies the labels of the
5K test set to any tag, so these files call the C1/RNV contrasts on the two 20K documents "pre-registered contrast" and give
them Holm-adjusted p-values and bootstrap intervals over two documents (at most three distinct resample means). The 20K
documents were built after the freeze: every 20K contrast is post-hoc, an exact test on two documents cannot go below
p = 0.5, and these intervals are not informative. The manuscript cites no 20K p-value or interval from these files and
reports the 20K rows as post-hoc directions without tests. The files are kept unchanged as generated.
