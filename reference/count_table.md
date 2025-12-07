# Summary of a count variable

Summary of a count variable.

## Usage

``` r
count_table(count, breaks, formatChar = FALSE)
```

## Arguments

- count:

  integer, observed count value for every individual in the sample.

- breaks:

  integer, values at which the breaks should happen. The function will
  compute the observed frequency in `[breaks[i], breaks[i + 1])`.

- formatChar:

  logical, should the values be converted to character and formatted?

## Value

`matrix` with 2 rows and `length(breaks)` columns. The column names are
the cells names. The rows are the observed frequencies and relative
frequencies (probabilities).

## Details

The function does a similar job to
[`table()`](https://rdrr.io/r/base/table.html) with more flexibility
introduced by the argument `breaks`. The user can decide how to break
the count values and decide to merge some cells if needed.
