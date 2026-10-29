# C1S (post-hoc, 512-token chunks, no memory) against the frozen test arms

Document-level means over 8 documents (3 runs each). CI: 95% percentile bootstrap over documents. p: exact sign-flip test, two-sided, unadjusted. +/-/0: documents where the proposed arm is higher, lower, equal.

## Arm means (C1S variants; frozen arms for reference)

| model | arm | far | far flow | short flow | wrong | joined | judge prec | in tok | out tok | calls |
|---|---|---|---|---|---|---|---|---|---|---|
| Sol | F/R | 1.000 | 1.000 | 1.000 | 0.00 | nan | -- | 1.00x | 1.00x | 1.0 |
| Sol | C1/R | 0.453 | 0.000 | 0.000 | 0.00 | nan | -- | 1.71x | 1.91x | 7.0 |
| Sol | C1/RN | 0.955 | 0.912 | 0.825 | 0.00 | 9.0 | 215/216 | 1.71x | 1.91x | 7.0 |
| Sol | C1/RNV | 0.955 | 0.912 | 0.825 | 0.00 | 9.0 | 215/216 | 2.55x | 1.94x | 16.0 |
| Sol | C1S/raw | 0.002 | 0.000 | 0.000 | 0.00 | nan | -- | 2.47x | 2.59x | 13.5 |
| Sol | C1S/R | 0.446 | 0.000 | 0.000 | 0.00 | nan | -- | 2.47x | 2.59x | 13.5 |
| Sol | C1S/RH | 0.948 | 0.912 | 0.825 | 0.00 | 10.4 | 219/249 | 2.47x | 2.59x | 13.5 |
| Sol | C1S/RN | 0.948 | 0.912 | 0.825 | 0.00 | 9.0 | 215/216 | 2.47x | 2.59x | 13.5 |
| Sol | C1S/RNV | 0.948 | 0.912 | 0.825 | 0.00 | 9.0 | 215/216 | 3.32x | 2.62x | 22.5 |
| Sol | C2/R | 0.877 | 0.778 | 0.800 | 0.17 | nan | -- | 5.35x | 2.60x | 27.0 |
| Sol | C4/R | 0.476 | 0.043 | 0.000 | 0.33 | nan | -- | 3.36x | 2.37x | 13.5 |
| Sol | OL/R | 0.737 | 0.525 | 0.521 | 0.08 | nan | -- | 3.36x | 2.37x | 13.5 |
| Sol | C2/RNV | 0.985 | 0.978 | 0.967 | 0.17 | 1.9 | 45/45 | 5.53x | 2.61x | 28.9 |
| Sol | C4/RNV | 0.945 | 0.895 | 0.825 | 0.33 | 8.3 | 199/200 | 4.14x | 2.40x | 21.8 |
| Sol | OL/RNV | 0.986 | 0.973 | 0.954 | 0.08 | 4.5 | 106/107 | 3.78x | 2.38x | 18.0 |
| Opus | F/R | 1.000 | 1.000 | 1.000 | 0.00 | nan | -- | 1.00x | 1.00x | 1.0 |
| Opus | C1/R | 0.453 | 0.000 | 0.000 | 0.08 | nan | -- | 1.79x | 1.99x | 7.0 |
| Opus | C1/RN | 0.925 | 0.858 | 0.750 | 0.08 | 8.5 | 202/203 | 1.79x | 1.99x | 7.0 |
| Opus | C1/RNV | 0.920 | 0.850 | 0.733 | 0.08 | 8.5 | 200/201 | 1.98x | 2.01x | 15.5 |
| Opus | C1S/raw | 0.007 | 0.000 | 0.000 | 0.00 | nan | -- | 2.65x | 2.01x | 13.5 |
| Opus | C1S/R | 0.450 | 0.000 | 0.000 | 0.00 | nan | -- | 2.65x | 2.01x | 13.5 |
| Opus | C1S/RH | 0.924 | 0.860 | 0.750 | 0.00 | 9.7 | 203/233 | 2.65x | 2.01x | 13.5 |
| Opus | C1S/RN | 0.924 | 0.860 | 0.750 | 0.00 | 8.5 | 203/204 | 2.65x | 2.01x | 13.5 |
| Opus | C1S/RNV | 0.917 | 0.848 | 0.725 | 0.00 | 8.5 | 200/201 | 2.84x | 2.03x | 22.0 |
| Opus | C2/R | 0.941 | 0.904 | 0.917 | 0.17 | nan | -- | 5.69x | 2.86x | 27.0 |
| Opus | C4/R | 0.553 | 0.188 | 0.000 | 0.00 | nan | -- | 3.42x | 1.96x | 13.5 |
| Opus | OL/R | 0.894 | 0.807 | 0.833 | 0.04 | nan | -- | 3.44x | 2.00x | 13.5 |
| Opus | C2/RNV | 0.981 | 0.978 | 0.967 | 0.17 | 0.7 | 17/17 | 5.70x | 2.86x | 27.7 |
| Opus | C4/RNV | 0.927 | 0.866 | 0.742 | 0.00 | 6.8 | 159/160 | 3.57x | 1.98x | 20.3 |
| Opus | OL/RNV | 0.988 | 0.979 | 0.967 | 0.04 | 1.8 | 41/41 | 3.48x | 2.00x | 15.2 |

