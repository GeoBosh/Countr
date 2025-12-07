# Get named vector of coefficients for renewal objects

Get named vector of coefficients for renewal objects.

## Usage

``` r
renewalCoef(object, ...)
```

## Arguments

- object:

  an object, there are methods for several classes, see section
  ‘Details’.

- ...:

  further arguments to be passed to `renewalNames`, usually something
  like `target = "weibull"`.

## Details

This is a convenience function for constructing named vector of
coefficients for renewal count models. Such vectors are needed, for
example, for starting values in the model fitting procedures. The
simplest way to get a suitably named vector is to take the coefficients
of a fitted model but if the fitting procedure requires initial values,
this is seemingly a circular situation.

The overall idea is to take coefficients specified by `object` and
transform them to coefficients suitable for a renewal count model as
specified by the arguments `"..."`. The provided methods eliminate the
need for tedius manual preparation of such vectors and in the most
common cases allow the user to do this in a single line.

The default method extracts the coefficients of `object` using
`co <- coef(object)` (an error is raised if this fails). It prepares a
named numeric vector with names requested by the arguments in `"..."`
and assigns `co` to the first `length(co)` elements of the prepared
vector. The net effect is that the coefficients of a model can be
initialised from the coefficients of a nested model. For example a
Poisson regression model can be used to initialise a Weibull count
model. Of course the non-zero shape parameter(s) of the Weibull model
need to be set separately.

If `object` is from class `glm`, the method is identical to the default
method.

If object is from class
[`renewalCoefList`](https://geobosh.github.io/Countr/reference/renewalCoefList.md),
its elements are simply concatenated in one long vector.

## References

Kharrat T, Boshnakov GN, McHale I, Baker R (2019). “Flexible Regression
Models for Count Data Based on Renewal Processes: The Countr Package.”
*Journal of Statistical Software*, **90**(13), 1–35.
[doi:10.18637/jss.v090.i13](https://doi.org/10.18637/jss.v090.i13) .

## See also

[`renewalNames`](https://geobosh.github.io/Countr/reference/renewalNames.md)
