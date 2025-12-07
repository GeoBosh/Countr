# Compute count probabilities using simple convolution

Compute count probabilities using simple convolution (section 2) for the
built-in distributions

Compute count probabilities using simple convolution (section 2) for
user passed survival functions

## Usage

``` r
dCount_allProbs_bi(
  x,
  distPars,
  dist,
  nsteps = 100L,
  time = 1,
  extrap = TRUE,
  logFlag = FALSE
)

dCount_allProbs_user(
  x,
  distPars,
  extrapolPars,
  survR,
  nsteps = 100L,
  time = 1,
  extrap = TRUE,
  logFlag = FALSE
)
```

## Arguments

- x:

  integer (vector), the desired count values.

- distPars:

  `Rcpp::List` with distribution specific slots, see section ‘Details’.

- dist:

  character name of the built-in distribution, see section ‘Details’.

- nsteps:

  unsiged integer number of steps used to compute the integral.

- time:

  double time at wich to compute the probabilities. Set to 1 by default.

- extrap:

  logical if `TRUE`, Richardson extrapolation will be applied to improve
  accuracy.

- logFlag:

  logical if `TRUE` the log-probability will be returned.

- extrapolPars:

  ma::vec of length 2. The extrapolation values.

- survR:

  Rcpp::Function user passed survival function; should have the
  signature `function(t, distPars)` where `t` is a real number (\>0)
  where the survival function is evaluated and `distPars` is a list of
  distribution parameters. It should return a double value.

## Value

vector of probabilities P(x(i)) for i = 1, ..., n where n is `length` of
`x`.

## Details

The routine does convolutions to produce probabilities `probs(0)`, ...
`probs(xmax)` using `nsteps` steps, and refines result by Richardson
extrapolation if `extrap` is `TRUE` using the algorithm of section 2.
