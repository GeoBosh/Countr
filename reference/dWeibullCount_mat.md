# Univariate Weibull Count Probability

Univariate Weibull count probability computed using matrix techniques.

## Usage

``` r
dWeibullCount_mat(x, shape, scale, time = 1, logFlag = FALSE, jmax = 50L)

dWeibullCount_acc(
  x,
  shape,
  scale,
  time = 1,
  logFlag = FALSE,
  jmax = 50L,
  nmax = 300L,
  eps = 1e-10,
  printa = FALSE
)
```

## Arguments

- x:

  integer (vector), the desired count values.

- shape:

  numeric (length 1), shape parameter of the Weibull count.

- scale:

  numeric (length 1), scale parameter of the Weibull count.

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

## Value

a vector of probabilities for each component of the count vector `x`.

## Details

`dWeibullCount_mat` implements formulae (11) of *McShane(2008)* to
compute the required probabilities. For speed, the computations are
implemented in C++ and of matrix computations are used whenever
possible. This implementation is not efficient as it recomputes the
alpha matrix each time, which may slow down computation (among other
things).

`dWeibullCount_acc` achieves a vast (several orders of magnitude) speed
improvement over `pWeibullCountOrig`. We achieve this by using Euler-van
Wijngaarden techniques for accelerating the convergence of alternating
series and tabulation of the alpha terms available in a pre-computed
matrix (shipped with the package).

When computation time is an issue, we recommend the use of
`dWeibullCount_fast`. However, `pWeibullCountOrig` may be more accurate,
especially when `jmax` is large.
