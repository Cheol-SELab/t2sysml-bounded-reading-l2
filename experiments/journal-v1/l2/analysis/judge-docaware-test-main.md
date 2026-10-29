# Document-aware judge — test-main

Judge `claude-sonnet-5-5` (amendment 1); context cap 4096 tokens; 120 of 994 named joins judged (seeded sample, seed 7); cache misses: 0; errors: 0; offline: False.

Evidence-only verdicts are the historical judge verdicts (same sentences as the verifier). RNV = joins the cross-vendor verifier kept.

| model | cond | joins judged | RN prec. evidence-only | RN prec. doc-aware | RNV joins | RNV prec. evidence-only | RNV prec. doc-aware | withdrawn by V | V errors | agree | ev-only sup / doc-aware not | ev-only not / doc-aware sup |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| gpt-6.1-sol | C1 | 26 | 1.00 (26/26) | 1.00 (26/26) | 26 | 1.00 (26/26) | 1.00 (26/26) | 0 | 0 | 26/26 | 0 | 0 |
| gpt-6.1-sol | C2 | 4 | 1.00 (4/4) | 1.00 (4/4) | 4 | 1.00 (4/4) | 1.00 (4/4) | 0 | 0 | 4/4 | 0 | 0 |
| gpt-6.1-sol | C4 | 29 | 1.00 (29/29) | 1.00 (29/29) | 29 | 1.00 (29/29) | 1.00 (29/29) | 0 | 0 | 29/29 | 0 | 0 |
| gpt-6.1-sol | OL | 11 | 1.00 (11/11) | 1.00 (11/11) | 11 | 1.00 (11/11) | 1.00 (11/11) | 0 | 0 | 11/11 | 0 | 0 |
| claude-opus-5-5 | C1 | 31 | 1.00 (31/31) | 1.00 (31/31) | 30 | 1.00 (30/30) | 1.00 (30/30) | 1 | 1 | 31/31 | 0 | 0 |
| claude-opus-5-5 | C2 | 4 | 1.00 (4/4) | 1.00 (4/4) | 4 | 1.00 (4/4) | 1.00 (4/4) | 0 | 0 | 4/4 | 0 | 0 |
| claude-opus-5-5 | C4 | 13 | 1.00 (13/13) | 1.00 (13/13) | 13 | 1.00 (13/13) | 1.00 (13/13) | 0 | 0 | 13/13 | 0 | 0 |
| claude-opus-5-5 | OL | 2 | 1.00 (2/2) | 1.00 (2/2) | 2 | 1.00 (2/2) | 1.00 (2/2) | 0 | 0 | 2/2 | 0 | 0 |
