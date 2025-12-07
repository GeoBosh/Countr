# Density and log-likelihood of the Bivariate Frank Copula Weibull Count model

Compute density and log-likelihood of the Bivariate Frank Copula Weibull
Count model.

## Usage

``` r
dBivariateWeibullCountFrankCopula(
  x,
  y,
  shapeX,
  scaleX,
  shapeY,
  scaleY,
  theta,
  method = c("series_acc", "conv_dePril"),
  time = 1,
  log = FALSE,
  conv_steps = 100,
  conv_extrap = TRUE,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10
)

dBivariateWeibullCountFrankCopula_loglik(
  x,
  y,
  shapeX,
  scaleX,
  shapeY,
  scaleY,
  theta,
  method = c("series_acc", "conv_dePril"),
  time = 1,
  na.rm = TRUE,
  conv_steps = 100,
  conv_extrap = TRUE,
  series_terms = 50,
  series_acc_niter = 300,
  series_acc_eps = 1e-10,
  weights = NULL
)
```

## Arguments

- x, y:

  numeric, the desired counts.

- shapeX, shapeY:

  numeric, shape parameters. Either length(x) or length(1).

- scaleX, scaleY:

  numeric, scale parameters (length(x)).

- theta:

  numeric, Frank copula parameter.

- method:

  character method to be used. Choices are `"series_acc"` (accelerated
  series expansion) or `"conv_dePril"` (convolution by dePril
  algorithm).

- time:

  numeric, length of the observation window (defaults to 1).

- log:

  TODO

- conv_steps:

  integer, number of steps to use in the computation of the integral.

- conv_extrap:

  logical, if `TRUE`, Richardson extrapolation will be applied to
  improve accuracy.

- series_terms:

  number of terms used in series expansion.

- series_acc_niter:

  number of iterations in the acceleration algorithm.

- series_acc_eps:

  double, tolerance to declare convergence in the acceleration
  algorithm.

- na.rm:

  logical, should `NA`s (obtained from log of small probabilities) be
  replaced with the smallest allowed probability?

- weights:

  numeric vector of weights to apply. If `NULL`, a vector of ones.

## Value

for `dBivariateWeibullCountFrankCopula`, a vector of the
(log-)probabilities.

for `dBivariateWeibullCountFrankCopula_loglik`, the log-likelihood of
the model, a number.

## Details

`dBivariateWeibullCountFrankCopula` computes the probabilities \\P(X(t)
= x(t), Y(t) = y(t))\\, where \\X(t),Y(t)\\ is a bivariate Weibull count
process in which the bivariate distribution is modelled by Frank
copulas.

## Examples

``` r
## first 10 cases from "estimationParams.RDS", rounded for presentation
gam_weiH <-  0.9530455
gam_weiA <-  1.010051
theta    <- -0.3703702
HG <- c(0, 0, 0, 2, 1, 0, 2, 0, 1, 2)
AG <- c(2, 2, 1, 1, 6, 1, 0, 2, 0, 1)
lambdaHome <- c(1.5, 1.0, 1.3, 1.8, 1.3, 1.2, 1.3, 1.0, 2.0, 1.4)
lambdaAway <- c(1.2, 2.4, 1.3, 0.7, 1.3, 1.4, 0.6, 1.6, 0.6, 1.3)

weiFrank0 <- dBivariateWeibullCountFrankCopula(
    HG, AG, gam_weiH, lambdaHome, gam_weiA, lambdaAway, theta,
    "series_acc", 1, TRUE)

weiFrank1 <- dBivariateWeibullCountFrankCopula(
    HG, AG, gam_weiH, lambdaHome, gam_weiA, lambdaAway, theta,
    "conv_dePril", 1, TRUE, conv_extrap = TRUE)


weights <- c(0.01355306, 0.01355306, 0.01355306, 0.01355306, 0.01355306,
             0.01355306, 0.01355306, 0.01355306, 0.01357825, 0.01357825)

weiFrank2 <- dBivariateWeibullCountFrankCopula_loglik(
    HG, AG, gam_weiH, lambdaHome, gam_weiA, lambdaAway, theta,
    "conv_dePril", 1, TRUE, conv_extrap = TRUE, weights = weights)

weiFrank3 <- dBivariateWeibullCountFrankCopula_loglik(
    HG, AG, gam_weiH, lambdaHome, gam_weiA, lambdaAway, theta,
    "series_acc", 1, TRUE, weights = weights)

cbind(weiFrank0, weiFrank1, weiFrank2, weiFrank3)
#>                            weiFrank2  weiFrank3
#>  [1,] -3.110436 -3.110436 -0.3893715 -0.3893715
#>  [2,] -2.319851 -2.319851 -0.3893715 -0.3893715
#>  [3,] -2.319555 -2.319555 -0.3893715 -0.3893715
#>  [4,] -2.384469 -2.384469 -0.3893715 -0.3893715
#>  [5,] -7.466125 -7.466124 -0.3893715 -0.3893715
#>  [6,] -2.237400 -2.237400 -0.3893715 -0.3893715
#>  [7,] -2.112886 -2.112886 -0.3893715 -0.3893715
#>  [8,] -2.387953 -2.387953 -0.3893715 -0.3893715
#>  [9,] -1.915774 -1.915774 -0.3893715 -0.3893715
#> [10,] -2.466820 -2.466820 -0.3893715 -0.3893715
## rdname dRenewalFrankCopula_user
```
