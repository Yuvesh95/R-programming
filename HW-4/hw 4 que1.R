
#create vectors -- these will be our columns
a <- c(2.4,-6.6,0.4,6.4,1.4,-10.6,9.4,1.4)
b <- c(-0.6,3.4,9.4,7.4,1.4,4.4,4.4,4.4)


#create matrix from vectors
M <- cbind(a,b)

## b using the covariance function
cov(M)

#for inverse of a function wwe have a function in MASS library
library(MASS)

#create vectors -- these will be our columns
a <- c(40.73,5.16)
b <- c(5.16,8.73)

#create matrix from vectors
M <- cbind(a,b)

#for geting inverse funtion
ginv(M)