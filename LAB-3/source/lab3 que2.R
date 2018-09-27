attach(Auto)
#this will allow the object to mask the GlobalEnvironment of name 
mpg01 <- rep(0, length(mpg))
#finds all values with values of 0
mpg01[mpg > median(mpg)] <- 1
# replaces values with 1 for mpg > median of mpg
Auto <- data.frame(Auto, mpg01)
#stores that values to data frame

cor(Auto[, -9])

pairs(Auto)
#it gets the plot between all

boxplot(cylinders ~ mpg01, data = Auto, main = "Cylinders vs mpg01")
## here we get a box plot for the values of 0 and 1 when ploted between cylinders and mpg01

boxplot(displacement ~ mpg01, data = Auto, main = "Displacement vs mpg01")
## here we get a box plot for the values of 0 and 1 when ploted between Displacement and mpg01

boxplot(horsepower ~ mpg01, data = Auto, main = "Horsepower vs mpg01")
## here we get a box plot for the values of 0 and 1 when ploted between Horsepower and mpg01

boxplot(acceleration ~ mpg01, data = Auto, main = "Acceleration vs mpg01")
## here we get a box plot for the values of 0 and 1 when ploted between Acceleration and mpg01

boxplot(year ~ mpg01, data = Auto, main = "Year vs mpg01")
## here we get a box plot for the values of 0 and 1 when ploted between Year and mpg01

train <- (year %% 2 == 0)
#to check weather even or not 
Auto.train <- Auto[train, ]
# all data of even Years
Auto.test <- Auto[!train, ]
#all data of odd Years
mpg01.test <- mpg01[!train]
#all mpg values of odd Years

library(MASS)
# importing the library named MASS as LDA and QDA are under mass library

fit.lda <- lda(mpg01 ~ cylinders + weight + displacement + horsepower, data = Auto, subset = train)
fit.lda
#Linear Discriminant Analysis

pred.lda <- predict(fit.lda, Auto.test)
table(pred.lda$class, mpg01.test)
#Prediction of Linear Discriminant Analysis

mean(pred.lda$class != mpg01.test)
# this redicts the test error 

fit.qda <- qda(mpg01 ~ cylinders + weight + displacement + horsepower, data = Auto, subset = train)
fit.qda
#Quadratic Discriminant Analysis

pred.qda <- predict(fit.qda, Auto.test)
table(pred.qda$class, mpg01.test)
#Prediction of Quadratic Discriminant Analysis

mean(pred.qda$class != mpg01.test)
# this redicts the test error 

fit.glm <- glm(mpg01 ~ cylinders + weight + displacement + horsepower, data = Auto, family = binomial, subset = train)
summary(fit.glm)
#linear models

probs <- predict(fit.glm, Auto.test, type = "response")
pred.glm <- rep(0, length(probs))
pred.glm[probs > 0.5] <- 1
table(pred.glm, mpg01.test)

mean(pred.glm != mpg01.test)
# this redicts the test error 

library(class)
# importing the library named class as KNN function is under mass library

train.X <- cbind(cylinders, weight, displacement, horsepower)[train, ]
test.X <- cbind(cylinders, weight, displacement, horsepower)[!train, ]
train.mpg01 <- mpg01[train]
#stores values of mpg values of 0 and 1's
set.seed(1)

#k = 1 of the KNN function
pred.knn <- knn(train.X, test.X, train.mpg01, k = 1)
table(pred.knn, mpg01.test)

mean(pred.knn != mpg01.test)
plot(pred.knn)
#We may conclude that we have a test error rate of 15.3846154% for K=1.

#k = 10 of the KNN function
pred.knn <- knn(train.X, test.X, train.mpg01, k = 10)
table(pred.knn, mpg01.test)

mean(pred.knn != mpg01.test)
plot(pred.knn)
     
#We may conclude that we have a test error rate of 16.4835165% for K=10.

#k = 100 of the KNN function
pred.knn <- knn(train.X, test.X, train.mpg01, k = 100)
table(pred.knn, mpg01.test)

mean(pred.knn != mpg01.test)
plot(pred.knn)
#We may conclude that we have a test error rate of 14.2857143% for K=100. So, a K value of 100 seems to perform the best.
