# L2 test-sol-partial: docs L2T1, L2T2, L2T3, L2T4, L2T5, L2T6, L2T7, L2T8

| model | cond | variant | n | far | far flow | flow full | flow short | far alias | wrong prod | forbidden | joined | join prec (judge) | sysml err | calls | input tok | output tok |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| gpt-6.1-sol | F | raw | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | nan | nan | nan | 1 | 7454 | 26496 |
| gpt-6.1-sol | F | R | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | nan | nan | 0.0 | 1 | 7454 | 26496 |
| gpt-6.1-sol | F | RJ | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.4 | nan | nan | 1 | 7454 | 26496 |
| gpt-6.1-sol | F | RH | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 1.2 | nan | 0.0 | 1 | 7454 | 26496 |
| gpt-6.1-sol | F | RHV | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 1.2 | nan | 0.0 | 2 | 8275 | 26711 |
| gpt-6.1-sol | F | RN | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.0 | nan | 0.0 | 1 | 7454 | 26496 |
| gpt-6.1-sol | F | RNV | 23 | 1.00 | 1.00 | 1.00 | 1.00 | 1.00 | 0.00 | 0.00 | 0.0 | nan | 0.0 | 1 | 7454 | 26496 |
| gpt-6.1-sol | C1 | raw | 19 | 0.00 | 0.00 | 0.00 | 0.00 | 0.01 | 0.00 | 0.00 | nan | nan | nan | 7 | 12536 | 50219 |
| gpt-6.1-sol | C1 | R | 19 | 0.46 | 0.00 | 0.00 | 0.00 | 1.00 | 0.00 | 0.00 | nan | nan | 0.0 | 7 | 12536 | 50219 |
| gpt-6.1-sol | C1 | RJ | 19 | 0.72 | 0.48 | 1.00 | 0.00 | 1.00 | 0.00 | 0.00 | 5.7 | nan | nan | 7 | 12536 | 50219 |
| gpt-6.1-sol | C1 | RH | 19 | 0.95 | 0.91 | 1.00 | 0.81 | 1.00 | 0.00 | 0.00 | 10.5 | nan | 0.0 | 7 | 12536 | 50219 |
| gpt-6.1-sol | C1 | RHV | 19 | 0.95 | 0.90 | 1.00 | 0.80 | 1.00 | 0.00 | 0.00 | 10.5 | nan | 0.0 | 17 | 19783 | 51358 |
| gpt-6.1-sol | C1 | RN | 19 | 0.95 | 0.91 | 1.00 | 0.81 | 1.00 | 0.00 | 0.00 | 9.0 | nan | 0.0 | 7 | 12536 | 50219 |
| gpt-6.1-sol | C1 | RNV | 19 | 0.95 | 0.91 | 1.00 | 0.81 | 1.00 | 0.00 | 0.00 | 9.0 | nan | 0.0 | 16 | 18778 | 51013 |
| gpt-6.1-sol | C2 | raw | 12 | 0.82 | 0.75 | 0.78 | 0.73 | 0.91 | 0.25 | 0.00 | nan | nan | nan | 26 | 38920 | 69740 |
| gpt-6.1-sol | C2 | R | 12 | 0.87 | 0.75 | 0.78 | 0.73 | 1.00 | 0.25 | 0.00 | nan | nan | 0.0 | 26 | 38920 | 69740 |
| gpt-6.1-sol | C2 | RJ | 12 | 0.92 | 0.85 | 1.00 | 0.73 | 1.00 | 0.25 | 0.00 | 1.8 | nan | nan | 26 | 38920 | 69740 |
| gpt-6.1-sol | C2 | RH | 12 | 0.98 | 0.96 | 1.00 | 0.93 | 1.00 | 0.25 | 0.00 | 3.7 | nan | 0.0 | 26 | 38920 | 69740 |
| gpt-6.1-sol | C2 | RHV | 12 | 0.98 | 0.96 | 1.00 | 0.93 | 1.00 | 0.25 | 0.00 | 3.7 | nan | 0.0 | 30 | 41473 | 70310 |
| gpt-6.1-sol | C2 | RN | 12 | 0.98 | 0.96 | 1.00 | 0.93 | 1.00 | 0.25 | 0.00 | 1.9 | nan | 0.0 | 26 | 38920 | 69740 |
| gpt-6.1-sol | C2 | RNV | 12 | 0.98 | 0.96 | 1.00 | 0.93 | 1.00 | 0.25 | 0.00 | 1.9 | nan | 0.0 | 28 | 40287 | 69924 |
| gpt-6.1-sol | C4 | raw | 18 | 0.48 | 0.04 | 0.09 | 0.00 | 1.00 | 0.17 | 0.00 | nan | nan | nan | 14 | 24863 | 63553 |
| gpt-6.1-sol | C4 | R | 18 | 0.48 | 0.04 | 0.09 | 0.00 | 1.00 | 0.17 | 0.00 | nan | nan | 0.0 | 14 | 24863 | 63553 |
| gpt-6.1-sol | C4 | RJ | 18 | 0.71 | 0.47 | 0.98 | 0.00 | 1.00 | 0.17 | 0.00 | 5.4 | nan | nan | 14 | 24863 | 63553 |
| gpt-6.1-sol | C4 | RH | 18 | 0.94 | 0.88 | 0.98 | 0.79 | 1.00 | 0.17 | 0.00 | 10.1 | nan | 0.0 | 14 | 24863 | 63553 |
| gpt-6.1-sol | C4 | RHV | 18 | 0.94 | 0.88 | 0.98 | 0.79 | 1.00 | 0.17 | 0.00 | 10.1 | nan | 0.0 | 24 | 31817 | 64622 |
| gpt-6.1-sol | C4 | RN | 18 | 0.94 | 0.89 | 0.98 | 0.80 | 1.00 | 0.17 | 0.00 | 8.4 | nan | 0.0 | 14 | 24863 | 63553 |
| gpt-6.1-sol | C4 | RNV | 18 | 0.94 | 0.89 | 0.98 | 0.80 | 1.00 | 0.17 | 0.00 | 8.4 | nan | 0.0 | 22 | 30683 | 64288 |
| gpt-6.1-sol | OL | raw | 15 | 0.68 | 0.48 | 0.48 | 0.48 | 0.93 | 0.13 | 0.00 | nan | nan | nan | 13 | 24510 | 63057 |
| gpt-6.1-sol | OL | R | 15 | 0.71 | 0.48 | 0.48 | 0.48 | 1.00 | 0.13 | 0.00 | nan | nan | 0.0 | 13 | 24510 | 63057 |
| gpt-6.1-sol | OL | RJ | 15 | 0.85 | 0.73 | 0.99 | 0.48 | 1.00 | 0.13 | 0.00 | 3.2 | nan | nan | 13 | 24510 | 63057 |
| gpt-6.1-sol | OL | RH | 15 | 0.99 | 0.98 | 0.99 | 0.97 | 1.00 | 0.13 | 0.00 | 6.4 | nan | 0.0 | 13 | 24510 | 63057 |
| gpt-6.1-sol | OL | RHV | 15 | 0.99 | 0.98 | 0.99 | 0.97 | 1.00 | 0.13 | 0.00 | 6.4 | nan | 0.0 | 20 | 28933 | 63783 |
| gpt-6.1-sol | OL | RN | 15 | 0.99 | 0.98 | 0.99 | 0.98 | 1.00 | 0.13 | 0.00 | 5.1 | nan | 0.0 | 13 | 24510 | 63057 |
| gpt-6.1-sol | OL | RNV | 15 | 0.99 | 0.98 | 0.99 | 0.98 | 1.00 | 0.13 | 0.00 | 5.1 | nan | 0.0 | 18 | 28052 | 63480 |

## Failed or missing runs (kept in the denominator of the run count)

- L2T5 gpt-6.1-sol C2 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T5 gpt-6.1-sol C2 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T5 gpt-6.1-sol C2 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T5 gpt-6.1-sol OL s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T5 gpt-6.1-sol OL s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T6 gpt-6.1-sol C2 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T6 gpt-6.1-sol C2 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T6 gpt-6.1-sol C2 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T6 gpt-6.1-sol OL s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C1 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C1 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C1 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C2 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C2 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C2 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C4 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C4 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol C4 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol OL s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol OL s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T7 gpt-6.1-sol OL s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol F s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C1 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C1 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C2 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C2 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C2 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C4 s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C4 s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol C4 s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol OL s0: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol OL s1: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
- L2T8 gpt-6.1-sol OL s2: LLMCallError: openai_responses:gpt-6.1-sol failed after 3 attempts: Error code: 429 - {'error': {'message': 'You have no credits remaining. Add credits to continue using the API at https://platform.op
