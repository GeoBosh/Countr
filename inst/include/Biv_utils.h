#ifndef __Bivutils_h__
#define __Bivutils_h__

#include <RcppArmadillo.h>

double BivarateCountFrankCopulaDensity(unsigned x, unsigned y,
				       const std::string distX,
				       const std::string distY,
				       const Rcpp::List distParsX,
				       const Rcpp::List distParsY,
				       arma::vec extrapolParsX,
				       arma::vec extrapolParsY,
				       double theta,
				       double time, bool logFlag,
				       const unsigned nsteps,
				       bool extrap);

double BivarateCountFrankCopulaDensity(unsigned x, unsigned y,
				       Rcpp::Function survRX,
				       Rcpp::Function survRY,
				       const Rcpp::List distParsX,
				       const Rcpp::List distParsY,
				       arma::vec extrapolParsX,
				       arma::vec extrapolParsY,
				       double theta,
				       double time, bool logFlag,
				       const unsigned nsteps,
				       bool extrap);
#endif
