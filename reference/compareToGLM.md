# Compare renewals fit to glm models fit

Compare renewals fit to glm models fit on the same data.

## Usage

``` r
compareToGLM(poisson_model, breaks, nbinom_model, ...)
```

## Arguments

- poisson_model:

  fitted Poisson glm model

- breaks:

  integer values at which the breaks should happen. The function will
  compute the observed frequencies in the intervals
  `[breaks[i], breaks[i + 1])`.

- nbinom_model:

  fitted negative binomial (fitted using
  [`MASS::glm.nb()`](https://rdrr.io/pkg/MASS/man/glm.nb.html)). This
  argument is optional.

- ...:

  renewal models to be considered.

## Value

data.frame with columns `Counts`, `Actual` (observed probability) and
then 2 columns per model passed (predicted probability and pearson
statistic) for the associated count value.

## Details

This function computes a data.frame similar to Table 5.6 in
Cameron(2013), using the observed frequencies and predictions from
different models. Supported models accepted are Poisson and negative
binomial (fitted using
[`MASS::glm.nb()`](https://rdrr.io/pkg/MASS/man/glm.nb.html)) from the
glm family and any model from the renewal family (passed in `...`).

## References

Cameron AC, Trivedi PK (2013). *Regression analysis of count data*,
volume 53. Cambridge university press.
