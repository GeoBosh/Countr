# Log-likelihood of a count probability computed by convolution (bi)

Compute the log-likelihood of a count model using convolution methods to
compute the probabilities. `dCount_conv_loglik_bi` is for the builtin
distributions. `dCount_conv_loglik_user` is for user defined survival
functions.

## Usage

``` r
dCount_conv_loglik_bi(
  x,
  distPars,
  dist = c("weibull", "gamma", "gengamma", "burr"),
  method = c("dePril", "direct", "naive"),
  nsteps = 100,
  time = 1,
  extrap = TRUE,
  na.rm = TRUE,
  weights = NULL
)

dCount_conv_loglik_user(
  x,
  distPars,
  extrapolPars,
  survR,
  method = c("dePril", "direct", "naive"),
  nsteps = 100,
  time = 1,
  extrap = TRUE,
  na.rm = TRUE,
  weights = NULL
)
```

## Arguments

- x:

  integer (vector), the desired count values.

- distPars:

  list of the same length as x with each slot being itself a named list
  containing the distribution parameters corresponding to `x[i]`.

- dist:

  character name of the built-in distribution, see section ‘Details’.

- method:

  character, convolution method to be used; choices are `"dePril"`
  (section 3.2), `"direct"` (section 2) or `"naive"` (section 3.1).

- nsteps:

  unsiged integer number of steps used to compute the integral.

- time:

  double time at wich to compute the probabilities. Set to 1 by default.

- extrap:

  logical if `TRUE`, Richardson extrapolation will be applied to improve
  accuracy.

- na.rm:

  logical, if TRUE, `NA`s (produced by taking the log of very small
  probabilities) will be replaced by the smallest allowed probability;
  default is `TRUE`.

- weights:

  numeric, vector of weights to apply. If `NULL`, a vector of ones.

- extrapolPars:

  list of same length as x where each slot is a vector of length 2 (the
  extrapolation values to be used) corresponding to `x[i]`.

- survR:

  a user defined survival function; should have the signature
  `function(t, distPars)` where `t` is a real number (\>0) where the
  survival function is evaluated and `distPars` is a list of
  distribution parameters. It should return a double value.

## Value

numeric, the log-likelihood of the count process

## Examples

``` r
x <- 0:10
lambda <- 2.56
distPars <- list(scale = lambda, shape = 1)
distParsList <- lapply(seq(along = x), function(ind) distPars)
extrapolParsList <- lapply(seq(along = x), function(ind) c(2, 1))
## user pwei
pwei_user <- function(tt, distP) {
    alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
    pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
             lower.tail = FALSE)
}

## log-likehood allProbs Poisson
dCount_conv_loglik_bi(x, distParsList,
                      "weibull", "direct", nsteps = 400)
#> [1] -40.52531

dCount_conv_loglik_user(x, distParsList, extrapolParsList,
                        pwei_user, "direct", nsteps = 400)
#> [1] -40.52531

## log-likehood naive Poisson
dCount_conv_loglik_bi(x, distParsList,
                      "weibull", "naive", nsteps = 400)
#> [1] -40.52531

dCount_conv_loglik_user(x, distParsList, extrapolParsList,
                        pwei_user, "naive", nsteps = 400)
#> [1] -40.52531

## log-likehood dePril Poisson
dCount_conv_loglik_bi(x, distParsList,
                      "weibull", "dePril", nsteps = 400)
#> [1] -40.52531

dCount_conv_loglik_user(x, distParsList, extrapolParsList,
                        pwei_user, "dePril", nsteps = 400)
#> [1] -40.52531
## see dCount_conv_loglik_bi()
```
