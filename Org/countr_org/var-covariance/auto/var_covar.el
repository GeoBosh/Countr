(TeX-add-style-hook
 "var_covar"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "twoside" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("geometry" "margin=1.0in") ("xcolor" "usenames" "dvipsnames") ("hyperref" "pdftex" "hyperfootnotes=true" "plainpages=false" "pdfpagelabels" "hypertexnames=true" "naturalnames" "pdfproducer={Latex}" "pdfcreator={pdflatex}" "bookmarks" "bookmarksnumbered" "colorlinks" "linkcolor=MidnightBlue" "citecolor=NavyBlue" "filecolor=black" "urlcolor=Red" "breaklinks=true") ("lscape" "pdftex") ("appendix" "toc" "page") ("caption" "font=small") ("natbib" "round")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "fontenc"
    "libertine"
    "lmodern"
    "geometry"
    "rotating"
    "setspace"
    "amsmath"
    "amsfonts"
    "amssymb"
    "bm"
    "graphicx"
    "xcolor"
    "hyperref"
    "authblk"
    "xspace"
    "helvet"
    "moreverb"
    "url"
    "booktabs"
    "cleveref"
    "lscape"
    "fullpage"
    "multirow"
    "pifont"
    "threeparttable"
    "tabulary"
    "appendix"
    "pbox"
    "caption"
    "paralist"
    "natbib")
   (TeX-add-symbols
    '("RNum" 1)
    '("rom" 1)
    "E"
    "VAR"
    "COV"
    "Prob"
    "dee"
    "naive"
    "eg"
    "ie"
    "pdf"
    "etc"
    "PhD"
    "MSc"
    "BA"
    "R"
    "countr"
    "itemize"
    "description"
    "enumerate")
   (LaTeX-add-labels
    "sec:org00b2160"
    "sec:org3f9bf68"
    "eq:org35774cb"
    "sec:orgbd667ca"
    "sec:org40d0820"
    "sec:org8cadc65"
    "sec:org6827d0d"
    "tab:varCovar"
    "sec:org32ad181"
    "sec:org8402f9f")
   (LaTeX-add-bibliographies
    "REFERENCES")
   (LaTeX-add-xcolor-definecolors
    "Red"
    "NavyBlue"
    "MidnightBlue"))
 :latex)

