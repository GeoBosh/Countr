# Flexible Univariate Count Models Based on Renewal Processes

Flexible univariate count models based on renewal processes. The models
may include covariates and can be specified with familiar formula syntax
as in glm() and 'flexsurv'.

## Details

The methodology is described by Kharrat et al. (2019) . The paper is
included in the package as vignette
`vignette('Countr_guide_paper', package = "Countr")`).

The main function is
[`renewalCount`](https://geobosh.github.io/Countr/reference/renewalCount.md),
see its documentation for examples.

Goodness of fit chi-square (likelihood ratio and Pearson) tests for glm
and count renewal models are implemented in
[`chiSq_gof`](https://geobosh.github.io/Countr/reference/chiSq_gof.md)
and
[`chiSq_pearson`](https://geobosh.github.io/Countr/reference/chiSq_pearson.md).

## References

Kharrat T, Boshnakov GN, McHale I, Baker R (2019). “Flexible Regression
Models for Count Data Based on Renewal Processes: The Countr Package.”
*Journal of Statistical Software*, **90**(13), 1–35.
[doi:10.18637/jss.v090.i13](https://doi.org/10.18637/jss.v090.i13) .

Baker R, Kharrat T (2017). “Event count distributions from renewal
processes: fast computation of probabilities.” *IMA Journal of
Management Mathematics*, **29**(4), 415-433. ISSN 1471-6798,
[doi:10.1093/imaman/dpx008](https://doi.org/10.1093/imaman/dpx008) ,
https://academic.oup.com/imaman/article-pdf/29/4/415/25693854/dpx008.pdf.

Boshnakov G, Kharrat T, McHale IG (2017). “A bivariate Weibull count
model for forecasting association football scores.” *International
Journal of Forecasting*, **33**(2), 458–466.

Cameron AC, Trivedi PK (2013). *Regression analysis of count data*,
volume 53. Cambridge university press.

Kharrat T, Boshnakov GN, McHale IG, Baker R (2018). “Flexible regression
models for count data based on renewal processes: the Countr package.”
*Journal of Statistical Software (to appear)*.

McShane B, Adrian M, Bradlow ET, Fader PS (2008). “Count models based on
Weibull interarrival times.” *Journal of Business & Economic
Statistics*, **26**(3), 369–378.

Winkelmann R (1995). “Duration dependence and dispersion in count-data
models.” *Journal of Business & Economic Statistics*, **13**(4),
467–474.

## See also

Useful links:

- <https://geobosh.github.io/Countr/> (doc)

- <https://CRAN.R-project.org/package=Countr>

- Report bugs at <https://github.com/GeoBosh/Countr/issues>

## Author

**Maintainer**: Georgi N. Boshnakov <georgi.boshnakov@manchester.ac.uk>
([ORCID](https://orcid.org/0000-0003-2839-346X))

Authors:

- Tarak Kharrat <tarak@realanalytics.co.uk>
  ([ORCID](https://orcid.org/0000-0001-9399-6174))

- Georgi N. Boshnakov <georgi.boshnakov@manchester.ac.uk>
  ([ORCID](https://orcid.org/0000-0003-2839-346X))
