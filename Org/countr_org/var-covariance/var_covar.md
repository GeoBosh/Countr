<div class="abstract">
Computing standard errors and confidence intervals for estimated parameters is a
common task in regression analysis. These quantities allow the analyst to
quantify the certainty (*confidence*) associated with the obtained estimates. In
`Countr` two different approaches have been implemented to do this job. First, using
asymptotic MLE (Maximum Likelihood Estimator) theory, numeric computation of the
inverse Hessian matrix can be used as a consistent estimator of the
variance-covariance matrix, which in turn can be used to derive standard errors
and confidence intervals. The second option available in `Countr` is to use
bootsrap \citep{efron1979bootstrap}. In this document, we give the user an
overview of how to do to the computation in `Countr`.

</div>

Before starting our analysis, we need to load the useful packages. On top of
`Countr`, the `dplyr` package \citep{dplyr2016} will be used:

    library(Countr)
    library(dplyr)


# Maximum Likelihood estimator (MLE)


## Theory

Let \(f(y, \mathbf{x}, \bm{\theta})\) be the probability density function of the
renewal-count model, where \(y\) is the count variable, \(\mathbf{x}\) the vector of
covariate values and \(\bm{\theta}\) the vector of associated coefficients to be
estimated (\(q \times 1\) vector). Define the log-likelihood \(\mathcal{L} =
\sum_{i=1}^{n} ln f(y_i|\mathbf{x}_i, \bm{\theta}_i)\). Under regularity
conditions (see for example \citet[Section 2.3]{cameron2013regression}), the MLE
\(\bm{\hat{\theta}}\) is the solution of the first-order conditions,

\begin{equation}      
     \frac{\partial \mathcal{L}}{\partial \bm{\theta}} = \sum_{i=1}^{n} \frac{\partial lm f_i}{\partial \bm{\theta}} = 0 
     ,
\end{equation}        

where \(f_i = f(y_i|\mathbf{x}_i, \bm{\theta}_i)\) and \(\frac{\partial
\mathcal{L}}{\partial \bm{\theta}}\) is a \(q \times 1\) vector.

Let \(\bm{\theta}_0\) be the *true* value of \(\bm{\theta}\). Using MLE theory and
assuming regularity conditions, we obtain \(\bm{\hat{\theta}} \xrightarrow{p}
\bm{\theta}_0\) and

\begin{equation}      
     \sqrt{n}(\bm{\hat{\theta}}_{ML} - \bm{\theta}_0) \xrightarrow{d} \mathcal{N}[\mathbf{0}, \mathbf{V}^{-1}] 
     ,
\end{equation}

where the \(q \times q\) matrix \(\mathbf{V}\) matrix is defined as

