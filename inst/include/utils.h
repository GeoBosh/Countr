#ifndef __utils_h__
#define __utils_h__

#include <RcppArmadillo.h>

double BivariateFrankCopula(double u, double v, double theta);
arma::Col <unsigned> seq0(unsigned to, unsigned by = 1);

#endif 
