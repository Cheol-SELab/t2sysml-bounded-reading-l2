"""Generate paper-long/ieee-access/body.tex from paper-long/main.tex (IEEE Access version).

    python scripts/journal/build_l2_ieee_body.py

Run after build_l2_paper.py; then compile paper-long/ieee-access/manuscript-ieee-access.tex
(pdflatex, bibtex, pdflatex x2). Generated tables are read from paper-long/ via \\input@path.
"""
import pathlib
P = pathlib.Path(__file__).resolve().parents[2] / "paper-long"
t = (P / "main.tex").read_text(encoding="utf-8")
body = t[t.index(r"\section{Introduction}"):t.index(r"\bibliographystyle")]
if r"\input{ieee-access/appendix.tex}" in body:  # the manuscript inputs appendix.tex itself
    body = body[:body.index(r"\input{ieee-access/appendix.tex}")].rstrip() + "\n"
body = body.replace(r"Text-to-model work for SysML~v2", r"\PARstart{T}{ext-to-model} work for SysML~v2", 1)
for name, lab in [("Introduction", "intro"), ("Related Work", "related"), ("Problem and Method", "method"),
                  ("Benchmark", "benchmark"), ("Experimental Setup", "setup"), ("Results", "results"),
                  ("Discussion", "discussion"), ("Threats to Validity", "threats"), ("Conclusion", "conclusion")]:
    new = "\\section{" + name + "}\\label{sec:" + lab + "}\n"
    if new in body:  # main.tex now carries the labels itself (article and IEEE share them)
        continue
    old = "\\section{" + name + "}\n"
    assert old in body, name
    body = body.replace(old, new, 1)
fig = r"""\begin{figure*}[t]
\centering
\includegraphics[width=0.92\textwidth]{figures/l2-pipeline.pdf}
\caption{Bounded reading and ledger consolidation. Each extraction call sees one chunk and an optional memory block
selected from the external ledger (C2, C4 or OL; none for C1 and C1S), within 1,024 tokens of variable input. Consolidation
runs over the whole ledger without model calls; only joined flows are re-read by a model of the other vendor, and the 1,024-token limit in step 6 is the verifier's evidence budget per join. F (whole
document in one call) is the unbounded reference.}
\label{fig:pipeline}
\end{figure*}

Fig.~\ref{fig:pipeline} summarizes the method; this section defines each step, and Appendix~\ref{app:example}
follows one far probe through every step with the actual ledger rows, memory block, join, verifier exchange and
rendered SysML~v2.

"""
anchor = "\\section{Problem and Method}\\label{sec:method}\n"
assert anchor in body
if "fig:pipeline" not in body:  # main.tex now carries the figure block itself
    body = body.replace(anchor, anchor + fig, 1)
# Data Availability and Competing Interests now live in main.tex (revision 2) and are sliced in with the body;
# the archive hash is read from paper-long/archive-hash.tex, written by scripts/journal/build_l2_archive.py.
assert r"\section*{Data Availability}" in body
# The article version carries the funding statement as a section; the IEEE version carries it in \tfootnote.
if r"\section*{Funding}" in body:
    body = body[:body.index(r"\section*{Funding}")].rstrip() + "\n"
(P / "ieee-access" / "body.tex").write_text(body, encoding="utf-8")
print(len(body.split()), "words")
