## ================= McShane functions reshaped ================================
alphagen <- function(CC, JJ, NN) {
    alpha <- matrix(0, ncol = NN, nrow = JJ)
    
    for(j in 0:(JJ - 1)) {
        alpha[j + 1, 0 + 1] <- exp( lgamma(CC * j + 1) -lgamma( j + 1) )
    }
    
    for(n in 0:(NN - 2)) {
        for(j in (n + 1):(JJ - 1)) {
            alpha[j + 1, (n + 1) + 1] <- 0
            for(m in n:(j - 1)) {
                alpha[j + 1, (n + 1) + 1] <- alpha[j + 1, (n + 1) + 1] +
                    alpha[m + 1, n + 1] *
                        exp( lgamma(CC * j - CC * m + 1) - lgamma(j - m + 1) )
            }
        }
    }
    alpha
}

## weibull-count probability adapted from McShane Rcode weibull.R/my_fcn
dWeibullCount_McShane <- function(lambda, cc, Cdata, t = 1,
                                  jmax = 100, Retprob = FALSE) {
  Tdata <- rep(t, length(Cdata))

  fcn_alpha <- alphagen(cc, jmax + 1, max(Cdata) + 2)

  ALPHA <- matrix(NA, nrow = length(Cdata), ncol = jmax + 1)
  for(i in 1:length(Tdata)) 
    ALPHA[i, ] <- fcn_alpha[, Cdata[i] + 1]
  

  tmp <- matrix(NA, nrow = length(Cdata), ncol = jmax + 1)
  for(i in 1:(jmax+1))
      tmp[, i] <- (-1)^((i - 1) + Cdata) *
          (lambda*(Tdata^cc))^(i - 1) * ALPHA[, i] / gamma(cc * (i - 1) + 1)
  

  prob <- rowSums(tmp)
  if (Retprob)
      return(prob)
  else
      -sum(log(prob))
}
