#pg 253
qt(0.95,df=29)
qt(0.95,df=1000)

qt(0.975,df=29)
qt(0.975,df=1000)

qt(0.995,df=29)
qt(0.995,df=1000)

#pg 256
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/citwomeans.R")

ci.twomeans(ybar1=86.71,ybar2=78.57,
            n1=7,n2=7,
            sd1=6.45,sd2=7.85,
            conf.level=.99, vname="difference between test scores")

#pg 257
x <- c(84,89,77,81,95,93,88)
summary(x)
y <- c(79,82,90,65,83,74,77)
summary(y)

var.test(x,y)$p.value
ci.twomeans(ybar1=mean(x),ybar2=mean(y),
            n1=length(x),n2=length(y),
            sd1=sd(x),sd2=sd(y),
            conf.level=.99)

ci.twomeans(ybar1=0.42,n1=(10*250),sd1=16.63,
            ybar2=1.1,n2=(10*250),sd2=12.51,
            conf.level=.995)$cint
ci.twomeans(ybar1=0.42,n1=(10*250),sd1=16.63,
            ybar2=1.1,n2=(10*250),sd2=12.51,
            conf.level=.90)$cint