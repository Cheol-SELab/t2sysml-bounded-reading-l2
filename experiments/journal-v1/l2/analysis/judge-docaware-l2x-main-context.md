# Document-aware judge — l2x-main, prompt arm `context` (post-hoc sensitivity analysis)

Judge `claude-sonnet-5-5` (amendment 1); context cap 4096 tokens; 347 of 347 named joins selected (all); unresolved new-arm judgments: {}; offline: True; prompt-template hashes: ['6d5dbe9d47deccf8'].

Join universe (named joins per model and condition over all runs): claude-opus-5-5/C1: 83, claude-opus-5-5/C2: 47, claude-opus-5-5/F: 0, claude-opus-5-5/OL: 17, gpt-6.1-sol/C1: 91, gpt-6.1-sol/C2: 53, gpt-6.1-sol/F: 3, gpt-6.1-sol/OL: 53.

Evidence-only verdicts are the historical judge verdicts (same sentences and prompt as the verifier). RNV = joins the cross-vendor verifier kept (saved checks; verifier errors withdrew the join). Denominators count only resolved new-arm verdicts.

| model | cond | selected | RN prec. evidence-only | RN prec. doc-aware | RNV joins | RNV prec. evidence-only | RNV prec. doc-aware | withdrawn by V (errors) | truncated contexts | agree | ev-only sup / doc-aware not | ev-only not / doc-aware sup | unresolved |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| gpt-6.1-sol | F | 3 | 0.33 (1/3) | 0.33 (1/3) | 3 | 0.33 (1/3) | 0.33 (1/3) | 0 (0) | 0 | 3/3 | 0 | 0 | 0 |
| gpt-6.1-sol | C1 | 91 | 0.89 (81/91) | 0.88 (80/91) | 80 | 0.97 (78/80) | 0.97 (78/80) | 11 (1) | 1 | 88/91 | 2 | 1 | 0 |
| gpt-6.1-sol | C2 | 53 | 0.83 (44/53) | 0.83 (44/53) | 44 | 1.00 (44/44) | 1.00 (44/44) | 9 (0) | 0 | 53/53 | 0 | 0 | 0 |
| gpt-6.1-sol | OL | 53 | 0.83 (44/53) | 0.83 (44/53) | 43 | 1.00 (43/43) | 1.00 (43/43) | 10 (1) | 1 | 53/53 | 0 | 0 | 0 |
| claude-opus-5-5 | C1 | 83 | 0.89 (74/83) | 0.89 (74/83) | 72 | 1.00 (72/72) | 1.00 (72/72) | 11 (0) | 1 | 81/83 | 1 | 1 | 0 |
| claude-opus-5-5 | C2 | 47 | 0.85 (40/47) | 0.85 (40/47) | 40 | 1.00 (40/40) | 1.00 (40/40) | 7 (0) | 0 | 47/47 | 0 | 0 | 0 |
| claude-opus-5-5 | OL | 17 | 0.53 (9/17) | 0.53 (9/17) | 10 | 0.90 (9/10) | 0.90 (9/10) | 7 (0) | 8 | 17/17 | 0 | 0 | 0 |
