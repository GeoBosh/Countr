(TeX-add-style-hook
 "quine"
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
    '("CountrDist" 1)
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
    "code"
    "itemize"
    "description"
    "enumerate")
   (LaTeX-add-labels
    "sec:org7a7364c"
    "sec:orgf2afda2"
    "tab:quine:days"
    "sec:org8d598bb"
    "sec:orgb7ea481"
    "tab:lr_pois"
    "tab:lr_gengam"
    "tab:ic_models"
    "sec:org8eb9aaa"
    "sec:org6d61427"
    "sec:orge8f4ccf")
   (LaTeX-add-bibliographies)
   (LaTeX-add-xcolor-definecolors
    "Red"
    "NavyBlue"
    "MidnightBlue"))
 :latex)

