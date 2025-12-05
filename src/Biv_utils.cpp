#include "RcppArmadillo.h"
#include "../inst/include/Countr_types.h"

using namespace arma;
using namespace std;
using namespace Rcpp;

// [[Rcpp::interfaces(r, cpp)]]

// =============================================================================
// --------------------- Bivariate-Count-generic -------------------------------
// =============================================================================
// Density of Bivariate Frank Copula Count model
//
// Compute the density of Bivariate Frank Copula Count model.
//
// We use Frank copula to model depepndence between two renewal count
// processes obtained from user passed inter-arrival distribution
// defined by \code{survPtr}, \code{distPars} and \code{extrapolPars}.
// @param x,y numeric the desired counts.
// @param distX,distY character name of builtin distribution.
// @param distParsX,distParsY List; a named vector of distribution parameters.
// @param theta double Frank copula parameter.
// @param extrapolParsX,extrapolParsY vec of length 2 values of the
// Richardson extrapolation parameters for the inputted distribution.
// @param nsteps unsiged integer number of steps used to compute the integral.
// @param time double time at wich to compute the probabilities. Set to 1 by
// default.
// @param extrap logical if \code{TRUE}, Richardson extrapolation will be
// applied to improve accuracy.
// @return (log) probability of the bivariate count
// \eqn{P(X(t) = x, Y(t) = y)}
double BivarateCountFrankCopulaDensity(unsigned x, unsigned y,
				       const std::string distX,
				       const std::string distY,
				       const Rcpp::List distParsX,
				       const Rcpp::List distParsY,
				       arma::vec extrapolParsX,
				       arma::vec extrapolParsY,
				       double theta = 0,
				       double time = 1.0 , bool logFlag = false,
				       const unsigned nsteps = 100,
				       bool extrap = true) {

  arma::vec Xres = getProbs_dePril(x, distParsX, extrapolParsX,
				   distX, nsteps, time, extrap);
  double F1x = 1 - Xres(1) + Xres(0);
  double F1m1 = 1 - Xres(1);

  arma::vec Yres = getProbs_dePril(y, distParsY, extrapolParsY,
				   distY, nsteps, time, extrap);

  double F2y = 1 - Yres(1) + Yres(0);
  double F2m1 = 1 - Yres(1);


  double f = BivariateFrankCopula(F1x, F2y, theta) -
    BivariateFrankCopula(F1m1, F2y, theta) -
    BivariateFrankCopula(F1x, F2m1, theta) +
    BivariateFrankCopula(F1m1, F2m1,theta) ;

  if (logFlag)
    return(log(f));
  else
    return(f);
}

double BivarateCountFrankCopulaDensity(unsigned x, unsigned y,
				       Rcpp::Function survRX,
				       Rcpp::Function survRY,
				       const Rcpp::List distParsX,
				       const Rcpp::List distParsY,
				       arma::vec extrapolParsX,
				       arma::vec extrapolParsY,
				       double theta = 0,
				       double time = 1.0 , bool logFlag = false,
				       const unsigned nsteps = 100,
				       bool extrap = true) {

  arma::vec Xres = getProbs_dePril(x, distParsX, extrapolParsX,
				   survRX, nsteps, time, extrap);

  double F1x = 1 - Xres(1) + Xres(0);
  double F1m1 = 1 - Xres(1);

  arma::vec Yres = getProbs_dePril(y, distParsY, extrapolParsY,
				   survRY, nsteps, time, extrap);
  double F2y = 1 - Yres(1) + Yres(0);
  double F2m1 = 1 - Yres(1);


  double f = BivariateFrankCopula(F1x, F2y, theta) -
    BivariateFrankCopula(F1m1, F2y, theta) -
    BivariateFrankCopula(F1x, F2m1, theta) +
    BivariateFrankCopula(F1m1, F2m1,theta) ;

  if (logFlag)
    return(log(f));
  else
    return(f);
}

