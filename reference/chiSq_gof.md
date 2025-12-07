# Formal Chi-square goodness-of-fit test

Carry out the formal chi-square goodness-of-fit test described by
Cameron (2013).

## Usage

``` r
chiSq_gof(object, breaks, ...)

# S3 method for class 'renewal'
chiSq_gof(object, breaks, ...)

# S3 method for class 'negbin'
chiSq_gof(object, breaks, ...)

# S3 method for class 'glm'
chiSq_gof(object, breaks, ...)
```

## Arguments

- object:

  an object from class `renewal`.

- breaks:

  integer values at which the breaks shoudl happen. The function will
  compute the observed frequencies in the intervals
  `[breaks[i], breaks[i + 1])`.

- ...:

  currently not used.

## Value

data.frame

## Details

The test is a conditional moment test described in details in Cameron
(2013, Section 5.3.4). We compute the asymptotically equivalent outer
product of the gradient version which is justified for renewal models
(fully parametric + parameters based on MLE).

## References

Cameron AC, Trivedi PK (2013). *Regression analysis of count data*,
volume 53. Cambridge university press.

## See also

[`chiSq_pearson`](https://geobosh.github.io/Countr/reference/chiSq_pearson.md)
