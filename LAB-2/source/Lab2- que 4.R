
data(Carseats)
# A simulated data set containing sales of child car seats at 400 different stores

fit3 <- lm(Sales ~ Price + Urban + US, data = Carseats)
summary(fit3)
#Where lm is the linear models ans we determine that, Sales = (Price + Urban + US) + C

fit4 <- lm(Sales ~ Price + US, data = Carseats)
summary(fit4)
#Where lm is the linear models ans we determine that, Sales = (Price + US) + C4

confint(fit4)
#Computes confidence intervals for one or more parameters in a fitted model. There is a default and a method for objects inheriting from class "lm"

par(mfrow = c(2, 2))
plot(fit4)

