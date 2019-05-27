## make inst/doc/index.html

## ## original .writeVignetteHtmlIndex() is from tools/R/Vignettes.R in the R sources.
## .writeVignetteHtmlIndex <-
## function(pkg, con, vignetteIndex = NULL)
## {
##     ## FIXME: in principle we could need to set an encoding here
##     html <- c(HTMLheader("Vignettes and other documentation"),
##               paste0("<h2>Vignettes from package '", pkg,"'</h2>"))
##
##     if(NROW(vignetteIndex) == 0L) { ## NROW(NULL) = 0
##         html <-
##             c(html,
##               "The package contains no vignette meta-information.")
##     } else {
##     	vignetteIndex <- cbind(Package = pkg, as.matrix(vignetteIndex[,
##                                c("File", "Title", "PDF", "R")]))
##         html <- c(html, makeVignetteTable(vignetteIndex, depth = 3L))
##     }
##     otherfiles <- list.files(system.file("doc", package = pkg))
##     if(NROW(vignetteIndex))
##         otherfiles <- setdiff(otherfiles,
##                               c(vignetteIndex[, c("PDF", "File", "R")], "index.html"))
##     if (length(otherfiles)) {
##     	otherfiles <- ifelse(dir.exists(system.file(file.path("doc", otherfiles), package = pkg)),
## 			     paste0(otherfiles, "/"),
## 			     otherfiles)
## 	urls <- paste0('<a href="', otherfiles, '">', otherfiles, '</a>')
##         html <- c(html, '<h2>Other files in the <span class="samp">doc</span> directory</h2>',
##                   '<table width="100%">',
## 		  '<col style="width: 24%;" />',
## 		  '<col style="width: 50%;" />',
## 		  '<col style="width: 24%;" />',
##                   paste0('<tr><td></td><td><span class="samp">',
##                          iconv(urls, "", "UTF-8"), "</span></td></tr>"),
##                   "</table>")
##     }
##     html <- c(html, "</body></html>")
##     writeLines(html, con=con)
## }
##
##
## ## original makeVignetteTable() is from tools/R/toHTML.R in the R sources.
## makeVignetteTable <- function(vignettes, depth=2) {
##     out <- c('<table width="100%">',
## 	      '<col style="width: 22%;" />',
## 	      '<col style="width:  2%;" />',
## 	      '<col style="width: 50%;" />',
## 	      '<col style="width:  8%;" />',
## 	      '<col style="width:  8%;" />',
##              '<col style="width:  8%;" />')
##     for (i in seq_len(nrow(vignettes))) {
## 	Outfile <- vignettes[i, "PDF"]
## 	topic <- file_path_sans_ext(Outfile)
## 	Title <- vignettes[i, "Title"]
## 	File  <- vignettes[i, "File"]
## 	R     <- vignettes[i, "R"]
## 	pkg   <- vignettes[i, "Package"]
##         root <- c(rep("../", depth), "library/", pkg, "/doc/")
## 	link  <- c('<a href="', root,
## 		  if (nchar(Outfile)) Outfile else File, '">',
## 		  pkg, "::", topic, '</a>')
## 	line <- c('<tr><td style="text-align: right; vertical-align: top;">', link,
## 		    '</td>\n<td></td><td valign="top">', Title,
## 		    '</td>\n<td valign="top">',
## 		    if (nchar(Outfile))
## 			c('<a href="', root, Outfile,'">', vignette_type(Outfile), '</a>'),
## 		    '</td>\n<td valign="top">',
## 		    '<a href="', root, File,'">source</a>',
## 		    '</td>\n<td valign="top" style="white-space: nowrap">',
## 		    if (nchar(R))
## 		    	c('<a href="', root, R,'">R code</a>'),
## 		    '</td></tr>')
## 	out <- c(out, paste(line, collapse=''))
##      }
##      c(out, '</table>')
## }

