#pg 25
mean(c(1,2,3,4,5,6,7,8))

x <- c(1,2,3,4,5,6,7,8)
mean(x)
median(x)
mode(x)

median(c(1,2,3,4,5,6,7,8,9))
median(c(1,2,3,4,5,6,7,8,9,10,11,12))

#pg 27-28
x <- round(runif(100,1,10))
summary(x)
table(x)
y <- sort(table(x))
y
mode.value <- max(y)
mode.value
mode.names <- names(y[y==max(y)])
mode.names

x <- sample(c("RED","GREEN","CHRISTMAS"), 100, replace=TRUE)
head(x)
y <- sort(table(x))
y
names(y[y==max(y)])

# meaning less mode
x <- runif(5,1,10)
x
y <- sort(table(x))
y
names(y[y==max(y)]) # everything

#pg 31
x <- runif(100,1,10)
summary(x)
var(x)
sd(x)
sd(x) == sqrt(var(x))

# https://en.wikipedia.org/wiki/Geometric_mean
library(psych)

x <- c(2,8)
x
mean(x)
geometric.mean(x)
harmonic.mean(x)

x <- c(4,1,1/32)
x
mean(x)
geometric.mean(x)
harmonic.mean(x)

a <- c(1,1000)
mean(a)
geometric.mean(a)
harmonic.mean(a)

b <- c(10,100)
mean(b)
geometric.mean(b)
harmonic.mean(b)

c <- c(20,20)
mean(c)
geometric.mean(c)
harmonic.mean(c)