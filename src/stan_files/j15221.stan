//simulate missing y for a single subject
functions {
  real cond_lpdf(vector ymis, vector yobs, real[] coef,
                 int ny, real[] mu, real[] sigma, int[] imis, int[] inx, real eta) {

    real       rst;
    vector[ny] ally;

    //generate vector of y
    for (i in 1:ny) {
      if (1 == imis[i]) {
        //missing 
        ally[i] = ymis[inx[i]];
      } else {
        //observed
        ally[i] = yobs[inx[i]];
      }
    }

    rst = normal_lpdf(ally[1] | mu[1], sigma[1]) +
      normal_lpdf(ally[2] | mu[2] + coef[1] * ally[1], sigma[2]) +
      normal_lpdf(ally[3] | mu[3] + coef[2] * ally[1] + coef[3] * ally[2], sigma[3]) + 
      eta * (ally[1] + ally[2] + ally[3]);

    return rst;
  }
}

data {
  int<lower=1>             NY;   //total no. y
  int<lower=1, upper=NY-1> NOBS; //no of observed y 
  int<lower=1>             NCOEF; //no of regression coefficients
  vector[NOBS]             YOBS; 
  real                     MU[NY];
  real                     SIGMA[NY];
  real                     COEF[NCOEF];

  real                     ETA;
  int<lower=0, upper=1>    IMIS[NY];
  int<lower=1, upper=NY>   INX[NY];
}

parameters{
  vector[NY-NOBS] YMIS;
}

model {
  YMIS ~ cond(YOBS, COEF, NY, MU, SIGMA, IMIS, INX, ETA);
}
