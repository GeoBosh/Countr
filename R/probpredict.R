## replacement for pscl::predprob()
## only the glm method implemented.

## TODO: could write a method for class 'renewal' just passing on to predict()
##       with type = "prob"

#' Probability predictions
#'
#' Compute probability predictions for discrete distribution models.
#'
#' This is an emergency replacement for pscl::predprob, since package 'pscl is
#' scheduled for removal from CRAN (in a couple of weeks) at the time of writing
#' this (2024-01-13).
#'
#' The function is exported but currently marked as internal, since the
#' arguments may be changed. When it is stable, it will be documented fully.
#' @param obj object from a supported class.
#' @param ... further arguments for methods
#' @keywords internal
#' @export
prob_predict <- function(obj, ...){
    UseMethod("prob_predict")
}

#' @method prob_predict glm
#' @export
prob_predict.glm <- function(obj, newdata = NULL, at = NULL, ...){
    if(!inherits(obj, "glm"))
        stop("'obj' must inherit from class 'glm'\n")

    yhat <- if(is.null(newdata))
                predict(obj, type = "response")
            else
                predict(obj, newdata = newdata, type = "response")

    fam <- family(obj)$family
    
    if(fam == "binomial") {
        p <- structure(cbind(1 - yhat, yhat),
                       dimnames =  list(NULL, c("0", "1")))
    } else {
        ## y <- obj$y
        if(is.null(at))
            at <- 0:max(obj$y)

        p <- structure(matrix(NA_real_, length(yhat), length(at)),
                       dimnames = list(NULL, at))

        if(inherits(obj, "negbin")) {
            for(i in seq_along(at))
                p[ , i] <- dnbinom(x = at[i], size = obj$theta, mu = yhat)
        } else if(fam == "poisson") {
            for(i in seq_along(at))
                p[ , i] <- dpois(x = at[i], lambda = yhat)
        } else
            stop("unsupported glm family '", fam, "'")
    }
    
    p
}
