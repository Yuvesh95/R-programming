Auto <- read.csv("C:\\Users\\Yuvesh\\Desktop\\Fall 2018\\ISL\\Auto.csv", header=T, na.strings="?")
# to elimate the missing data 
Auto <- na.omit(Auto)
#summary of a given data set is given for the auto.csv dataframe
summary(Auto)

pairs(Auto)
#A matrix of scatterplots is produced

names(Auto)
# this is a command which makes the titles to be printed

cor(Auto[1:8])
#Correlation, Variance and Covariance

fit2 <- lm(mpg ~ . - name, data = Auto)
#linear models is lm
summary(fit2)

plot(fit2)

fit3 <- lm(mpg ~ cylinders * displacement+displacement * weight, data = Auto[, 1:8])
#linear models is lm, where formula is mpg = horsepower + c
summary(fit3)

par(mfrow = c(1, 2))
plot(fit3)
#par is used for making more plots visible with one command 

par(mfrow = c(2, 2))
plot(log(Auto$horsepower), Auto$mpg)
plot(sqrt(Auto$horsepower), Auto$mpg)
plot((Auto$horsepower)^2, Auto$mpg)
# we see that log plot is most linear