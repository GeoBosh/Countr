# Probability calculations for Weibull count models

Probability computations for the univariate Weibull count process.
Several methods are provided. `dWeibullCount` computes probabilities.

`dWeibullCount_loglik` computes the log-likelihood.

`evWeibullCount` computes the expected value and variance.

## Usage

``` r
dWeibullCount(
  x,
  shape,
  scale,
  method = c("series_acc", "series_mat", "conv_direct", "conv_naive", "conv_dePril"),
  time = 1,
  log = FALSE,
  conv_steps = 100,
  conv_extrap = TRUE,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10
)

dWeibullCount_loglik(
  x,
  shape,
  scale,
  method = c("series_acc", "series_mat", "conv_direct", "conv_naive", "conv_dePril"),
  time = 1,
  na.rm = TRUE,
  conv_steps = 100,
  conv_extrap = TRUE,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10,
  weights = NULL
)

evWeibullCount(
  xmax,
  shape,
  scale,
  method = c("series_acc", "series_mat", "conv_direct", "conv_naive", "conv_dePril"),
  time = 1,
  conv_steps = 100,
  conv_extrap = TRUE,
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

- scale:

  numeric (length 1), scale parameter of the Weibull count.

- method:

  character, one of the available methods, see section ‘Details’.

- time:

  double, length of the observation window (defaults to 1).

- log:

  logical, if TRUE, the log of the probability will be returned.

- conv_steps:

  numeric, number of steps used for the extrapolation.

- conv_extrap:

  logical, should Richardson extrappolation be applied ?

- series_terms:

  numeric, number of terms in the series expansion.

- series_acc_niter:

  numeric, number of iterations in the Euler-van Wijngaarden algorithm.

- series_acc_eps:

  numeric, tolerance of convergence in the Euler-van Wijngaarden
  algorithm.

- na.rm:

  logical, if TRUE `NA`'s (produced by taking the log of very small
  probabilities) will be replaced by the smallest allowed probaility;
  default is `TRUE`.

- weights:

  numeric, vector of weights to apply. If `NULL`, a vector of one's will
  be applied.

- xmax:

  unsigned integer, maximum count to be used.

## Value

for `dWeibullCount`, a vector of probabilities \\P(x(i)), i = 1, \dots
n\\, where \\n =\\ `length(x)`.

for `dWeibullCount_loglik`, a double, the log-likelihood of the count
process.

for `evWeibullCount`, a list with components:

- ExpectedValue:

  expected value,

- Variance:

  variance.

## Details

Argument `method` can be used to specify the desired method, as follows:

- `"series_mat"`:

  \- series expansion using matrix techniques,

- `"series_acc"`:

  \- Euler-van Wijngaarden accelerated series expansion (default),

- `"conv_direc"t`:

  \- direct convolution method of section 2,

- `"conv_naive"`:

  \- naive convolurion described in section 3.1,

- `"conv_dePril"`:

  \- dePril convolution described in section 3.2.

The arguments have sensible default values.