## Paired document-level contrasts

### far

| model | proposed | reference | what | delta [95% CI] | +/-/0 | p exact |
|---|---|---|---|---|---|---|
| Sol | C1S/R | C1/R | chunk size without memory (512 vs 1,024), no join | -0.007 [-0.021, +0.000] | 0/1/7 | 1.000 |
| Sol | C1S/RNV | C1/RNV | chunk size without memory, with verified named join | -0.007 [-0.021, +0.000] | 0/1/7 | 1.000 |
| Sol | C2/R | C1S/R | rolling-summary memory at 512 tokens, no join | +0.431 [+0.357, +0.497] | 8/0/0 | 0.008 |
| Sol | C4/R | C1S/R | graph memory at 512 tokens, no join | +0.030 [+0.010, +0.053] | 5/0/3 | 0.062 |
| Sol | OL/R | C1S/R | open-end memory at 512 tokens, no join | +0.291 [+0.210, +0.357] | 8/0/0 | 0.008 |
| Sol | C1S/RNV | C1S/R | consolidation at 512 tokens without memory | +0.502 [+0.426, +0.558] | 8/0/0 | 0.008 |
| Sol | C1S/RNV | C2/R | join without memory vs summary memory, both 512 | +0.071 [-0.025, +0.152] | 7/1/0 | 0.172 |
| Sol | C1S/RNV | C4/R | join without memory vs graph memory, both 512 | +0.472 [+0.380, +0.542] | 8/0/0 | 0.008 |
| Sol | C1S/RNV | OL/R | join without memory vs open-end memory, both 512 | +0.211 [+0.086, +0.329] | 7/1/0 | 0.023 |
| Sol | C2/RNV | C1S/RNV | memory on top of the join, both 512 (summary) | +0.037 [-0.008, +0.103] | 2/2/4 | 0.500 |
| Sol | C4/RNV | C1S/RNV | memory on top of the join, both 512 (graph) | -0.003 [-0.017, +0.011] | 1/2/5 | 1.000 |
| Sol | OL/RNV | C1S/RNV | memory on top of the join, both 512 (open-end) | +0.038 [+0.000, +0.092] | 3/1/4 | 0.250 |
| Sol | F/R | C1S/RNV | whole document vs 512 join | +0.052 [+0.007, +0.122] | 3/0/5 | 0.250 |
| Opus | C1S/R | C1/R | chunk size without memory (512 vs 1,024), no join | -0.002 [-0.007, +0.000] | 0/1/7 | 1.000 |
| Opus | C1S/RNV | C1/RNV | chunk size without memory, with verified named join | -0.003 [-0.029, +0.032] | 1/4/3 | 0.938 |
| Opus | C2/R | C1S/R | rolling-summary memory at 512 tokens, no join | +0.491 [+0.434, +0.544] | 8/0/0 | 0.008 |
| Opus | C4/R | C1S/R | graph memory at 512 tokens, no join | +0.103 [+0.077, +0.130] | 8/0/0 | 0.008 |
| Opus | OL/R | C1S/R | open-end memory at 512 tokens, no join | +0.443 [+0.360, +0.509] | 8/0/0 | 0.008 |
| Opus | C1S/RNV | C1S/R | consolidation at 512 tokens without memory | +0.467 [+0.393, +0.528] | 8/0/0 | 0.008 |
| Opus | C1S/RNV | C2/R | join without memory vs summary memory, both 512 | -0.024 [-0.109, +0.052] | 3/4/1 | 0.641 |
| Opus | C1S/RNV | C4/R | join without memory vs graph memory, both 512 | +0.364 [+0.296, +0.418] | 8/0/0 | 0.008 |
| Opus | C1S/RNV | OL/R | join without memory vs open-end memory, both 512 | +0.023 [-0.068, +0.125] | 4/2/2 | 0.688 |
| Opus | C2/RNV | C1S/RNV | memory on top of the join, both 512 (summary) | +0.064 [+0.008, +0.132] | 6/1/1 | 0.078 |
| Opus | C4/RNV | C1S/RNV | memory on top of the join, both 512 (graph) | +0.010 [-0.007, +0.024] | 4/1/3 | 0.375 |
| Opus | OL/RNV | C1S/RNV | memory on top of the join, both 512 (open-end) | +0.071 [+0.021, +0.133] | 7/0/1 | 0.016 |
| Opus | F/R | C1S/RNV | whole document vs 512 join | +0.083 [+0.035, +0.141] | 7/0/1 | 0.016 |

