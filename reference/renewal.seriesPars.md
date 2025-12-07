# Creates the series expansion inputs setting

Check and creates the series expansion inputs list.

## Usage

``` r
renewal.seriesPars(seriesPars, long = FALSE)
```

## Arguments

- seriesPars:

  list series expansion input parameters with slots `terms` (number of
  terms in the series expansion), `iter` (number of iteration in the
  accelerated series expansion algorithm) and `eps` (tolerance in the
  accelerated series expansion algorithm), Only used if
  `dist = "weibull"` and `weiMethod = c("series_mat", "series_acc")`.

- long:

  TODO

## Value

list series expansion inputs.
