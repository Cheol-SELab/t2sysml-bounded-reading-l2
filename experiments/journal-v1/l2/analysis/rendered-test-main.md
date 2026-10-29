# Probe recall on the rendered SysML v2 model — test-main (post-hoc, structural check)

Renderer: frozen `l2_sysml.render`; checker `sysml-lsp.exe` sha256 `5a00d10f977964db1a2d866d7712c6aa682d9ab7c6197d24fb94231df3485088`; RNV membership from saved verifier checks. Means over documents (then runs). Planned 8x2x5x3 runs; failures: 0.

| model | cond | variant | far (ledger) | far (model) | far flow (ledger/model) | far alias (ledger/model) | short flows (ledger/model) | LSP errors | not rendered per run (by type) | composition facts per run | skipped unresolved per run | ident collisions |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| gpt-6.1-sol | F | R | 1.00 | 1.00 | 1.00/1.00 | 1.00/1.00 | 1.00/1.00 | 0.0 | 51.0 (allocation 1.5, attribute 3.8, constraint 3.9, succession 38.0, transition 3.8) | 2.8 | 162.8 | 0 |
| gpt-6.1-sol | F | RN | 1.00 | 1.00 | 1.00/1.00 | 1.00/1.00 | 1.00/1.00 | 0.0 | 51.0 (allocation 1.5, attribute 3.8, constraint 3.9, succession 38.0, transition 3.8) | 2.8 | 162.8 | 0 |
| gpt-6.1-sol | F | RNV | 1.00 | 1.00 | 1.00/1.00 | 1.00/1.00 | 1.00/1.00 | 0.0 | 51.0 (allocation 1.5, attribute 3.8, constraint 3.9, succession 38.0, transition 3.8) | 2.8 | 162.8 | 0 |
| gpt-6.1-sol | C1 | R | 0.45 | 0.45 | 0.00/0.00 | 1.00/1.00 | 0.00/0.00 | 0.0 | 75.1 (allocation 4.0, attribute 6.1, constraint 9.6, succession 45.0, transition 10.3) | 5.7 | 178.7 | 0 |
| gpt-6.1-sol | C1 | RN | 0.95 | 0.95 | 0.91/0.91 | 1.00/1.00 | 0.82/0.82 | 0.0 | 75.1 (allocation 4.0, attribute 6.1, constraint 9.6, succession 45.0, transition 10.3) | 5.7 | 178.7 | 0 |
| gpt-6.1-sol | C1 | RNV | 0.95 | 0.95 | 0.91/0.91 | 1.00/1.00 | 0.82/0.82 | 0.0 | 75.1 (allocation 4.0, attribute 6.1, constraint 9.6, succession 45.0, transition 10.3) | 5.7 | 178.7 | 0 |
| gpt-6.1-sol | C2 | R | 0.88 | 0.88 | 0.78/0.78 | 0.99/0.99 | 0.80/0.80 | 0.0 | 69.5 (allocation 2.2, attribute 5.6, constraint 10.2, succession 44.0, transition 7.6) | 5.3 | 171.8 | 0 |
| gpt-6.1-sol | C2 | RN | 0.99 | 0.99 | 0.98/0.98 | 0.99/0.99 | 0.97/0.97 | 0.0 | 69.5 (allocation 2.2, attribute 5.6, constraint 10.2, succession 44.0, transition 7.6) | 5.3 | 171.8 | 0 |
| gpt-6.1-sol | C2 | RNV | 0.99 | 0.99 | 0.98/0.98 | 0.99/0.99 | 0.97/0.97 | 0.0 | 69.5 (allocation 2.2, attribute 5.6, constraint 10.2, succession 44.0, transition 7.6) | 5.3 | 171.8 | 0 |
| gpt-6.1-sol | C4 | R | 0.48 | 0.48 | 0.04/0.04 | 1.00/1.00 | 0.00/0.00 | 0.0 | 69.4 (allocation 2.2, attribute 5.1, constraint 8.0, succession 44.8, transition 9.3) | 5.0 | 179.1 | 0 |
| gpt-6.1-sol | C4 | RN | 0.95 | 0.95 | 0.90/0.90 | 1.00/1.00 | 0.82/0.82 | 0.0 | 69.4 (allocation 2.2, attribute 5.1, constraint 8.0, succession 44.8, transition 9.3) | 5.0 | 179.1 | 0 |
| gpt-6.1-sol | C4 | RNV | 0.95 | 0.95 | 0.90/0.90 | 1.00/1.00 | 0.82/0.82 | 0.0 | 69.4 (allocation 2.2, attribute 5.1, constraint 8.0, succession 44.8, transition 9.3) | 5.0 | 179.1 | 0 |
| gpt-6.1-sol | OL | R | 0.74 | 0.74 | 0.52/0.52 | 1.00/1.00 | 0.52/0.52 | 0.0 | 66.9 (allocation 1.8, attribute 4.6, constraint 7.7, succession 44.6, transition 8.1) | 5.0 | 177.0 | 0 |
| gpt-6.1-sol | OL | RN | 0.99 | 0.99 | 0.97/0.97 | 1.00/1.00 | 0.95/0.95 | 0.0 | 66.9 (allocation 1.8, attribute 4.6, constraint 7.7, succession 44.6, transition 8.1) | 5.0 | 177.0 | 0 |
| gpt-6.1-sol | OL | RNV | 0.99 | 0.99 | 0.97/0.97 | 1.00/1.00 | 0.95/0.95 | 0.0 | 66.9 (allocation 1.8, attribute 4.6, constraint 7.7, succession 44.6, transition 8.1) | 5.0 | 177.0 | 0 |
| claude-opus-5-5 | F | R | 1.00 | 1.00 | 1.00/1.00 | 1.00/1.00 | 1.00/1.00 | 0.0 | 20.6 (allocation 0.2, attribute 0.4, constraint 1.0, succession 16.5, transition 2.5) | 1.0 | 34.5 | 0 |
| claude-opus-5-5 | F | RN | 1.00 | 1.00 | 1.00/1.00 | 1.00/1.00 | 1.00/1.00 | 0.0 | 20.6 (allocation 0.2, attribute 0.4, constraint 1.0, succession 16.5, transition 2.5) | 1.0 | 34.5 | 0 |
| claude-opus-5-5 | F | RNV | 1.00 | 1.00 | 1.00/1.00 | 1.00/1.00 | 1.00/1.00 | 0.0 | 20.6 (allocation 0.2, attribute 0.4, constraint 1.0, succession 16.5, transition 2.5) | 1.0 | 34.5 | 0 |
| claude-opus-5-5 | C1 | R | 0.45 | 0.45 | 0.00/0.00 | 1.00/1.00 | 0.00/0.00 | 0.0 | 47.6 (allocation 0.4, attribute 1.6, constraint 4.4, succession 36.5, transition 4.7) | 2.3 | 125.8 | 0 |
| claude-opus-5-5 | C1 | RN | 0.92 | 0.92 | 0.86/0.86 | 1.00/1.00 | 0.75/0.75 | 0.0 | 47.6 (allocation 0.4, attribute 1.6, constraint 4.4, succession 36.5, transition 4.7) | 2.3 | 125.8 | 0 |
| claude-opus-5-5 | C1 | RNV | 0.92 | 0.92 | 0.85/0.85 | 1.00/1.00 | 0.73/0.73 | 0.0 | 47.6 (allocation 0.4, attribute 1.6, constraint 4.4, succession 36.5, transition 4.7) | 2.3 | 125.8 | 0 |
| claude-opus-5-5 | C2 | R | 0.94 | 0.94 | 0.90/0.90 | 0.98/0.98 | 0.92/0.92 | 0.0 | 57.2 (allocation 0.5, attribute 4.8, constraint 8.1, succession 38.7, transition 5.2) | 3.4 | 125.1 | 0 |
| claude-opus-5-5 | C2 | RN | 0.98 | 0.98 | 0.98/0.98 | 0.98/0.98 | 0.97/0.97 | 0.0 | 57.2 (allocation 0.5, attribute 4.8, constraint 8.1, succession 38.7, transition 5.2) | 3.4 | 125.1 | 0 |
| claude-opus-5-5 | C2 | RNV | 0.98 | 0.98 | 0.98/0.98 | 0.98/0.98 | 0.97/0.97 | 0.0 | 57.2 (allocation 0.5, attribute 4.8, constraint 8.1, succession 38.7, transition 5.2) | 3.4 | 125.1 | 0 |
| claude-opus-5-5 | C4 | R | 0.55 | 0.55 | 0.19/0.19 | 0.99/0.99 | 0.00/0.00 | 0.0 | 56.2 (allocation 0.3, attribute 4.0, constraint 7.6, succession 38.3, transition 5.9) | 3.0 | 125.8 | 0 |
| claude-opus-5-5 | C4 | RN | 0.93 | 0.93 | 0.88/0.88 | 0.99/0.99 | 0.77/0.77 | 0.0 | 56.2 (allocation 0.3, attribute 4.0, constraint 7.6, succession 38.3, transition 5.9) | 3.0 | 125.8 | 0 |
| claude-opus-5-5 | C4 | RNV | 0.93 | 0.93 | 0.87/0.87 | 0.99/0.99 | 0.74/0.74 | 0.0 | 56.2 (allocation 0.3, attribute 4.0, constraint 7.6, succession 38.3, transition 5.9) | 3.0 | 125.8 | 0 |
| claude-opus-5-5 | OL | R | 0.89 | 0.89 | 0.81/0.81 | 1.00/1.00 | 0.83/0.83 | 0.0 | 56.4 (allocation 0.8, attribute 3.5, constraint 7.5, succession 38.5, transition 6.0) | 2.9 | 128.0 | 0 |
| claude-opus-5-5 | OL | RN | 0.99 | 0.99 | 0.98/0.98 | 1.00/1.00 | 0.97/0.97 | 0.0 | 56.4 (allocation 0.8, attribute 3.5, constraint 7.5, succession 38.5, transition 6.0) | 2.9 | 128.0 | 0 |
| claude-opus-5-5 | OL | RNV | 0.99 | 0.99 | 0.98/0.98 | 1.00/1.00 | 0.97/0.97 | 0.0 | 56.4 (allocation 0.8, attribute 3.5, constraint 7.5, succession 38.5, transition 6.0) | 2.9 | 128.0 | 0 |
