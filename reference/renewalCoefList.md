# Split a vector using the prefixes of the names for grouping

Split a vector using the prefixes of the names for grouping.

## Usage

``` r
renewalCoefList(coef)
```

## Arguments

- coef:

  a named vector

## Details

The names of the coefficients of renewal regression models are prefixed
with the names of the parameters to which they refer. This function
splits such vectors into a list with one component for each parameter.
For example, for a Weibull renewal regression model this will create a
list with components `"scale"` and `"shape"`.

This is a convenience function allowing users to manipulate the
coefficients related to a parameter more easily.
[`renewalCoef`](https://geobosh.github.io/Countr/reference/renewalCoef.md)
can convert this list back to a vector.

## See also

[`renewalNames`](https://geobosh.github.io/Countr/reference/renewalNames.md),
[`renewalCoef`](https://geobosh.github.io/Countr/reference/renewalCoef.md)
