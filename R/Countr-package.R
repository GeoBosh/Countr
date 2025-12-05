#' @name Countr-package
#' @aliases  Countr-package Countr
#'
#' @title
#' Flexible Univariate Count Models Based on Renewal Processes
#'
#' @description
#' Flexible univariate count models based on renewal
#' processes. The models may include covariates and can be specified
#' with familiar formula syntax as in glm() and 'flexsurv'.
#'
#' @useDynLib Countr
#'
#' @import Matrix Rcpp Formula flexsurv
#' 
#' @importFrom stats nobs AIC  coef  confint  confint.default
#' @importFrom stats formula as.formula getCall  glm.fit  logLik  model.frame
#' @importFrom stats model.matrix  model.response  model.weights
#' @importFrom stats na.pass  pnorm  poisson  printCoefmat  quantile
#' @importFrom stats dnbinom dpois lm pchisq
#' @importFrom stats residuals update.formula  vcov
#' @importFrom stats density predict qqline qqnorm terms.formula
#' @importFrom stats family
#' 
#' @importFrom graphics par plot
#' @importFrom utils capture.output
#'
#' @importFrom standardize standardize
#' @importFrom dplyr left_join contains groups
#' @importFrom Rdpack reprompt
#'
#' @importFrom car Boot
#' 
#' @details
#'
#' The methodology is described by
#' \insertCiteOnly{CountrJssArticle;textual}{Countr}.  The paper is included in
#' the package as vignette \code{vignette('Countr_guide_paper', package = "Countr")}).
#'
#' The main function is \code{\link{renewalCount}}, see its documentation for
#' examples.
#'
#' Goodness of fit chi-square (likelihood ratio and Pearson) tests for glm and
#' count renewal models are implemented in \code{\link{chiSq_gof}} and
#' \code{\link{chiSq_pearson}}.
#'
#' @references
#'
#' \insertRef{CountrJssArticle}{Countr}
#' 
#' \insertRef{baker2017event}{Countr}
#'
#' \insertRef{boshnakov2017bivariate}{Countr}
#'
#' \insertRef{cameron2013regression}{Countr}
#'
#' \insertRef{TarakEtAl2018jss}{Countr}
#'
#' \insertRef{mcshane2008count}{Countr}
#'
#' \insertRef{winkelmann1995duration}{Countr}
#'
"_PACKAGE"

## To stop the respective NOTE from R CMD check
utils::globalVariables(
    c("Counts", "Actual" # see compareToGLM()
      )
)
## (jan 2023) *TODO*: maybe "groups" should be added to utils::globalVariables
## (and not imported from 'dplyr', see the call
##     lattice::barchart(preds ~ count_range, data = df, groups = groups, ...
## in frequency_plot().
## Rcheck doesn't complain about undefined variable 'groups' since there is a
## function groups() in 'dplyr'. However, at first sight at least, it seems that
## in 'group = groups' the right-hand side is the name of the column in the data
## frame as symbol. When checking, note that the above call invokes the formula
## method of lattice::barchart and see also the panel function
## lattice::panel.barchart()