### far_flow

| model | proposed | reference | what | delta [95% CI] | +/-/0 | p exact |
|---|---|---|---|---|---|---|
| Sol | C1S/R | C1/R | chunk size without memory (512 vs 1,024), no join | +0.000 [+0.000, +0.000] | 0/0/8 | 1.000 |
| Sol | C1S/RNV | C1/RNV | chunk size without memory, with verified named join | +0.000 [+0.000, +0.000] | 0/0/8 | 1.000 |
| Sol | C2/R | C1S/R | rolling-summary memory at 512 tokens, no join | +0.778 [+0.642, +0.894] | 8/0/0 | 0.008 |
| Sol | C4/R | C1S/R | graph memory at 512 tokens, no join | +0.043 [+0.015, +0.074] | 5/0/3 | 0.062 |
| Sol | OL/R | C1S/R | open-end memory at 512 tokens, no join | +0.525 [+0.370, +0.661] | 8/0/0 | 0.008 |
| Sol | C1S/RNV | C1S/R | consolidation at 512 tokens without memory | +0.912 [+0.787, +0.988] | 8/0/0 | 0.008 |
| Sol | C1S/RNV | C2/R | join without memory vs summary memory, both 512 | +0.135 [-0.057, +0.299] | 7/1/0 | 0.195 |
| Sol | C1S/RNV | C4/R | join without memory vs graph memory, both 512 | +0.869 [+0.719, +0.968] | 8/0/0 | 0.008 |
| Sol | C1S/RNV | OL/R | join without memory vs open-end memory, both 512 | +0.388 [+0.151, +0.597] | 7/1/0 | 0.023 |
| Sol | C2/RNV | C1S/RNV | memory on top of the join, both 512 (summary) | +0.065 [-0.019, +0.195] | 2/2/4 | 0.500 |
| Sol | C4/RNV | C1S/RNV | memory on top of the join, both 512 (graph) | -0.017 [-0.034, -0.004] | 0/3/5 | 0.250 |
| Sol | OL/RNV | C1S/RNV | memory on top of the join, both 512 (open-end) | +0.060 [-0.008, +0.169] | 2/1/5 | 0.500 |
| Sol | F/R | C1S/RNV | whole document vs 512 join | +0.087 [+0.012, +0.212] | 3/0/5 | 0.250 |
| Opus | C1S/R | C1/R | chunk size without memory (512 vs 1,024), no join | +0.000 [+0.000, +0.000] | 0/0/8 | 1.000 |
| Opus | C1S/RNV | C1/RNV | chunk size without memory, with verified named join | -0.002 [-0.052, +0.073] | 1/4/3 | 1.000 |
| Opus | C2/R | C1S/R | rolling-summary memory at 512 tokens, no join | +0.904 [+0.825, +0.975] | 8/0/0 | 0.008 |
| Opus | C4/R | C1S/R | graph memory at 512 tokens, no join | +0.188 [+0.142, +0.237] | 8/0/0 | 0.008 |
| Opus | OL/R | C1S/R | open-end memory at 512 tokens, no join | +0.807 [+0.657, +0.917] | 8/0/0 | 0.008 |
| Opus | C1S/RNV | C1S/R | consolidation at 512 tokens without memory | +0.848 [+0.727, +0.938] | 8/0/0 | 0.008 |
| Opus | C1S/RNV | C2/R | join without memory vs summary memory, both 512 | -0.056 [-0.219, +0.079] | 3/4/1 | 0.562 |
| Opus | C1S/RNV | C4/R | join without memory vs graph memory, both 512 | +0.660 [+0.551, +0.743] | 8/0/0 | 0.008 |
| Opus | C1S/RNV | OL/R | join without memory vs open-end memory, both 512 | +0.041 [-0.131, +0.226] | 4/2/2 | 0.688 |
| Opus | C2/RNV | C1S/RNV | memory on top of the join, both 512 (summary) | +0.130 [+0.031, +0.255] | 6/0/2 | 0.031 |
| Opus | C4/RNV | C1S/RNV | memory on top of the join, both 512 (graph) | +0.018 [-0.012, +0.045] | 4/1/3 | 0.375 |
| Opus | OL/RNV | C1S/RNV | memory on top of the join, both 512 (open-end) | +0.131 [+0.033, +0.254] | 6/0/2 | 0.031 |
| Opus | F/R | C1S/RNV | whole document vs 512 join | +0.152 [+0.062, +0.269] | 7/0/1 | 0.016 |

