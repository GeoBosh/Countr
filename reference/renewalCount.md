# Fit renewal count processes regression models

Fit renewal regression models for count data via maximum likelihood.

## Usage

``` r
renewalCount(
  formula,
  data,
  subset,
  na.action,
  weights,
  offset,
  dist = c("weibull", "weibullgam", "custom", "gamma", "gengamma"),
  anc = NULL,
  convPars = NULL,
  link = NULL,
  time = 1,
  control = renewal.control(...),
  customPars = NULL,
  seriesPars = NULL,
  weiMethod = NULL,
  computeHessian = TRUE,
  standardise = FALSE,
  standardise_scale = 1,
  model = TRUE,
  y = TRUE,
  x = FALSE,
  ...
)
```

## Arguments

- formula:

  a formula object. If it is a standard formula object, the left hand
  side specifies the response variable and the right hand sides
  specifies the regression equation for the first parameter of the
  conditional distribution. `formula` can also be used to specify the
  ancilliary regressions, using the operator \`\|\`, see section
  ‘Details’.

- data, subset, na.action, :

  arguments controlling formula processing via `model.frame`.

- weights:

  optional numeric vector of weights.

- offset:

  optional numeric vector with an a priori known component to be
  included in the linear predictor of the count model. Currently not
  used.

- dist:

  character, built-in distribution to be used as the inter-arrival time
  distribution or `"custom"` for a user defined distribution, see
  section ‘Details’. Currently the built-in distributions are
  `"weibull"`, `"weibullgam"`, `"gamma"`, `"gengamma"`
  (generalized-gamma) and `"burr"`.

- anc:

  a named list of formulas for ancillary regressions, if any, otherwise
  `NULL`. The formulas associated with the (exact) parameter names are
  used. The left-hand sides of the formulas in `anc` are ignored.

- convPars:

  a list of convolution parameters arguments with slots `nsteps`,
  `extrap` and `convMethod`, see `dCount_conv_bi`. If NULL, default
  parameters will be applied.

- link:

  named list of character strings specifying the name of the link
  functions to be used in the regression. If `NULL`, the canonical link
  function will be used, i.e, `log` if the parameter is supposed to be
  positive, identity otherwise.

- time:

  numeric, time at which the count is observed; default to unity (1).

- control:

  a list of control arguments specified via `renewal.control`.

- customPars:

  list, user inputs if `dist = "custom"`, see section ‘Details’.

- seriesPars:

  list, series expansion input parameters with slots `terms` (number of
  terms in the series expansion), `iter` (number of iteration in the
  accelerated series expansion algorithm) and `eps` (tolerance in the
  accelerated series expansion algorithm), Only used if
  `dist = "weibull"` and `weiMethod = c("series_mat", "series_acc")`.

- weiMethod:

  character, computation method to be used if `dist = "weibull"` or
  `"weibullgam"`, see `dWeibullCount` and `dWeibullgammaCount`.

- computeHessian:

  logical, should the hessian (and hence the covariance matrix) be
  computed numerically at the fitted values.

- standardise:

  logical, should the covariates be standardised using
  [`standardize::standardize()`](https://rdrr.io/pkg/standardize/man/standardize.html)
  function.

- standardise_scale:

  numeric the desired scale for the covariates; defaults to 1.

- model, y, x:

  logicals. If `TRUE` the corresponding components of the fit (model
  frame, response, model matrix) are returned.

- ...:

  arguments passed to `renewal.control` in the default setup.

## Value

An `S3` object of class `"renewal"`, which is a list with components
including:

- coefficients:

  values of the fitted coefficients.

- residuals:

  vector of weighted residuals \\\omega \* (observed - fitted)\\.

- fitted.values:

  vector of fitted means.

- optim:

  data.frame output of `optimx`.

- method:

  optimisation algorithm.

- control:

  the control arguments, passed to `optimx`.

- start:

  starting values, passed to `optimx`.

- weights:

  weights to apply, if any.

- n:

  number of observations (with weights \> 0).

- iterations:

  number of iterations in the optimisation algorithm.

- execTime:

  duration of the optimisation.

- loglik:

  log-likelihood of the fitted model.

- df.residual:

  residuals' degrees of freedom for the fitted model.

- vcoc:

  convariance matrix of all coefficients, computed numerically from the
  hessian at the fitted coefficients (if `computeHessian` is `TRUE`).

- dist:

  name of the inter-arrival distribution.

- link:

  list, inverse link function corresponding to each parameter in the
  inter-arrival distribution.

- converged:

  logical, did the optimisation algorithm converge?

- data:

  data used to fit the model.

- formula:

  the original formula.

- call:

  the original function call.

- anc:

  named list of formulas to model regression on ancillary parameters.

- score_fct:

  function to compute the vector of scores defined in Cameron and
  Trivedi (2013) , equation 2.94.

- convPars:

  convolution inputs used.

- customPars:

  named list, user passed distribution inputs, see section ‘Details’.

- time:

  observed window used, default is 1.0 (see inputs).

- model:

  the full model frame (if `model = TRUE`).

- y:

  the response count vector (if `y = TRUE`).

- x:

  the model matrix (if `x = TRUE`).

## Details

`renewal` re-uses design and functionality of the basic R tools for
fitting regression model (`lm`, `glm`) and is highly inspired by
`hurdle()` and `zeroinfl()` from package `pscl`. Package `Formula` is
used to handle formulas.

Argument `formula` is a `formula` object. In the simplest case its
left-hand side (lhs) designates the response variable and the right-hand
side the covariates for the first parameter of the distribution (as
reported by
[`getParNames`](https://geobosh.github.io/Countr/reference/getParNames.md).
In this case, covariates for the ancilliary parameters are specified
using argument `anc`.

The ancilliary regressions, can also be specified in argument `formula`
by adding them to the righ-hand side, separated by the operator ‘\|’.
For example `Y | shape ~ x + y | z` can be used in place of the pair
`Y ~ x + y` and `anc = list(shape = ~z)`. In most cases, the name of the
second parameter can be omitted, which for this example gives the
equivalent `Y ~ x + y | z`. The actual rule is that if the parameter is
missing from the left-hand side, it is inferred from the default
parameter list of the distribution.

As another convenience, if the parameters are to to have the same
covariates, it is not necessary to repeat the rhs. For example,
`Y | shape ~ x + y` is equivalent to `Y | shape ~ x + y | x + y`. Note
that this is applied only to parameters listed on the lhs, so
`Y ~ x + y` specifies covariates only for the response variable and not
any other parameters.

Distributions for inter-arrival times supported internally by this
package can be chosen by setting argument `"dist"` to a suitable
character string. Currently the built-in distributions are `"weibull"`,
`"weibullgam"`, `"gamma"`, `"gengamma"` (generalized-gamma) and
`"burr"`.

Users can also provide their own inter-arrival distribution. This is
done by setting argument `"dist"` to `"custom"`, specifying the initial
values and giving argument `customPars` as a list with the following
components:

- parNames:

  character, the names of the parameters of the distribution. The
  location parameter should be the first one.

- survivalFct:

  function object containing the survival function. It should have
  signature `function(t, distPars)` where `t` is the point where the
  survival function is evaluated and `distPars` is the list of the
  distribution parameters. It should return a double value.

- extrapolFct:

  function object computing the extrapolation values (numeric of
  length 2) from the value of the distribution parameters (in
  `distPars`). It should have signature `function(distPars)` and return
  a numeric vector of length 2. Only required if the extrapolation is
  set to `TRUE` in `convPars`.

Some checks are done to validate `customPars` but it is user's
responsibility to make sure the the functions have the appropriate
signatures.

**Note:** The Weibull-gamma distribution is an experimental version and
should be used with care! It is very sensitive to initial values and
there is no guarantee of convergence. It has also been reparameterized
in terms of \\(1/r, 1/\alpha, c)\\ instead of \\(r, \alpha, c)\\, where
\\r\\ and \\\alpha\\ are the shape and scale of the gamma distribution
and \\c\\ is the shape of the Weibull distribution.

**(2017-08-04(Georgi) experimental feature:** probability residuals in
component 'probResiduals'. I also added type 'prob' to the method for
residuals() to extract them.

probResiduals\[i\] is currently 1 - Prob(Y\[i\] given the covariates).
"one minus", so that values close to zero are "good". On its own this is
probably not very useful but when comparing two models, if one of them
has mostly smaller values than the other, there is some reason to claim
that the former is superior. For example (see below), gamModel \<
poisModel in 3:1

## References

Kharrat T, Boshnakov GN, McHale I, Baker R (2019). “Flexible Regression
Models for Count Data Based on Renewal Processes: The Countr Package.”
*Journal of Statistical Software*, **90**(13), 1–35.
[doi:10.18637/jss.v090.i13](https://doi.org/10.18637/jss.v090.i13) .

Cameron AC, Trivedi PK (2013). *Regression analysis of count data*,
volume 53. Cambridge university press.

## Examples

``` r
if (FALSE) { # \dontrun{
## may take some time to run depending on your CPU
data(football)
wei = renewalCount(formula = homeTeamGoals ~ 1,
                    data = football, dist = "weibull", weiMethod = "series_acc",
                    computeHessian = FALSE, control = renewal.control(trace = 0, 
                    method = "nlminb"))
} # }
```
