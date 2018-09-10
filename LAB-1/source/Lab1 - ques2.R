Auto <- read.csv("C:\\Users\\Yuvesh\\Desktop\\Auto.csv", header=T, na.strings="?")
# to elimate the missing data 
Auto <- na.omit(Auto)
dim(Auto)
#summayrising the data at the end 
summary(Auto)

# (a)
# quantitative: mpg, cylinders, displacement, horsepower, weight,acceleration, year
# qualitative: name, origin

#(b)

# apply the range function to the first eight columns of Auto
sapply(Auto[, 1:8], range)

# (c)
# apply the mean function to the first eight columns of Auto
sapply(Auto[, 1:8], mean)

## apply the standard deviation function to the first eight columns of Auto
sapply(Auto[, 1:8], sd)

# (d)
# to delete 10th coloumn
newAuto <- Auto[-10,]
# to delete 85th coloumn
newAuto <- newAuto[-85,]

# apply the range function to the first eight columns of new Auto after deleting 10th row 
sapply(newAuto[, 1:8], range)

# apply the mean function to the first eight columns of new Auto after deleting 10th row
sapply(newAuto[, 1:8], mean)

## apply the  function to the first eight columns of new Auto after deleting 10th row
sapply(newAuto[, 1:8], sd)

# (e)
pairs(Auto)

plot(Auto$mpg, Auto$weight)
# Heavier weight correlates with lower mpg.
plot(Auto$mpg, Auto$cylinders)
# More cylinders, less mpg.
plot(Auto$mpg, Auto$year)
# Cars become more efficient over time.

# (f)
pairs(Auto)
# See  plots .
