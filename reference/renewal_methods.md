# Methods for renewal objects

Methods for renewal objects.

## Usage

``` r
# S3 method for class 'renewal'
coef(object, ...)

# S3 method for class 'renewal'
vcov(object, ...)

# S3 method for class 'renewal'
residuals(object, type = c("pearson", "response", "prob"), ...)

# S3 method for class 'renewal'
residuals_plot(object, type = c("pearson", "response", "prob"), ...)

# S3 method for class 'renewal'
fitted(object, ...)

# S3 method for class 'renewal'
confint(
  object,
  parm,
  level = 0.95,
  type = c("asymptotic", "boot"),
  bootType = c("norm", "bca", "basic", "perc"),
  ...
)

# S3 method for class 'renewal'
summary(object, ...)

# S3 method for class 'renewal'
print(x, digits = max(3, getOption("digits") - 3), ...)

# S3 method for class 'summary.renewal'
print(
  x,
  digits = max(3, getOption("digits") - 3),
  width = getOption("width"),
  ...
)

# S3 method for class 'renewal'
model.matrix(object, ...)

# S3 method for class 'renewal'
logLik(object, ...)

# S3 method for class 'renewal'
nobs(object, ...)

# S3 method for class 'renewal'
extractAIC(fit, scale, k = 2, ...)

# S3 method for class 'renewal'
addBootSampleObject(object, ...)

# S3 method for class 'renewal'
df.residual(object, ...)
```

## Arguments

- object:

  an object from class `"renewal"`.

- ...:

  further arguments for methods.

- type, parm, level, bootType, x, digits:

  see the corresponding generics and section ‘Details’.

- width:

  numeric width length.

- fit, scale, k:

  same as in the generic.

## Details

Objects from class `"renewal"` represent fitted count renewal models and
are created by calls to `"renewalCount()"`. There are methods for this
class for many of the familiar functions for interacting with fitted
models.

## Examples

