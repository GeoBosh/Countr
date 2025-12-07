# Fast Univariate Weibull Count Probability with gamma heterogeneity

Probability computations for the univariate Weibull-gamma count
processes. Several methods are provided. `dWeibullgammaCount` computes
probabilities.

`dWeibullgammaCount_loglik` computes the log-likelihood.

`evWeibullgammaCount` computes the expected value and variance.

## Usage

``` r
dWeibullgammaCount_acc(
  x,
  shape,
  r,
  alpha,
  time = 1,
  logFlag = FALSE,
  jmax = 100L,
  nmax = 300L,
  eps = 1e-10,
  printa = FALSE
)

dWeibullgammaCount(
  x,
  shape,
  shapeGam,
  scaleGam,
  Xcovar = NULL,
  beta = NULL,
  method = c("series_acc", "series_mat"),
  time = 1,
  log = FALSE,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10
)

dWeibullgammaCount_loglik(
  x,
  shape,
  shapeGam,
  scaleGam,
  Xcovar = NULL,
  beta = NULL,
  method = c("series_acc", "series_mat"),
  time = 1,
  na.rm = TRUE,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10,
  weights = NULL
)

evWeibullgammaCount(
  xmax,
  shape,
  shapeGam,
  scaleGam,
  Xcovar = NULL,
  beta = NULL,
  method = c("series_acc", "series_mat"),
  time = 1,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10
)
```

## Arguments

- x:

  integer (vector), the desired count values.

- shape:

  numeric (length 1), shape parameter of the Weibull count.

- r:

  numeric shape of the gamma distribution

- alpha:

  numeric rate of the gamma distribution

- time:

  double, length of the observation window (defaults to 1).

- logFlag:

  logical, if TRUE, the log of the probability will be returned.

- jmax:

  integer, number of terms used to approximate the (infinite) series.

- nmax:

  integer, an upper bound on the number of terms to be summed in the
  Euler-van Wijngaarden sum; default is 300 terms.

- eps:

  numeric, the desired accuracy to declare convergence.

- printa:

  logical, if `TRUE` print information about convergence.

- shapeGam, scaleGam:

  numeric shape and scale parameters of the gamma heterogeity function.

- Xcovar:

  matrix the regressor values. Should have the same number of rows as
  `length(x)`. If NULL, no regression will be considered.

- beta:

  numeric regression coefficients. If NULL, no regression will be
  considered.

- method:

  character one of the available methods. see section ‘Details’.

- log:

  logical, if TRUE, the log of the probability will be returned.

- series_terms:

  numeric number of terms in the series expansion.

- series_acc_niter:

  numeric number of iteration in the Euler-van Wijngaarden algorithm.

- series_acc_eps:

  numeric tolerance of convergence in the Euler-van Wijngaarden
  algorithm.

- na.rm:

  logical, if TRUE, `NA`'s (produced by taking the log of very small
  probabilities) will be replaced by the smallest allowed probaility;
  default = `TRUE`.

- weights:

  numeric, vector of weights to apply. If `NULL`, one will be applied.

- xmax:

  unsigned integer, maximum count to be used.

## Value

for `dWeibullgammaCount`, a vector of probabilities \\P(x(i)), i = 1,
\dots n\\ where `n = length(x)`.

for `dWeibullgammaCount_loglik`, double, log-likelihood of the count
process

for `evWeibullgammaCount`, a list with components `"ExpectedValue"` and
`"Variance"`.

## Details

The desired method can be specified by argument `method`, as follows:

- `"series_mat"`:

  series expansion using matrix techniques.

- `"series_acc"`:

  Euler-van Wijngaarden accelerated series expansion.

The arguments have sensible default values.
