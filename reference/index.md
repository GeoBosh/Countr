# Package index

## Countr overview

- [`Countr-package`](https://geobosh.github.io/Countr/reference/Countr-package.md)
  [`Countr`](https://geobosh.github.io/Countr/reference/Countr-package.md)
  : Flexible Univariate Count Models Based on Renewal Processes

## Main function

Fit renewal regression models for count data.

- [`renewalCount()`](https://geobosh.github.io/Countr/reference/renewalCount.md)
  : Fit renewal count processes regression models

## Supporting functions for renewalCount()

Supporting functions for objects fitted with renewalCount().

- [`getParNames()`](https://geobosh.github.io/Countr/reference/getParNames.md)
  : Return the names of distribution parameters
- [`renewalCoef()`](https://geobosh.github.io/Countr/reference/renewalCoef.md)
  : Get named vector of coefficients for renewal objects
- [`renewalCoefList()`](https://geobosh.github.io/Countr/reference/renewalCoefList.md)
  : Split a vector using the prefixes of the names for grouping
- [`renewalNames()`](https://geobosh.github.io/Countr/reference/renewalNames.md)
  : Get names of parameters of renewal regression models
- [`surv()`](https://geobosh.github.io/Countr/reference/surv.md) :
  Wrapper to built-in survival functions

## Methods for fitted renewal models

- [`coef(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`vcov(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`residuals(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`residuals_plot(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`fitted(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`confint(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`summary(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`print(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`print(`*`<summary.renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`model.matrix(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`logLik(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`nobs(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`extractAIC(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`addBootSampleObject(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  [`df.residual(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/renewal_methods.md)
  : Methods for renewal objects
- [`se.coef()`](https://geobosh.github.io/Countr/reference/se.coef.md) :
  Extract Standard Errors of Model Coefficients
- [`predict(`*`<renewal>`*`)`](https://geobosh.github.io/Countr/reference/predict.renewal.md)
  : Predict method for renewal objects

## Datasets

- [`fertility`](https://geobosh.github.io/Countr/reference/fertility.md)
  : Fertility data
- [`football`](https://geobosh.github.io/Countr/reference/football.md) :
  Football data

## Probability distributions

- [`dCount_conv_bi()`](https://geobosh.github.io/Countr/reference/dCount_conv_bi.md)
  [`dCount_conv_user()`](https://geobosh.github.io/Countr/reference/dCount_conv_bi.md)
  : Compute count probabilities using convolution
- [`dCount_conv_loglik_bi()`](https://geobosh.github.io/Countr/reference/dCount_conv_loglik_bi.md)
  [`dCount_conv_loglik_user()`](https://geobosh.github.io/Countr/reference/dCount_conv_loglik_bi.md)
  : Log-likelihood of a count probability computed by convolution (bi)
- [`dmodifiedCount_bi()`](https://geobosh.github.io/Countr/reference/dmodifiedCount_bi.md)
  [`dmodifiedCount_user()`](https://geobosh.github.io/Countr/reference/dmodifiedCount_bi.md)
  : Compute count probabilities based on modified renewal process (bi)
- [`dWeibullCount()`](https://geobosh.github.io/Countr/reference/dWeibullCount.md)
  [`dWeibullCount_loglik()`](https://geobosh.github.io/Countr/reference/dWeibullCount.md)
  [`evWeibullCount()`](https://geobosh.github.io/Countr/reference/dWeibullCount.md)
  : Probability calculations for Weibull count models
- [`dWeibullgammaCount_mat_Covariates()`](https://geobosh.github.io/Countr/reference/dWeibullgammaCount_mat_Covariates.md)
  : Univariate Weibull Count Probability with gamma and covariate
  heterogeneity
- [`evCount_conv_bi()`](https://geobosh.github.io/Countr/reference/evCount_conv_bi.md)
  [`evCount_conv_user()`](https://geobosh.github.io/Countr/reference/evCount_conv_bi.md)
  : Expected value and variance of a renewal count process
- [`dBivariateWeibullCountFrankCopula()`](https://geobosh.github.io/Countr/reference/dBivariateWeibullCountFrankCopula.md)
  [`dBivariateWeibullCountFrankCopula_loglik()`](https://geobosh.github.io/Countr/reference/dBivariateWeibullCountFrankCopula.md)
  : Density and log-likelihood of the Bivariate Frank Copula Weibull
  Count model
- [`dRenewalFrankCopula_user()`](https://geobosh.github.io/Countr/reference/dRenewalFrankCopula_user.md)
  [`dRenewalFrankCopula_bi()`](https://geobosh.github.io/Countr/reference/dRenewalFrankCopula_user.md)
  : Bivariate Count probability Using Frank copula (user)

## Other

- [`addBootSampleObject()`](https://geobosh.github.io/Countr/reference/addBootSampleObject.md)
  : Create a bootsrap sample for coefficient estimates
- [`chiSq_gof()`](https://geobosh.github.io/Countr/reference/chiSq_gof.md)
  : Formal Chi-square goodness-of-fit test
- [`chiSq_pearson()`](https://geobosh.github.io/Countr/reference/chiSq_pearson.md)
  : Pearson Chi-Square test
- [`compareToGLM()`](https://geobosh.github.io/Countr/reference/compareToGLM.md)
  : Compare renewals fit to glm models fit
- [`CountrFormula()`](https://geobosh.github.io/Countr/reference/CountrFormula.md)
  : Create a formula for renewalCount
- [`count_table()`](https://geobosh.github.io/Countr/reference/count_table.md)
  : Summary of a count variable
- [`frequency_plot()`](https://geobosh.github.io/Countr/reference/frequency_plot.md)
  : Plot a frequency chart
- [`residuals_plot()`](https://geobosh.github.io/Countr/reference/residuals_plot.md)
  : Method to visualise the residuals
