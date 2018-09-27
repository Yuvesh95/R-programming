library(ISLR)
# importing the library named ISLR

summary(Weekly)
# the summary of a data frame in ISLR which is a Weekly percentage returns for the S&P 500 stock index between 1990 and 2010

Weekly
#with this command we can see the data fram of "weekly" but the data fram is very long  

cor(Weekly[, -9])


plot(Volume)

plot(Direction)
#to see the total number of up's and down's

plot(Year,Volume,type ="h",xlab="Year",ylab="volume",main="Year Vs Volume")
# total volumes per year

fit.glm <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Weekly, family = binomial)
#making a linear regression with "Direction" as the response and the five lag variables plus "Volume" 
summary(fit.glm)

probs <- predict(fit.glm, type = "response")
pred.glm <- rep("Down", length(probs))
pred.glm[probs > 0.5] <- "Up"
table(pred.glm, Direction)

train <- (Year < 2009)
Weekly.20092010 <- Weekly[!train, ]
Direction.20092010 <- Direction[!train]
fit.glm2 <- glm(Direction ~ Lag2, data = Weekly, family = binomial, subset = train)
summary(fit.glm2)

probs2 <- predict(fit.glm2, Weekly.20092010, type = "response")
pred.glm2 <- rep("Down", length(probs2))
pred.glm2[probs2 > 0.5] <- "Up"
table(pred.glm2, Direction.20092010)


library(MASS)
# importing the library named MASS as LDA and QDA are under mass library

#Linear Discriminant Analysis
fit.lda <- lda(Direction ~ Lag2, data = Weekly, subset = train)
fit.lda

pred.lda <- predict(fit.lda, Weekly.20092010)
table(pred.lda$class, Direction.20092010)


#Quadratic discriminant analysis.
fit.qda <- qda(Direction ~ Lag2, data = Weekly, subset = train)
fit.qda

pred.qda <- predict(fit.qda, Weekly.20092010)
table(pred.qda$class, Direction.20092010)

library(class)
# importing the library named class as KNN function is under mass library
train.X <- as.matrix(Lag2[train])
test.X <- as.matrix(Lag2[!train])

train.Direction <- Direction[train]
#stores up's and down's
set.seed(1)
pred.knn <- knn(train.X, test.X, train.Direction, k = 1)
#k = 1 of the KNN function 

table(pred.knn, Direction.20092010)

# Logistic regression with Lag2:Lag1
fit.glm3 <- glm(Direction ~ Lag2:Lag1, data = Weekly, family = binomial, subset = train)
probs3 <- predict(fit.glm3, Weekly.20092010, type = "response")
pred.glm3 <- rep("Down", length(probs3))
pred.glm3[probs3 > 0.5] = "Up"
table(pred.glm3, Direction.20092010)

mean(pred.glm3 == Direction.20092010)
#mean of the pred.glm3


