# Compute count probabilities based on modified renewal process (bi)

Compute count probabilities based on modified renewal process using
dePril algorithm. `dmodifiedCount_bi` does it for the builtin
distributions.

`dmodifiedCount_user` does the same for a user specified distribution.

## Usage

``` r
dmodifiedCount_bi(
  x,
  distPars,
  dist,
  distPars0,
  dist0,
  nsteps = 100L,
  time = 1,
  extrap = TRUE,
  cdfout = FALSE,
  logFlag = FALSE
)

dmodifiedCount_user(
  x,
  distPars,
  survR,
  distPars0,
  survR0,
  extrapolPars,
  nsteps = 100L,
  time = 1,
  extrap = TRUE,
  cdfout = FALSE,
  logFlag = FALSE
)
```

## Arguments

- x:

  integer (vector), the desired count values.

- distPars0, distPars:

  `Rcpp::List` with distribution specific slots for the first arrival
  and the rest of the process respectively.

- dist0, dist:

  character, name of the first and following survival distributions.

- nsteps:

  unsiged integer number of steps used to compute the integral.

- time:

  double time at wich to compute the probabilities. Set to 1 by default.

- extrap:

  logical if `TRUE`, Richardson extrapolation will be applied to improve
  accuracy.

- cdfout:

  TODO

- logFlag:

  logical if `TRUE` the log-probability will be returned.

- survR0, survR:

  user supplied survival function; should have signature
  `function(t, distPars)`, where `t` is a positive real number (the time
  at which the survival function is evaluated) and `distPars` is a list
  of distribution parameters. It should return a double value (first
  arrival and following arrivals respectively).

- extrapolPars:

  list of same length as `x`, where each slot is a vector of length 2
  (the extrapolation values to be used) corresponding to `x[i]`.

## Value

vector of probabilities P(x(i)) for i = 1, ..., n where n is the length
of `x`.

## Details

For the modified renewal process the first arrival is allowed to have a
different distribution from the time between subsequent arrivals. The
renewal assumption is kept.
