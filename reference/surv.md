# Wrapper to built-in survival functions

Wrapper to built-in survival functions

## Usage

``` r
surv(t, distPars, dist)
```

## Arguments

- t:

  double, time point where the survival is to be evaluated at.

- distPars:

  `Rcpp::List` with distribution specific slots, see section ‘Details’.

- dist:

  character name of the built-in distribution, see section ‘Details’.

## Value

a double, giving the value of the survival function at time point `t` at
the parameters' values.

## Details

The function wraps all builtin-survival distributions. User can choose
between the `weibull`, `gamma`, `gengamma`(generalized gamma) and `burr`
(Burr type XII distribution). It is the user responsibility to pass the
appropriate list of parameters as follows:

- weibull:

  `scale` (the scale) and `shape` (the shape) parameters.

- burr:

  `scale` (the scale) and `shape1` (the shape1) and `shape2` (the
  shape2) parameters.

- gamma:

  `scale` (the scale) and `shape` (the shape) parameter.

- gengamma:

  `mu` (location), `sigma` (scale) and `Q` (shape) parameters.

## Examples

``` r
tt <- 2.5
## weibull

distP <- list(scale = 1.2, shape = 1.16)
alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
                      lower.tail = FALSE)
#> [1] 0.03100227
surv(tt, distP, "weibull") ## (almost) same
#> [1] 0.03100227

## gamma
distP <- list(shape = 0.5, rate = 1.0 / 0.7)
pgamma(q = tt, rate = distP[["rate"]], shape = distP[["shape"]],
                    lower.tail = FALSE)
#> [1] 0.007526315
surv(tt, distP, "gamma")  ## (almost) same
#> [1] 0.007526315

## generalized gamma
distP <- list(mu = 0.5, sigma = 0.7, Q = 0.7)
flexsurv::pgengamma(q = tt, mu = distP[["mu"]],
                    sigma = distP[["sigma"]],
                    Q = distP[["Q"]],
                    lower.tail = FALSE)
#> [1] 0.1932044
surv(tt, distP, "gengamma")  ## (almost) same
#> [1] 0.002252019
```
