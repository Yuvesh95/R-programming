#create vectors -- these will be our columns
a <- matrix(data=c(-8,-2),1,2)
b <- c(0.0265,-0.0157)
c <- c(-0.0157,0.1238)
#d <- matrix(data=c(-1.142,-0.5714),1,2) # u1
d <- matrix(data=c(4.125,7.75),1,2) #u2
#create matrix from vectors
M <- cbind(b,c)
M
a
x <- a %*% M %*% t(d)

y <- 1/2 * (a %*% M %*% t(a) )

x-y+log(8/15)