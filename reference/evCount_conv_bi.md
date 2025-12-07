# Expected value and variance of a renewal count process

Compute numerically expected values and variances of renewal count
processes.

## Usage

``` r
evCount_conv_bi(
  xmax,
  distPars,
  dist = c("weibull", "gamma", "gengamma", "burr"),
  method = c("dePril", "direct", "naive"),
  nsteps = 100,
  time = 1,
  extrap = TRUE
)

evCount_conv_user(
  xmax,
  distPars,
  extrapolPars,
  survR,
  method = c("dePril", "direct", "naive"),
  nsteps = 100,
  time = 1,
  extrap = TRUE
)
```

## Arguments

- xmax:

  unsigned integer maximum count to be used.

- distPars:

  TODO

- dist:

  TODO

- method:

  TODO

- nsteps:

  unsiged integer, number of steps used to compute the integral.

- time:

  double, time at wich to compute the probabilities. Set to 1 by
  default.

- extrap:

  logical, if `TRUE`, Richardson extrapolation will be applied to
  improve accuracy.

- extrapolPars:

  ma::vec of length 2. The extrapolation values.

- survR:

  function, user supplied survival function; should have signature
  `function(t, distPars)`, where `t` is a positive real number (the time
  where the survival function is evaluated) and `distPars` is a list of
  distribution parameters. It should return a double value.

## Value

a named list with components `ExpectedValue` and `Variance`

## Details

`evCount_conv_bi` computes the expected value and variance of renewal
count processes for the builtin distirbutions of inter-arrival times.

`evCount_conv_user` computes the expected value and variance for a user
specified distribution of the inter-arrival times.

## Examples

``` r
pwei_user <- function(tt, distP) {
    alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
    pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
             lower.tail = FALSE)
}

## ev convolution Poisson count
lambda <- 2.56
beta <- 1
distPars <- list(scale = lambda, shape = beta)

evbi <- evCount_conv_bi(20, distPars, dist = "weibull")
evu <- evCount_conv_user(20, distPars, c(2, 2), pwei_user, "dePril")

c(evbi[["ExpectedValue"]], lambda)
#> [1] 2.560001 2.560000
c(evu[["ExpectedValue"]], lambda )
#> [1] 2.560001 2.560000
c(evbi[["Variance"]], lambda     )
#> [1] 2.560003 2.560000
c(evu[["Variance"]], lambda      )
#> [1] 2.56 2.56

## ev convolution weibull count
lambda <- 2.56
beta <- 1.35
distPars <- list(scale = lambda, shape = beta)

evbi <- evCount_conv_bi(20, distPars, dist = "weibull")
evu <- evCount_conv_user(20, distPars, c(2.35, 2), pwei_user, "dePril")

x <- 1:20
px <- dCount_conv_bi(x, distPars, "weibull", "dePril",
                     nsteps = 100)
ev <- sum(x * px)
var <- sum(x^2 * px) - ev^2

c(evbi[["ExpectedValue"]], ev)
#> [1] 1.968046 1.968046
c(evu[["ExpectedValue"]], ev )
#> [1] 1.968046 1.968046
c(evbi[["Variance"]], var    )
#> [1] 1.348213 1.348213
c(evu[["Variance"]], var     )
#> [1] 1.348214 1.348213
```
