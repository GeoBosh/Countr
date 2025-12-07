# Creates the renewal control list

Creates the renewal control list used by `renewal`.

## Usage

``` r
renewal.control(
  method = "nlminb",
  maxit = 1000,
  trace = 1,
  start = NULL,
  kkt = FALSE,
  ...
)
```

## Arguments

- method:

  character, one or more of the optimization methods accepted by
  `optimx`. User can experiment with different algorithms and the
  results associated with the best performing one will be retained.

- maxit:

  numeric, the maximum number of iterations in the optimization routine.

- trace:

  Non-negative integer. Should tracing information be printed to the
  screen.

- start:

  (named) numeric, vector of starting values.

- kkt:

  locical should the Kuhn, Karush, Tucker optimality conditions be
  tested? Default is `FALSE` to avoid numerical hessian computation.

- ...:

  TODO

## Value

a list with the control parameters used by `renewal`

## Details

The function takes the user passed inputs, checks them (todo: actually,
it doesn't!) and returns an appropriate list that is used inside
`renewal` by the optimization routine, such as `optimx` among others.
