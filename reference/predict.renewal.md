# Predict method for renewal objects

Compute predictions from renewal objects.

## Usage

``` r
# S3 method for class 'renewal'
predict(
  object,
  newdata = NULL,
  type = c("response", "prob"),
  se.fit = FALSE,
  terms = NULL,
  na.action = na.pass,
  time = 1,
  ...
)
```

## Arguments

- object:

  Object of class inheriting from `"lm"`

- newdata:

  An optional data frame in which to look for variables with which to
  predict. If omitted, the fitted values are used.

- type:

  type of prediction. If equal to `"response"`, give the mean
  probability associated with the individual covariates. If `"prob"`,
  give the probability of the observed count.

- se.fit:

  A switch indicating if standard errors are required.

- terms:

  If `type = "terms"`, which terms (default is all terms), a
  [`character`](https://rdrr.io/r/base/character.html) vector.

- na.action:

  function determining what should be done with missing values in
  `newdata`. The default is to predict `NA`.

- time:

  TODO

- ...:

  further arguments passed to or from other methods.

## Examples

``` r
fn <- system.file("extdata", "McShane_Wei_results_boot.RDS", package = "Countr")
object <- readRDS(fn)
data <- object$data
## old data
predOld.response <- predict(object, type = "response", se.fit = TRUE)
predOld.prob <- predict(object, type = "prob", se.fit = TRUE)

## newData (extracted from old Data)
newData <- head(data)
predNew.response <- predict(object, newdata = newData,
                            type = "response", se.fit = TRUE)
predNew.prob <- predict(object, newdata = newData,
                        type = "prob", se.fit = TRUE)

cbind(head(predOld.response$values),
           head(predOld.response$se$scale),
           head(predOld.response$se$shape),
           predNew.response$values,
           predNew.response$se$scale,
           predNew.response$se$shape)
#>       [,1]     [,2]     [,3]     [,4]     [,5]     [,6]
#> 1 2.635956 1.077712 1.356622 1.143575 1.077712 1.356622
#> 2 2.626821 1.078592 1.356622 1.141981 1.078592 1.356622
#> 3 2.386165 1.076344 1.356622 1.098238 1.076344 1.356622
#> 4 2.132807 1.081540 1.356622 1.047548 1.081540 1.356622
#> 5 2.505642 1.075564 1.356622 1.120402 1.075564 1.356622
#> 6 2.630692 1.082185 1.356622 1.142656 1.082185 1.356622

cbind(head(predOld.prob$values),
      head(predOld.prob$se$scale),
      head(predOld.prob$se$shape),
      predNew.prob$values,
      predNew.prob$se$scale,
      predNew.prob$se$shape)
#>           [,1]     [,2]     [,3]         [,4]     [,5]     [,6]
#> 1 1.725238e-01 1.077712 1.356622 1.725238e-01 1.077712 1.356622
#> 2 4.097677e-03 1.078592 1.356622 4.097677e-03 1.078592 1.356622
#> 3 1.455299e-01 1.076344 1.356622 1.455299e-01 1.076344 1.356622
#> 4 1.079834e-05 1.081540 1.356622 1.079834e-05 1.081540 1.356622
#> 5 1.583053e-01 1.075564 1.356622 1.583053e-01 1.075564 1.356622
#> 6 1.719442e-01 1.082185 1.356622 1.719442e-01 1.082185 1.356622
```
