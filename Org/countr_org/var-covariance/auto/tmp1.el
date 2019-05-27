(TeX-add-style-hook
 "tmp1"
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
    "sec:org57be9e6"
    "sec:org4e70453"
    "eq:orgd2c1d37"
    "sec:orgc182a4d"
    "sec:orgda97542"
    "sec:orgcea194f"
    "sec:org7389c6f"
    "sec:org7c5959e"
    "sec:orgf4ce775")
   (LaTeX-add-bibliographies
    "REFERENCES")
   (LaTeX-add-xcolor-definecolors
    "Red"
    "NavyBlue"
    "MidnightBlue"))
 :latex)

