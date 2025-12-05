#ifndef __Bivwei_series_h__
#define __Bivwei_series_h__

#include <RcppArmadillo.h>
arma::vec dWeibullInterArrivalCountFrankCopula(arma::Col <unsigned> x, 
					       arma::Col <unsigned> y,
					       arma::vec shapeX, arma::vec shapeY,
					       arma::vec exbX, arma::vec exbY,
					       double theta,
					       double t, bool logFlag,
					       unsigned jmax, int nmax,
					       double eps);

arma::vec dWeibullInterArrivalCountFrankCopula(arma::Col <unsigned> x, 
					       arma::Col <unsigned> y,
					       double shapeX, double shapeY,
					       arma::vec exbX, arma::vec exbY,
					       double theta,
					       double t, bool logFlag,
					       unsigned jmax, int nmax,
					       double eps);

arma::vec dWeibullgammaInterArrivalCountFrankCopula(arma::Col <unsigned> x, 
						    arma::Col <unsigned> y,
						    double shapeX, double shapeY,
						    double rX, double alphaX,
						    double rY, double alphaY,
						    arma::vec xbX, arma::vec xbY,
						    double theta,
						    double t, bool logFlag,
						    unsigned jmax, int nmax,
						    double eps);

arma::vec dWeibullgammaInterArrivalCountFrankCopula(arma::Col <unsigned> x, 
						    arma::Col <unsigned> y,
						    arma::vec shapeX,
						    arma::vec shapeY,
						    double rX, double alphaX,
						    double rY, double alphaY,
						    arma::vec xbX, arma::vec xbY,
						    double theta,
						    double t, bool logFlag,
						    unsigned jmax, int nmax,
						    double eps);


#endif