//' Bivariate Count probability Using Frank copula (user)
//'
//' Bivariate Count probability Using Frank copula to model dependence
//' using user passed survival objects
//'
//' We use Frank copula to model depepndence between 2 renewal count
//' processes obtained from user passed inter-arrival distribution
//' defined by \code{survPtr}, \code{distPars} and \code{extrapolPars}.
//' @param x,y numeric vector the desired counts.
//' @param survX,survY R functions: the survival functions.
//' @param distParsX,distParsY List of Lists. Each slot is
//'     a named vector of distribution parameters.
//' @param theta double Frank copula parameter.
//' @param extrapolParsX,extrapolParsY list vec of length 2 values of the
//'    Richardson extrapolation parameters for the inputted distribution.
//' @param nsteps unsiged integer number of steps used to compute the integral.
//' @param time double time at wich to compute the probabilities. Set to 1 by
//' default.
//' @param extrap logical if \code{TRUE}, Richardson extrapolation will be
//' applied to improve accuracy.
//' TODO: (this is for arg. method, maybe!) param dePrilConv logical if \code{TRUE}
//'       the dePril method will be applied to
//' compute convolution. Otherwise, the binary decomposition of section 3 will be
//' used.
//' @param logFlag TODO
//' @return (log) probability of the bivariate count
//' \eqn{P(X(t) = x_i, Y(t) = y_i)} where x_i and y_i are the ith component of
//' the X and Y respectively.
//' @export
// [[Rcpp::export]]
arma::vec dRenewalFrankCopula_user(arma::Col <unsigned> x,
				   arma::Col <unsigned> y,
				   Rcpp::Function survX,
				   Rcpp::Function survY,
				   Rcpp::List distParsX, // list of lists
				   Rcpp::List distParsY, // list of lists
				   Rcpp::List extrapolParsX,
				   Rcpp::List extrapolParsY,
				   double theta,
				   double time = 1.0, bool logFlag = false,
				   unsigned nsteps = 100, bool extrap = true) {
  Rcpp::List parX;
  Rcpp::List parY;
  unsigned n = x.n_elem;
  arma::vec prob(n, fill::zeros);
  unsigned x0, y0;
  arma::vec extParsX, extParsY;

  // check the size of the inputs
  if (y.n_elem != n)
    stop("check dimesnion y!");
  if (distParsX.size() != n)
    stop("check dimesnion distParsX !");
  if (distParsY.size() != n)
    stop("check dimesnion distParsY !");
  if (extrapolParsX.size() != n)
    stop("check dimesnion extrapolParsX !");
  if (extrapolParsY.size() != n)
    stop("check dimesnion extrapolParsY !");

  for (unsigned i = 0; i < n; i ++) {
    parX  = Rcpp::as<Rcpp::List>(distParsX[i]);
    parY  = Rcpp::as<Rcpp::List>(distParsY[i]);
    extParsX = Rcpp::as<arma::vec>(extrapolParsX[i]);
    extParsY = Rcpp::as<arma::vec>(extrapolParsY[i]);

    x0 = x(i);
    y0 = y(i);

    prob(i) =  BivarateCountFrankCopulaDensity(x0, y0, survX, survY,
					       parX, parY,
					       extParsX, extParsY,
					       theta,
					       time, logFlag, nsteps, extrap);
  }

  return(prob);
}

//' Bivariate Count probability Using Frank copula (user)
//'
//' Bivariate Count probability Using Frank copula to model dependence
//' using built-in distributions
//'
//' @param distX,distY character name of the survival distribution.
//' @return (log) probability of the bivariate count
//' \eqn{P(X(t) = x_i, Y(t) = y_i)} where x_i and y_i are the ith component of
//' the X and Y respectively.
//' @export
//' @rdname dRenewalFrankCopula_user
// [[Rcpp::export]]
arma::vec dRenewalFrankCopula_bi(arma::Col <unsigned> x,
				 arma::Col <unsigned> y,
				 const std::string distX,
				 const std::string distY,
				 Rcpp::List distParsX, // list of lists
				 Rcpp::List distParsY, // list of lists
				 double theta,
				 double time = 1.0, bool logFlag = false,
				 unsigned nsteps = 100, bool extrap = true) {
  Rcpp::List parX;
  Rcpp::List parY;
  unsigned n = x.n_elem;
  arma::vec prob(n, fill::zeros);
  unsigned x0, y0;
  arma::vec extParsX, extParsY;

  // check the size of the inputs
  if (y.n_elem != n)
    stop("check dimesnion y!");
  if (distParsX.size() != n)
    stop("check dimesnion distParsX !");
  if (distParsY.size() != n)
    stop("check dimesnion distParsY !");

  for (unsigned i = 0; i < n; i ++) {
    parX  = Rcpp::as<Rcpp::List>(distParsX[i]);
    parY  = Rcpp::as<Rcpp::List>(distParsY[i]);
    extParsX = getextrapolPars(parX, distX);
    extParsY = getextrapolPars(parY, distY);
    x0 = x(i);
    y0 = y(i);

    prob(i) =  BivarateCountFrankCopulaDensity(x0, y0, distX, distY,
					       parX, parY,
					       extParsX, extParsY,
					       theta,
					       time, logFlag, nsteps, extrap);
  }

  return(prob);
}
