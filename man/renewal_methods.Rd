% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/renewal_methods.R
\name{renewal_methods}
\alias{renewal_methods}
\alias{coef.renewal}
\alias{vcov.renewal}
\alias{residuals.renewal}
\alias{residuals_plot.renewal}
\alias{fitted.renewal}
\alias{confint.renewal}
\alias{summary.renewal}
\alias{print.renewal}
\alias{print.summary.renewal}
\alias{model.matrix.renewal}
\alias{logLik.renewal}
\alias{nobs.renewal}
\alias{extractAIC.renewal}
\alias{addBootSampleObject.renewal}
\alias{df.residual.renewal}
\title{Methods for renewal objects}
\usage{
\method{coef}{renewal}(object, ...)

\method{vcov}{renewal}(object, ...)

\method{residuals}{renewal}(object, type = c("pearson", "response", "prob"), ...)

\method{residuals_plot}{renewal}(object, type = c("pearson", "response", "prob"), ...)

\method{fitted}{renewal}(object, ...)

\method{confint}{renewal}(
  object,
  parm,
  level = 0.95,
  type = c("asymptotic", "boot"),
  bootType = c("norm", "bca", "basic", "perc"),
  ...
)

\method{summary}{renewal}(object, ...)

\method{print}{renewal}(x, digits = max(3, getOption("digits") - 3), ...)

\method{print}{summary.renewal}(
  x,
  digits = max(3, getOption("digits") - 3),
  width = getOption("width"),
  ...
)

\method{model.matrix}{renewal}(object, ...)

\method{logLik}{renewal}(object, ...)

\method{nobs}{renewal}(object, ...)

\method{extractAIC}{renewal}(fit, scale, k = 2, ...)

\method{addBootSampleObject}{renewal}(object, ...)

\method{df.residual}{renewal}(object, ...)
}
\arguments{
\item{object}{an object from class \code{"renewal"}.}

\item{...}{further arguments for methods.}

\item{type, parm, level, bootType, x, digits}{see the corresponding generics and section
\sQuote{Details}.}

\item{width}{numeric width length.}

\item{fit, scale, k}{same as in the generic.}
}
\description{
Methods for renewal objects.

% extractAIC method for class renewal
}
\details{
Objects from class \code{"renewal"} represent fitted count renewal models and
are created by calls to \code{"renewalCount()"}. There are methods for this class
for many of the familiar functions for interacting with fitted models.

% param fit an object from class \code{renewal}
% param scale TODO
% param k TODO
% param ... not used
}
\examples{
fn <- system.file("extdata", "McShane_Wei_results_boot.RDS", package = "Countr")
object <- readRDS(fn)
class(object) # "renewal"

coef(object)
vcov(object)

## Pearson residuals: rescaled by sd
head(residuals(object, "pearson"))
## response residuals: not rescaled
head(residuals(object, "response"))

head(fitted(object))

## loglik, nobs, AIC, BIC
c(loglik = as.numeric(logLik(object)), nobs = nobs(object),
  AIC = AIC(object), BIC = BIC(object))

asym <- se.coef(object, , "asymptotic")
boot <- se.coef(object, , "boot")
cbind(asym, boot)
## CI for coefficients
asym <- confint(object, type = "asymptotic")
## Commenting out for now, see the nite in the code of confint.renewal():
## boot <- confint(object, type = "boot", bootType = "norm")
## list(asym = asym, boot = boot)
summary(object)
print(object)
## see renewal_methods
## see renewal_methods
}
