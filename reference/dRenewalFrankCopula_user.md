# Bivariate Count probability Using Frank copula (user)

Bivariate Count probability Using Frank copula to model dependence using
user passed survival objects

Bivariate Count probability Using Frank copula to model dependence using
built-in distributions

## Usage

``` r
dRenewalFrankCopula_user(
  x,
  y,
  survX,
  survY,
  distParsX,
  distParsY,
  extrapolParsX,
  extrapolParsY,
  theta,
  time = 1,
  logFlag = FALSE,
  nsteps = 100L,
  extrap = TRUE
)

dRenewalFrankCopula_bi(
  x,
  y,
  distX,
  distY,
  distParsX,
  distParsY,
  theta,
  time = 1,
  logFlag = FALSE,
  nsteps = 100L,
  extrap = TRUE
)
```

## Arguments

- x, y:

  numeric vector the desired counts.

- survX, survY:

  R functions: the survival functions.

- distParsX, distParsY:

  List of Lists. Each slot is a named vector of distribution parameters.

- extrapolParsX, extrapolParsY:

  list vec of length 2 values of the Richardson extrapolation parameters
  for the inputted distribution.

- theta:

  double Frank copula parameter.

- time:

  double time at wich to compute the probabilities. Set to 1 by default.

- logFlag:

  TODO

- nsteps:

  unsiged integer number of steps used to compute the integral.

- extrap:

  logical if `TRUE`, Richardson extrapolation will be applied to improve
  accuracy. TODO: (this is for arg. method, maybe!) param dePrilConv
  logical if `TRUE` the dePril method will be applied to compute
  convolution. Otherwise, the binary decomposition of section 3 will be
  used.

- distX, distY:

  character name of the survival distribution.

## Value

(log) probability of the bivariate count \\P(X(t) = x_i, Y(t) = y_i)\\
where x_i and y_i are the ith component of the X and Y respectively.

(log) probability of the bivariate count \\P(X(t) = x_i, Y(t) = y_i)\\
where x_i and y_i are the ith component of the X and Y respectively.

## Details

We use Frank copula to model depepndence between 2 renewal count
processes obtained from user passed inter-arrival distribution defined
by `survPtr`, `distPars` and `extrapolPars`.
