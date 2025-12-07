# Pearson Chi-Square test

Carry out Pearson Chi-Square test and compute the Pearson statistic.

## Usage

``` r
chiSq_pearson(object, ...)

# S3 method for class 'renewal'
chiSq_pearson(object, ...)

# S3 method for class 'glm'
chiSq_pearson(object, ...)
```

## Arguments

- object:

  an object from class `renewal`.

- ...:

  currently not used.

## Value

data.frame with 5 columns given the count values (`Counts`), observed
frequencies (`Actual`), model's prediction (`Predicted`), the difference
(`Diff`) and the contribution to the Pearson's statistic (`Pearson`).

## Details

The computation is inspired from Cameron(2013) Chapter 5.3.4. Observed
and fitted frequencies are computed and the contribution of every
observed cell to the Pearson's chi-square test statistic is reported.
The idea is to check if the fitted model has a tendancy to over or under
predict some ranges of data

## References

Cameron AC, Trivedi PK (2013). *Regression analysis of count data*,
volume 53. Cambridge university press.

## See also

[`chiSq_gof`](https://geobosh.github.io/Countr/reference/chiSq_gof.md)