``` r
fn <- system.file("extdata", "McShane_Wei_results_boot.RDS", package = "Countr")
object <- readRDS(fn)
class(object) # "renewal"
#> [1] "renewal"

coef(object)
#>          scale_    scale_GERMAN       scale_EDU       scale_VOC       scale_UNI 
#>     1.397339743    -0.222677155     0.038579223    -0.173423930    -0.181808127 
#>      scale_CATH      scale_PROT      scale_MUSL     scale_RURAL scale_YEAR_OF_B 
#>     0.242045872     0.123221530     0.638803211     0.068074810     0.002307353 
#>   scale_AGEMARR          shape_ 
#>    -0.034029563     1.236232710 
vcov(object)
#>                        scale_  scale_GERMAN     scale_EDU     scale_VOC
#> scale_           0.0930236225  8.919340e-03 -8.165893e-03  1.153322e-03
#> scale_GERMAN     0.0089193396  5.214102e-03 -1.150253e-03 -4.339834e-04
#> scale_EDU       -0.0081658934 -1.150253e-03  1.063042e-03 -2.814470e-04
#> scale_VOC        0.0011533223 -4.339834e-04 -2.814470e-04  1.935682e-03
#> scale_UNI        0.0256804922  2.754849e-03 -3.355547e-03  1.871018e-03
#> scale_CATH      -0.0031003254 -1.579181e-03  1.237918e-04  5.534533e-05
#> scale_PROT      -0.0027900298 -2.269655e-03  1.023422e-04  1.759421e-05
#> scale_MUSL      -0.0057349764  1.042368e-03  1.377562e-04  1.867273e-04
#> scale_RURAL     -0.0014521343 -2.639966e-04  9.503076e-05  3.333572e-04
#> scale_YEAR_OF_B -0.0001654313 -3.087628e-05 -1.915529e-06  2.043607e-05
#> scale_AGEMARR   -0.0005939423  3.175688e-05 -1.743303e-05 -1.909649e-05
#> shape_           0.0012043607 -1.032629e-04  2.449776e-05 -1.015040e-04
#>                     scale_UNI    scale_CATH    scale_PROT    scale_MUSL
#> scale_           2.568049e-02 -3.100325e-03 -2.790030e-03 -5.734976e-03
#> scale_GERMAN     2.754849e-03 -1.579181e-03 -2.269655e-03  1.042368e-03
#> scale_EDU       -3.355547e-03  1.237918e-04  1.023422e-04  1.377562e-04
#> scale_VOC        1.871018e-03  5.534533e-05  1.759421e-05  1.867273e-04
#> scale_UNI        2.540730e-02 -1.041703e-05  2.833785e-05 -2.566270e-04
#> scale_CATH      -1.041703e-05  4.999685e-03  4.460029e-03  3.044988e-03
#> scale_PROT       2.833785e-05  4.460029e-03  5.805663e-03  2.739216e-03
#> scale_MUSL      -2.566270e-04  3.044988e-03  2.739216e-03  7.468544e-03
#> scale_RURAL      3.278856e-04  5.070440e-05  7.404498e-05  1.637396e-04
#> scale_YEAR_OF_B  4.751321e-05  2.372257e-07 -5.718801e-06 -1.559452e-07
#> scale_AGEMARR   -6.938872e-05 -3.997862e-05 -2.326609e-05  3.817387e-05
#> shape_          -1.347961e-04  1.123694e-04  4.346523e-05  4.525415e-04
#>                   scale_RURAL scale_YEAR_OF_B scale_AGEMARR        shape_
#> scale_          -1.452134e-03   -1.654313e-04 -5.939423e-04  1.204361e-03
#> scale_GERMAN    -2.639966e-04   -3.087628e-05  3.175688e-05 -1.032629e-04
#> scale_EDU        9.503076e-05   -1.915529e-06 -1.743303e-05  2.449776e-05
#> scale_VOC        3.333572e-04    2.043607e-05 -1.909649e-05 -1.015040e-04
#> scale_UNI        3.278856e-04    4.751321e-05 -6.938872e-05 -1.347961e-04
#> scale_CATH       5.070440e-05    2.372257e-07 -3.997862e-05  1.123694e-04
#> scale_PROT       7.404498e-05   -5.718801e-06 -2.326609e-05  4.346523e-05
#> scale_MUSL       1.637396e-04   -1.559452e-07  3.817387e-05  4.525415e-04
#> scale_RURAL      1.456890e-03    4.237730e-06 -1.537028e-05  4.570599e-05
#> scale_YEAR_OF_B  4.237730e-06    5.677948e-06 -4.288778e-06 -9.240759e-07
#> scale_AGEMARR   -1.537028e-05   -4.288778e-06  4.272941e-05 -1.697867e-05
#> shape_           4.570599e-05   -9.240759e-07 -1.697867e-05  1.136108e-03

## Pearson residuals: rescaled by sd
head(residuals(object, "pearson"))
#>          1          2          3          4          5          6 
#> -0.4536889  0.2666367 -0.2879260  1.4626630 -0.3689430 -0.4503339 
## response residuals: not rescaled
head(residuals(object, "response"))
#>          1          2          3          4          5          6 
#> -0.6359564  0.3731793 -0.3861650  1.8671934 -0.5056416 -0.6306918 

head(fitted(object))
#> [1] 2.635956 2.626821 2.386165 2.132807 2.505642 2.630692

## loglik, nobs, AIC, BIC
c(loglik = as.numeric(logLik(object)), nobs = nobs(object),
  AIC = AIC(object), BIC = BIC(object))
#>    loglik      nobs       AIC       BIC 
#> -2077.005  1243.000  4178.010  4239.513 

asym <- se.coef(object, , "asymptotic")
boot <- se.coef(object, , "boot")
cbind(asym, boot)
#>                        asym        boot
#> scale_          0.304997742 0.331438080
#> scale_GERMAN    0.072208742 0.077987820
#> scale_EDU       0.032604326 0.034450773
#> scale_VOC       0.043996381 0.045988517
#> scale_UNI       0.159396681 0.158987448
#> scale_CATH      0.070708448 0.070752807
#> scale_PROT      0.076194899 0.072959615
#> scale_MUSL      0.086420737 0.094049819
#> scale_RURAL     0.038169230 0.039366247
#> scale_YEAR_OF_B 0.002382845 0.002482896
#> scale_AGEMARR   0.006536774 0.006872492
#> shape_          0.033706207 0.044842338
## CI for coefficients
asym <- confint(object, type = "asymptotic")
## Commenting out for now, see the nite in the code of confint.renewal():
## boot <- confint(object, type = "boot", bootType = "norm")
## list(asym = asym, boot = boot)
summary(object)
#> 
#> Call:
#> renewal(formula = form, data = data, dist = "weibull")
#> 
#> Pearson residuals:
#>      Min       1Q   Median       3Q      Max 
#> -2.66294 -0.73038 -0.09425  0.49688  6.73987 
#> Inter-arrival dist.: weibull 
#>               Links: scale: link log, shape: link log 
#> 
#> Count model coefficients
#>                  Estimate Std. Error z value Pr(>|z|)    
#> scale_           1.397340   0.304998   4.581 4.62e-06 ***
#> scale_GERMAN    -0.222677   0.072209  -3.084 0.002044 ** 
#> scale_EDU        0.038579   0.032604   1.183 0.236708    
#> scale_VOC       -0.173424   0.043996  -3.942 8.09e-05 ***
#> scale_UNI       -0.181808   0.159397  -1.141 0.254036    
#> scale_CATH       0.242046   0.070708   3.423 0.000619 ***
#> scale_PROT       0.123222   0.076195   1.617 0.105838    
#> scale_MUSL       0.638803   0.086421   7.392 1.45e-13 ***
#> scale_RURAL      0.068075   0.038169   1.783 0.074505 .  
#> scale_YEAR_OF_B  0.002307   0.002383   0.968 0.332885    
#> scale_AGEMARR   -0.034030   0.006537  -5.206 1.93e-07 ***
#> shape_           1.236233   0.033706  36.677  < 2e-16 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
#> 
#> Number of iterations in nlminb optimization: 52 
#> 
#> Execution time  371 
#> Log-likelihood: -2077.0049 on 12 Df
print(object)
#> 
#> Call:
#> renewal(formula = form, data = data, dist = "weibull")
#> 
#> Count model coefficients (inter-arrival weibull with scale: link log, shape: link log):
#>          scale_     scale_GERMAN        scale_EDU        scale_VOC  
#>        1.397340        -0.222677         0.038579        -0.173424  
#>       scale_UNI       scale_CATH       scale_PROT       scale_MUSL  
#>       -0.181808         0.242046         0.123222         0.638803  
#>     scale_RURAL  scale_YEAR_OF_B    scale_AGEMARR           shape_  
#>        0.068075         0.002307        -0.034030         1.236233  
#> 
#> Log-likelihood: -2077.0049 on 12 Df
## see renewal_methods
## see renewal_methods
```