\begin{equation}      
     \mathbf{V} = - \lim_{n \rightarrow \infty} \frac{1}{n} \mathop{\mathbb{E}} 
     \bigg[ \sum_{i=1}^n \frac{\partial^2 \ln f_i }{\partial \bm{\theta} \partial \bm{\theta}'}|_{\bm{\theta}_0} 
     \bigg]
     .
\end{equation}

To use this result, we need a consistent estimator of the variance matrix
\(\mathbf{V}\). Many options are available: the one implemented in `Countr` is
known as the *Hessian estimator* and simply evaluates Equation [3](#orgb853824) at
\(\bm{\hat{\theta}}\) without taking expectation.


## Implementation in `Countr`

The easiest way to compute the variance-covariance matrix when fitting a
renewal-count model with `Countr` is to set the argument `computeHessian` to
`TRUE` when calling the fitting routine `renewalCount()`. Note that this is the
default behaviour and it will save the matrix in the returned object (slot
`vcov`). Following standard practice in `R`, the matrix can be extracted or
recomputed using the `vcov()` method. We show here an example with the
fertility data.

    data(fertility)
    form <- children ~ german + years_school + voc_train + university + Religion +
    year_birth + rural + age_marriage
    gam <- renewalCount(formula = form, data = fertility, dist = "gamma",
                        computeHessian = TRUE, 
                        control = renewal.control(trace = 0, method = "nlminb")
                        )
    v1 <- gam$vcov
    v2 <- vcov(gam)
    
    all(v1 == v2)

    [1] TRUE

The above `vcov()` method simply extracts the variance-covariance matrix if it
has been computed at fitted. Otherwise, the function will re-compute it. The
user can choose the computation method by specifying the `method` argument:
`asymptotic` for numerical hessian computation or `boot` for the bootstrap
method. In the latter case, user can customise the bootstrap computation as will
be discussed in Section [2](#org6114034) by using the `...` argument.

Parameters' standard errors and confidence intervals can be computed by calls to
the generic functions `se.coef()` and `confint()`. The hessian method can be
specified by setting the argument `type = "asymptotic"`.

    se <- se.coef(gam, type = "asymptotic")
    se

                  rate_          rate_germanyes       rate_years_school 
              0.2523375               0.0590399               0.0265014 
      rate_voc_trainyes      rate_universityyes   rate_ReligionCatholic 
              0.0358390               0.1296149               0.0578032 
    rate_ReligionMuslim rate_ReligionProtestant         rate_year_birth 
              0.0698429               0.0622954               0.0019471 
          rate_ruralyes       rate_age_marriage                  shape_ 
              0.0311876               0.0053274               0.0710611

    ci <- confint(gam, type = "asymptotic")
    ci

                                 2.5 %     97.5 %
    rate_                    1.0621317  2.0512766
    rate_germanyes          -0.3054815 -0.0740495
    rate_years_school       -0.0202566  0.0836270
    rate_voc_trainyes       -0.2141792 -0.0736929
    rate_universityyes      -0.4000943  0.1079867
    rate_ReligionCatholic    0.0924771  0.3190616
    rate_ReligionMuslim      0.3857453  0.6595243
    rate_ReligionProtestant -0.0149604  0.2292330
    rate_year_birth         -0.0014721  0.0061603
    rate_ruralyes           -0.0056353  0.1166177
    rate_age_marriage       -0.0392385 -0.0183553
    shape_                   1.3000440  1.5785983

One can validate the result obtained here by comparing them to what is reported
in \citet[Table 1]{winkelmann1995duration}.


<a id="org6114034"></a>

# Bootstrap


## Theory

The type of bootstrap used in `Countr` is known as *nonparametric* or bootstrap
pairs. It is valid under the assumption that \((y_i, \mathbf{x}_i)\) is iid. The
algorithm works as follows:

1.  Generate a pseudo-sample of size \(n\), \((y^*_l, \mathbf{x}^*_l), \ l=1, \dots,
       n\), by sampling *with replacement* from the original pairs \((y_i,
       \mathbf{x}_i), \ i =1, \dots, n\).
2.  Compute the estimator \(\hat{\bm{\theta}}_1\) from the pseudo-sample generated
    in 1.
3.  Repeat steps 1 and 2 \(B\) times giving \(B\) estimates \(\hat{\bm{\theta}}_1,
       \dots, \hat{\bm{\theta}}_B\).
4.  The bootstrap estimate of the variance-covariance matrix is given by

\(\hat{\mathbf{V}}_{Boot}[\bm{\hat{\theta}}] = \frac{1}{B -1}
\sum_{b=1}^B(\hat{\bm{\theta}}_b - \bar{\bm{\theta}})(\hat{\bm{\theta}}_b -
\bar{\bm{\theta}})'\) where \(\bar{\bm{\theta}} = [\bar{\theta}_1, \dots,
\bar{\theta}_q]\) and \(\bar{\theta}_j\) is the sample mean \(\bar{\theta}_j = (1/B)
\sum_{b=1}^B \hat{\bm{\theta}}_{j,b}\).

Asymptotically (\(B \rightarrow \infty\)), the bootstrap variance-covariance
matrix and standard errors are equivalent to their robust counterpart obtained
by sandwich estimators. In practice, using \(B=400\) is usually recommended
\citep[Section 2.6.4]{cameron2013regression}}


## Implementation in `Countr`

The bootstrap computations in `Countr` are based on the `boot()` function
from the package with the same name \citep{boot2017}.

The variance-covariance matrix is again computed with the renewal method for
`vcov()` by specifying the argument `method = "boot"`.  The computation can be
further customised by passing other options accepted by `boot()` other than
`data` and `statistic` which are provided by the `Countr` code.  Note that the
matrix is only computed if it is not found in the passed `renewal` object.  The
bootstrap sample is actually computed by a separate function
`addBootSampleObject()`, which computes the bootstrap sample and adds it as
component `boot` to the renewal object. Functions like `vcov()` and `confint()`
check if a bootstrap sample is already available and use it is.  It is a good
idea to call `addBootSampleObject()` before attempting computations based on
bootstrapping. We show below how to update the previously fitted gamma model
with 400 bootstrap iterations using the parallel option and 14 CPUs.  if \(B\) is
large and depending on how fast the model can be fitted, this computation may be
time consuming.

    gam <- addBootSampleObject(gam, R = 400, parallel = "multicore", ncpus = 14)

Once the object is updated, the variance-covariance matrix is computed by `vcov`
in a straightforward way:

    gam$vcov <- matrix()
    varCovar <- vcov(gam, method = "boot")
    varCovar

                                  rate_ rate_germanyes rate_years_school
    rate_                    0.07318764     5.0060e-03       -5.6704e-03
    rate_germanyes           0.00500601     3.7300e-03       -6.9972e-04
    rate_years_school       -0.00567041    -6.9972e-04        7.1876e-04
    rate_voc_trainyes        0.00087763    -4.3825e-04       -1.6477e-04
    rate_universityyes       0.01675906     1.8472e-03       -2.2823e-03
    rate_ReligionCatholic   -0.00072461    -9.5183e-04       -5.0782e-05
    rate_ReligionMuslim     -0.00350408     1.1549e-03        1.3725e-04
    rate_ReligionProtestant -0.00062891    -1.3197e-03       -4.8670e-05
    rate_year_birth         -0.00018173    -3.8643e-05        5.6028e-06
    rate_ruralyes           -0.00197542    -2.2663e-04        1.1529e-04
    rate_age_marriage       -0.00036158     6.7750e-05       -1.8638e-05
    shape_                   0.00860625     1.1773e-05        6.3172e-05
                            rate_voc_trainyes rate_universityyes
    rate_                          8.7763e-04         1.6759e-02
    rate_germanyes                -4.3825e-04         1.8472e-03
    rate_years_school             -1.6477e-04        -2.2823e-03
    rate_voc_trainyes              1.4116e-03         1.6609e-03
    rate_universityyes             1.6609e-03         1.5801e-02
    rate_ReligionCatholic          5.5154e-05         5.2001e-04
    rate_ReligionMuslim            2.0904e-04         4.9984e-04
    rate_ReligionProtestant        9.5869e-06         5.3275e-04
    rate_year_birth                9.8568e-06         3.1314e-06
    rate_ruralyes                  3.5200e-04         3.9912e-04
    rate_age_marriage             -3.0112e-06         3.0646e-05
    shape_                         4.7749e-04         4.1102e-04
                            rate_ReligionCatholic rate_ReligionMuslim
    rate_                             -7.2461e-04         -3.5041e-03
    rate_germanyes                    -9.5183e-04          1.1549e-03
    rate_years_school                 -5.0782e-05          1.3725e-04
    rate_voc_trainyes                  5.5154e-05          2.0904e-04
    rate_universityyes                 5.2001e-04          4.9984e-04
    rate_ReligionCatholic              3.1847e-03          1.6360e-03
    rate_ReligionMuslim                1.6360e-03          4.6887e-03
    rate_ReligionProtestant            2.7871e-03          1.4184e-03
    rate_year_birth                   -2.4024e-06         -1.7800e-05
    rate_ruralyes                      2.1452e-04          3.7533e-04
    rate_age_marriage                 -3.0908e-05          1.7879e-05
    shape_                            -6.7137e-05          8.1247e-05
                            rate_ReligionProtestant rate_year_birth rate_ruralyes
    rate_                               -6.2891e-04     -1.8173e-04   -1.9754e-03
    rate_germanyes                      -1.3197e-03     -3.8643e-05   -2.2663e-04
    rate_years_school                   -4.8670e-05      5.6028e-06    1.1529e-04
    rate_voc_trainyes                    9.5869e-06      9.8568e-06    3.5200e-04
    rate_universityyes                   5.3275e-04      3.1314e-06    3.9912e-04
    rate_ReligionCatholic                2.7871e-03     -2.4024e-06    2.1452e-04
    rate_ReligionMuslim                  1.4184e-03     -1.7800e-05    3.7533e-04
    rate_ReligionProtestant              3.7010e-03      1.6907e-06    1.8705e-04
    rate_year_birth                      1.6907e-06      3.7486e-06   -2.0782e-07
    rate_ruralyes                        1.8705e-04     -2.0782e-07    1.0425e-03
    rate_age_marriage                   -4.3948e-05     -2.2939e-06    1.2680e-05
    shape_                              -2.3479e-04     -2.4092e-05    1.3058e-04
                            rate_age_marriage      shape_
    rate_                         -3.6158e-04  8.6063e-03
    rate_germanyes                 6.7750e-05  1.1773e-05
    rate_years_school             -1.8638e-05  6.3172e-05
    rate_voc_trainyes             -3.0112e-06  4.7749e-04
    rate_universityyes             3.0646e-05  4.1102e-04
    rate_ReligionCatholic         -3.0908e-05 -6.7137e-05
    rate_ReligionMuslim            1.7879e-05  8.1247e-05
    rate_ReligionProtestant       -4.3948e-05 -2.3479e-04
    rate_year_birth               -2.2939e-06 -2.4092e-05
    rate_ruralyes                  1.2680e-05  1.3058e-04
    rate_age_marriage              3.0042e-05  8.9316e-05
    shape_                         8.9316e-05  1.2840e-02

Bootstrap standard errors are also very easy to compute by calling `se.coef()`
with argument `type`"boot"=. As discussed before, if the `boot` object is not
found in the `renewal` object, users can customise the `boot()` call by
passing the appropriate arguments in `...`.

    se_boot  <- se.coef(gam, type = "boot")
    se_boot

                  rate_          rate_germanyes       rate_years_school 
              0.2705321               0.0610739               0.0268098 
      rate_voc_trainyes      rate_universityyes   rate_ReligionCatholic 
              0.0375714               0.1257020               0.0564330 
    rate_ReligionMuslim rate_ReligionProtestant         rate_year_birth 
              0.0684739               0.0608356               0.0019361 
          rate_ruralyes       rate_age_marriage                  shape_ 
              0.0322879               0.0054811               0.1133149

Finally bootstrap confidence intervals can also be computed by `confint()`
using the same logic described for `se.coef()`. Different types of
confidence intervals are available (default is normal) and can be selected by
choosing the appropriate type in `bootType`. We refer the user to the `boot`
package \citep{boot2017} for more information.

    ci_boot  <- confint(gam, level = 0.95, type = "boot", bootType = "norm")
    ci_boot

    Bootstrap quantiles, type =  normal 
    
                                 2.5 %     97.5 %
    rate_                    1.0105534  2.0710199
    rate_germanyes          -0.3116866 -0.0722812
    rate_years_school       -0.0176548  0.0874376
    rate_voc_trainyes       -0.2211511 -0.0738740
    rate_universityyes      -0.4072628  0.0854802
    rate_ReligionCatholic    0.0985243  0.3197377
    rate_ReligionMuslim      0.3871631  0.6555759
    rate_ReligionProtestant -0.0133962  0.2250750
    rate_year_birth         -0.0016933  0.0058961
    rate_ruralyes           -0.0098069  0.1167594
    rate_age_marriage       -0.0401915 -0.0187062
    shape_                   1.1860640  1.6302501


# Save Image     :ignoreheading:

We conclude this analysis by saving the work space to avoid re-running the
computation in future exportation of the document:

    save.image()


# Bibliography     :ignoreheading:

\bibliographystyle{apalike}
\bibliography{REFERENCES}

