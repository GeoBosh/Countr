# Get names of parameters of renewal regression models

Get names of parameters of renewal regression models

## Usage

``` r
renewalNames(object, ...)
```

## Arguments

- object:

  an object.

- ...:

  further arguments.

## Details

`renewalNames` gives the a character vector of names of parameters for
renewal regression models. There are two main use scenarios:
`renewalNames(object, target = "dist")` and `renewalNames(object,...)`.
In the first scenario `target` can be a count distribution, such as
"weibull" or a parameter name, such as shape. In this case
`renewalNames` transforms coefficient names of `object` to those
specified by `target`. In the second cenario the argument list is the
same that would be used to call `renewalCount`. In this case
`renewalNames` returns the names that would be used by renewalCount for
the coefficients of the fitted model.

## See also

[`renewalCoefList`](https://geobosh.github.io/Countr/reference/renewalCoefList.md),
[`renewalCoef`](https://geobosh.github.io/Countr/reference/renewalCoef.md)
