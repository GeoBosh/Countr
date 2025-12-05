\docType{package}
\name{Countr-package}
\alias{Countr-package}
\alias{Countr}
\title{Flexible Univariate Count Models Based on Renewal Processes}
\description{
Flexible univariate count models based on renewal
processes. The models may include covariates and can be specified
with familiar formula syntax as in glm() and 'flexsurv'.
}
\details{
The methodology is described by
\insertCiteOnly{CountrJssArticle;textual}{Countr}.  The paper is included in
the package as vignette \code{vignette('Countr_guide_paper', package = "Countr")}).

The main function is \code{\link{renewalCount}}, see its documentation for
examples.

Goodness of fit chi-square (likelihood ratio and Pearson) tests for glm and
count renewal models are implemented in \code{\link{chiSq_gof}} and
\code{\link{chiSq_pearson}}.
}
\references{
\insertRef{CountrJssArticle}{Countr}

\insertRef{baker2017event}{Countr}

\insertRef{boshnakov2017bivariate}{Countr}

\insertRef{cameron2013regression}{Countr}

\insertRef{TarakEtAl2018jss}{Countr}

\insertRef{mcshane2008count}{Countr}

\insertRef{winkelmann1995duration}{Countr}
}
\seealso{
Useful links:
\itemize{
  \item \url{https://geobosh.github.io/Countr/} (doc)
  \item \url{https://CRAN.R-project.org/package=Countr}
  \item Report bugs at \url{https://github.com/GeoBosh/Countr/issues}
}

}
\author{
\strong{Maintainer}: Georgi N. Boshnakov \email{georgi.boshnakov@manchester.ac.uk} (\href{https://orcid.org/0000-0003-2839-346X}{ORCID})

Authors:
\itemize{
  \item Tarak Kharrat \email{tarak@realanalytics.co.uk} (\href{https://orcid.org/0000-0001-9399-6174}{ORCID})

  \item Georgi N. Boshnakov \email{georgi.boshnakov@manchester.ac.uk} (\href{https://orcid.org/0000-0003-2839-346X}{ORCID})
}

}
