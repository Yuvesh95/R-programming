set.seed(1)
x <- rnorm(100)
y <- 2 * x + rnorm(100)

fit5 <- lm(y ~ x + 0)
summary(fit5)
#linear models is lm, where formula is y=x + c

fit6 <- lm(x ~ y + 0)
summary(fit6)
#linear models is lm, where formula is x=y + c

n <- length(x)
t <- sqrt(n - 1)*(x %*% y)/sqrt(sum(x^2) * sum(y^2) - (x %*% y)^2)
as.numeric(t)

fit7 <- lm(y ~ x)
summary(fit7)
#linear models is lm, where formula is y=x + c

fit8 <- lm(x ~ y)
summary(fit8)
#linear models is lm, where formula is x=y + c

