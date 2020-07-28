#include <Rcpp.h>
#include <Rmath.h>

using namespace Rcpp;

// [[Rcpp::plugins("cpp11")]]

// [[Rcpp::init]]
void my_package_init(DllInfo *dll) {
  // initialization code here
  R_useDynamicSymbols(dll, TRUE);
}


//' Test Rcpp function
//'
//'
//' @param test test parameter
//'
//' @export
// [[Rcpp::export]]
double crtTest(double test) {
  return pow(test,2);
}


// [[Rcpp::export]]
double crank(NumericVector v1, NumericVector v2) {
  int    n1 = v1.size(), n2 = v2.size();
  double rst = 0;
  int    i, j;

  for (i = 0; i < n1; i++) {
    for (j = 0; j < n2; j++) {
      if (v1(i) > v2(j)) {
        rst += 1;
      } else if (v1(i) < v2(j)) {
        rst += -1;
      }
    }
  }

  rst = rst/n1/n2;
  return(rst);
}

// sign-rank test
// [[Rcpp::export]]
double crank2(NumericMatrix v12) {
  int    n   = v12.nrow();
  double rst = 0;
  int    i;

  for (i = 0; i < n; i++) {
    if (v12(i,1) > v12(i,0)) {
      rst += 1;
    } else if (v12(i,1) < v12(i,0)) {
      rst += -1;
    }
  }

  rst = rst/n;
  return(rst);
}
