# Compute count probabilities using convolution

Compute count probabilities using one of several convolution methods.
`dCount_conv_bi` does the computations for the distributions with
builtin support in this package.

`dCount_conv_user` does the same using a user defined survival function.

## Usage

``` r
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
```

## Arguments

- x:

  integer (vector), the desired count values.

- distPars:

  `Rcpp::List` with distribution specific slots, see section ‘Details’.

- dist:

  character name of the built-in distribution, see section ‘Details’.

- method:

  character string, the method to use, see section ‘Details’.

- nsteps:

  unsiged integer, number of steps used to compute the integral.

- time:

  double, time at wich to compute the probabilities. Set to 1 by
  default.

- extrap:

  logical, if `TRUE`, Richardson extrapolation will be applied to
  improve accuracy.

- log:

  logical, if `TRUE` the log-probability will be returned.

- extrapolPars:

  vector of length 2, the extrapolation values.

- survR:

  function, user supplied survival function; should have signature
  `function(t, distPars)`, where `t` is a positive real number (the time
  where the survival function is evaluated) and `distPars` is a list of
  distribution parameters. It should return a double value.

## Value

vector of probabilities \\P(x(i),\\ i = 1, ..., n)\\ where \\n\\ is the
length of `x`.

## Details

`dCount_conv_bi` computes count probabilities using one of several
convolution methods for the distributions with builtin support in this
package.

The following convolution methods are implemented: "dePril", "direct",
and "naive".

The builtin distributions currently are Weibull, gamma, generalised
gamma and Burr.

## Examples

``` r
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
#> [1] 3.879293e-16
max((pmat_user - p0)^2 / p0)
#> [1] 4.753405e-15

## naive convolution approach
pmat_bi <- dCount_conv_bi(x, distPars, "weibull", "naive",
                          nsteps = 200)
pmat_user <- dCount_conv_user(x, distPars, c(1, 2), pwei_user, "naive",
                              nsteps = 200)
max((pmat_bi- p0)^2 / p0)
#> [1] 3.879293e-16
max((pmat_user- p0)^2 / p0)
#> [1] 4.753405e-15

## dePril conv approach
pmat_bi <- dCount_conv_bi(x, distPars, "weibull", "dePril",
                          nsteps = 200)
pmat_user <- dCount_conv_user(x, distPars, c(1, 2), pwei_user, "dePril",
                              nsteps = 200)
max((pmat_bi- p0)^2 / p0)
#> [1] 4.105397e-15
max((pmat_user- p0)^2 / p0)
#> [1] 4.753405e-15
```
