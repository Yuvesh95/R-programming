#using the required package
library(gdata)

# read csv file
mydata <- read.csv("C:\\Users\\Yuvesh\\Desktop\\College.csv")  
#printing the data
mydata
#get the row name and data to it 
rownames(mydata) <- mydata[,1]
rownames(mydata)
#use the 
fix(mydata)
# summary of data after fiing row
summary(mydata)

pairs(mydata[,1:10])
Elite <- rep("No",nrow(mydata))
Elite [mydata$Top10perc>50] <- "Yes"
Elite
Elite <- as.factor(Elite)
Elite
mydata <- data.frame(mydata, Elite)
summary(mydata$Elite)
mydata <- data.frame(mydata, Elite)
mydata
summary(mydata)
# histograms
par(mfrow=c(2,2))
hist(mydata$Apps)
hist(mydata$perc.alumni, col=2)
hist(mydata$S.F.Ratio, col=3, breaks=10)
hist(mydata$Expend, breaks=100)
# eploring the data 
plot(mydata$Outstate, mydata$Grad.Rate)
# High tuition correlates to high graduation rate.
plot(mydata$Accept / mydata$Apps, mydata$S.F.Ratio)
