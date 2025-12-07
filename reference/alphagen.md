# Matrix of alpha terms

Matrix of alpha terms used internally by the different Weibull count
functions.

## Usage

``` r
alphagen(cc, jrow, ncol)
```

## Arguments

- cc:

  numeric, shape parameter.

- jrow:

  numeric, number of rows of the alpha matrix. See formulae (11) in
  *McShane(2008)*.

- ncol:

  numeric, number of columns of the alpha matrix. Note that the first
  column corresponds to \\n=0\\, \\n\\ being the count value, see
  formulae (11) in *McShane(2008)*.

## Value

`jrow` x `ncol` (lower triangular) matrix of \\\alpha_j^n\\ terms
defined in *McShane(2008)*.

## Details

It is usually advisable to compute the alpha terms a minimum number of
times as it may be time consuming in general. Note that the alpha terms
only depend on the shape (c) parameter

## Examples

``` r
## alphagen(0.994, 6, 8)
```
