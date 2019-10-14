\name{lss}
\alias{lss}
\alias{lss.eres}
\alias{lss.betag}
\alias{print.lss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ the accelerated failure time model to right censored data based on least-squares principle }
\description{
  Due to lack of proper inference procedure and software, the ordinary linear regression model is seldom used in practice for the analysis of right censored data. This package presents an S-Plus/R program that implements a recently developed inference procedure (Jin, Lin and Ying, 2006) for the accelerated failure time model based on the least-squares principle.
}
\usage{
lss(formula, data, subset, trace = FALSE, mcsize = 500, maxiter = 10, tolerance
= 0.001, gehanonly = FALSE, cov = FALSE, na.action = na.exclude)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{ specifies a model to be fitted. The response and covariates of the model are separated by a ~ operator. The response, on the left side of ~, should be a Surv object with two columns, of which the first column is the survival time or censored time and the second column is the censoring indicator. The covariates or predictors X, on the right side of ~, should be columns with the same length as Surv object. eg: lss(Surv(time, status)~)}
  \item{data}{ a data frame which contains the Surv objects
and covariates.
 }
 \item{subset}{
specifies subset of the original data
frame that should be used for the model fit.
 }
  \item{trace}{
takes logical values T or F. If it is set to be T, then the summary of every iteration will
be kept. The default is F.
 }
  \item{mcsize}{ specifies the resampling number. The default is 500. }
  \item{maxiter}{
specifies the maximum iteration number.
The iterations will be stopped after maxiter iterations if the
convergence criterion is not met. The default is 50.
 }
  \item{tolerance}{
specifies the value of convergence criterion. The default is 0.001.
 }
  \item{gehanonly}{
takes logical values T or F.
If gehanonly=T, only Gehan estimator will be
calculated and the least-squares estimator will
not be calculated. The default is gehanonly=F.
 }
  \item{cov}{
takes logical values T or F.
If cov=T, the covariance matrices of the Gehen estimator and
the least-squares estimator will be printed. The default is cov=F.
 }
  \item{na.action}{
takes values na.exclude or na.fail.
The default is na.exclude, which deletes the observations with
missing values. The other choice is na.fail, which returns an
error if any missing values are found.
 }
}

\value{
 The Gehan estimator, the standard error of the Gehan estimator, the Z score and the p-value for testing
the hypothesis of beta=0 based on Gehan estimation.
 The least-squares estimator, the standard error of the least-squares estimator,
the Z score and the p-value for testing the hypothesis of
beta=0.
 The covariance matrices of
the Gehan estimator and the least-squares estimator, when cov
is set to be T.
}
\references{
Z. Jin, D. Y. Lin, Z. Ying, On least-squares regression with censored
data, {Biometrika} 93 (2006) 147-161.
 }
\author{ Zhezhen Jin; Arvin Satwani }
\examples{
library(survival)
data(stanford2)
fit1<-lss(cbind(log10(time),status) ~ age + t5,data=stanford2,subset=!is.na(t5), mcsize=100,
trace=TRUE,gehanonly=FALSE,maxiter=10,tolerance=0.001)
fit2<-lss(cbind(log10(time),status) ~ age + I(age^2),data=stanford2,subset=!is.na(t5)&time>=100,
mcsize=5,trace=TRUE, gehanonly=FALSE,cov=TRUE)

}
\keyword{survival }%
