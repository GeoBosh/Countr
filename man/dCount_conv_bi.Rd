% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convCount_probs.R
\name{dCount_conv_bi}
\alias{dCount_conv_bi}
\alias{dCount_conv_user}
\title{Compute count probabilities using convolution}
\usage{
dCount_conv_bi(
  x,
  distPars,
  dist = c("weibull", "gamma", "gengamma", "burr"),
  method = c("dePril", "direct", "naive"),
  nsteps = 100,
  time = 1,
  extrap = TRUE,
  log = FALSE
)

dCount_conv_user(
  x,
  distPars,
  extrapolPars,
  survR,
  method = c("dePril", "direct", "naive"),
  nsteps = 100,
  time = 1,
  extrap = TRUE,
  log = FALSE
)
}
\arguments{
\item{x}{integer (vector), the desired count values.}

\item{distPars}{\code{Rcpp::List} with distribution specific slots,
see details.}

\item{dist}{character name of the built-in distribution, see details.}

\item{method}{character string, the method to use, see Details.}

\item{nsteps}{unsiged integer, number of steps used to compute the integral.}

\item{time}{double, time at wich to compute the probabilities. Set to 1 by
default.}

\item{extrap}{logical, if \code{TRUE}, Richardson extrapolation will be
applied to improve accuracy.}

\item{log}{logical, if \code{TRUE} the log-probability will be returned.}

\item{extrapolPars}{vector of length 2, the extrapolation values.}

\item{survR}{function, user supplied survival function; should have signature
\code{function(t, distPars)}, where \code{t} is a positive real number
(the time where the survival function is evaluated) and \code{distPars}
is a list of distribution parameters. It should return a double value.}
}
\value{
vector of probabilities \eqn{P(x(i),\ i = 1, ..., n)} where \eqn{n}
    is the length of \code{x}.
}
\description{
Compute count probabilities using one of several convolution methods.
\code{dCount_conv_bi} does the computations for the distributions with
builtin support in this package.

\code{dCount_conv_user} does the same using a user defined survival function.
}
\details{
\code{dCount_conv_bi} computes count probabilities using one of several
convolution methods for the distributions with builtin support in this
package.

The following convolution methods are implemented: "dePril", "direct", and
"naive".

The builtin distributions currently are Weibull, gamma, generalised gamma and
Burr.

% Compute count probabilities using one of the convolution methods for user %
% defined survival functions.
}
\examples{
x <- 0:10
lambda <- 2.56
p0 <- dpois(x, lambda)
ll <- sum(dpois(x, lambda, TRUE))

err <- 1e-6
## all-probs convolution approach
distPars <- list(scale = lambda, shape = 1)
pmat_bi <- dCount_conv_bi(x, distPars, "weibull", "direct",
                          nsteps = 200)

## user pwei
pwei_user <- function(tt, distP) {
    alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
    pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
             lower.tail = FALSE)
}

pmat_user <- dCount_conv_user(x, distPars, c(1, 2), pwei_user, "direct",
                              nsteps = 200)
max((pmat_bi - p0)^2 / p0)
max((pmat_user - p0)^2 / p0)

## naive convolution approach
pmat_bi <- dCount_conv_bi(x, distPars, "weibull", "naive",
                          nsteps = 200)
pmat_user <- dCount_conv_user(x, distPars, c(1, 2), pwei_user, "naive",
                              nsteps = 200)
max((pmat_bi- p0)^2 / p0)
max((pmat_user- p0)^2 / p0)

## dePril conv approach
pmat_bi <- dCount_conv_bi(x, distPars, "weibull", "dePril",
                          nsteps = 200)
pmat_user <- dCount_conv_user(x, distPars, c(1, 2), pwei_user, "dePril",
                              nsteps = 200)
max((pmat_bi- p0)^2 / p0)
max((pmat_user- p0)^2 / p0)

}