##
writeVignetteHtmlIndex <-
function(pkg, con, vignetteIndex = NULL)
{
    ## FIXME: in principle we could need to set an encoding here
    html <- c(tools::HTMLheader("Vignettes and other documentation"),
              paste0("<h2>Vignettes from package '", pkg,"'</h2>"))

    if(NROW(vignetteIndex) == 0L) { ## NROW(NULL) = 0
        html <-
            c(html,
              "The package contains no vignette meta-information.")
    } else {
    	vignetteIndex <- cbind(Package = pkg, as.matrix(vignetteIndex[,
                               c("File", "Title", "PDF", "R")]))
        html <- c(html, tools:::makeVignetteTable(vignetteIndex, depth = 3L))
    }
    otherfiles <- list.files(system.file("doc", package = pkg))
    if(NROW(vignetteIndex))
        otherfiles <- setdiff(otherfiles,
                              c(vignetteIndex[, c("PDF", "File", "R")], "index.html"))
    if (length(otherfiles)) {
    	otherfiles <- ifelse(dir.exists(system.file(file.path("doc", otherfiles), package = pkg)),
			     paste0(otherfiles, "/"),
			     otherfiles)
	urls <- paste0('<a href="', otherfiles, '">', otherfiles, '</a>')
        html <- c(html, '<h2>Other files in the <span class="samp">doc</span> directory</h2>',
                  ## small chunk by Georgi
                  paste0("\n<p>The complete collection of source files for the vignettes is ",
                         "in sub-directories Rnw/ and org/ (for Rnw Sweave vignettes and ",
                         "Emacs Org-mode vignettes, respectively).",
                         "<p>"
                         ),

                  '<table width="100%">',
		  '<col style="width: 24%;" />',
		  '<col style="width: 50%;" />',
		  '<col style="width: 24%;" />',
                  paste0('<tr><td></td><td><span class="samp">',
                         iconv(urls, "", "UTF-8"), "</span></td></tr>"),
                  "</table>")
    }
    html <- c(html, "</body></html>")
    writeLines(html, con=con)
}


vig_df <- data.frame(
    c("File", "Title", "PDF", "R")]))


vig_df_row <- function(base.vig.name, File, Title, PDF, R){
    if(missing(File))
        File <- paste0(base.vig.name, ".", "Rnw") # source file, defaults to  Rnw
    if(missing(Title))
        Title <- paste0(base.vig.name, "") # human readable title
    if(missing(PDF))
        PDF <- paste0(base.vig.name, ".", "pdf") # the document, may be in other formats
    if(missing(R))
        R <- paste0(base.vig.name, ".", "R")

    data.frame(File = File, Title = Title, PDF = PDF, R = R,
               stringsAsFactors = FALSE)
}

package <- "Countr"

################

vig_df <-
rbind(
    vig_df_row("Countr_guide", Title = "Guide for package Countr",
               R = "Countr_guide_paper.R")
  , vig_df_row("ComputationalPerformance", Title = "Comparing performance of computational methods",
               R = "perf.R")
  , vig_df_row("ModelSelectionAndComparison", Title = "Example with quine data",
               R = "quine.R")
  , vig_df_row("VarianceCovariance", Title = "Computation of variance-covariance matrix",
               R = "var_covar.R")
  , vig_df_row("exampleFertility", Title = "Example with fertility data",
               R = "fertility.R")
  , vig_df_row("exampleFootball", Title = "Example with football data",
               R = "football.R")
  #, vig_df_row("", Title = "")
    )

#tools:::.writeVignetteHtmlIndex(package, "./tmp.html", vig_df)
writeVignetteHtmlIndex(package, "./index.html", vig_df)

#################

## vig2_df <-
## rbind(
##     vig_df_row("Countr_guide", Title = "Guide for package Countr"
##                , File = paste0("org/Countr_guide", ".", "Rnw"))
##     , vig_df_row("ComputationalPerformance", Title = "Comparing performance of computational methods")
##     )
##
## tools:::.writeVignetteHtmlIndex(package, "./tmp2.html", vig2_df)
##
## writeVignetteHtmlIndex(package, "./tmp2a.html", vig2_df)

#########



