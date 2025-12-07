# Extract Standard Errors of Model Coefficients

Extract standard errors of model coefficients from objects returned by
count modeling functions.

## Usage

``` r
se.coef(object, parm, type, ...)

# S3 method for class 'renewal'
se.coef(object, parm, type = c("asymptotic", "boot"), ...)
```

## Arguments

- object:

  an object returned by one of the count modeling functions.

- parm:

  parameter's name or index.

- type:

  type of standard error: asymtotic normal standard errors
  (`"asymptotic"`) or bootsrap (`"boot"`).

- ...:

  further arguments for methods.

## Value

a named numeric vector

## Details

The method for class `"renewal"` extracts standard errors of model
coefficients from objects returned by `renewal`. When bootsrap standard
error are requested, the function checks for the bootsrap sample in
`object`. If it is not found, the bootsrap sample is created and a
warning is issued. Users can choose between asymtotic normal standard
errors (`asymptotic`) or bootsrap (`boot`).

## Examples

``` r
## see examples for renewal_methods
```
