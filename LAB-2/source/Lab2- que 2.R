Auto <- read.csv("C:\\Users\\Yuvesh\\Desktop\\Fall 2018\\ISL\\Auto.csv", header=T, na.strings="?")
# to elimate the missing data 
Auto <- na.omit(Auto)
#summary of a given data set is given for the auto.csv dataframe
summary(Auto)

#install.packages('ISLR')
#the above command is used if the LSLR package is not installed in the R studio before
library(ISLR)
#calling the function ISLR
data(Auto)

fit <- lm(mpg ~ horsepower, data = Auto)
#linear models is lm, where formula is mpg = horsepower + c

summary(fit)

mean(Auto$mpg)
# here we use for the calculating the value of strong is the relationship between the predictor and the response

predict(fit, data.frame(horsepower = 98), interval = "confidence")
#under the interval of confidence 

predict(fit, data.frame(horsepower = 98), interval = "prediction")
# under the interval of presiction

plot(Auto$horsepower, Auto$mpg, main = "Scatterplot of mpg vs. horsepower", xlab = "horsepower", ylab = "mpg", col = "blue")
abline(fit, col = "red")
#abline function adds one or more straight lines through the current plot

#par is used for making more plots visible with one command 
par(mfrow = c(2, 2))
plot(fit)

