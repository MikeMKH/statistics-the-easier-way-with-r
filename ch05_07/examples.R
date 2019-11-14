library(tidyverse)

#pg 367
bus.n <- 206
bus.drink <- 71
bus.p <- bus.drink / bus.n
bus.q <- 1-bus.p

tech.n <- 170
tech.drink <- 46
tech.p <- tech.drink / tech.n
tech.q <- 1-tech.p

#pg 370-371
p <- (bus.drink + tech.drink) / (bus.n + tech.n)
q <- 1-p

bus.p.hat <- bus.drink / bus.n
tech.p.hat <- tech.drink / tech.n

z <- (bus.p.hat - tech.p.hat) / sqrt(p*q*(1/bus.n + 1/tech.n))

ggplot(data.frame(x=c(-4,4)), aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm, xlim=c(z,4), geom="area")

#pg 372
1-pnorm(z)

#pg 373
ci <- c((bus.p.hat-tech.p.hat) - (1.96*sqrt((bus.p*bus.q/bus.n)+(tech.p*tech.q/tech.n))),
        (bus.p.hat-tech.p.hat) + (1.96*sqrt((bus.p*bus.q/bus.n)+(tech.p*tech.q/tech.n))))

#pg 374
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/z2test.R")
z2.test(x1=bus.drink,x2=tech.drink,n1=bus.n,n2=tech.n,alternative="greater")

#pg 376-377
prop.test(x=c(bus.drink,tech.drink),n=c(bus.n,tech.n),
          alternative="greater")
prop.test(x=c(bus.drink,tech.drink),n=c(bus.n,tech.n),
          alternative="greater",correct=FALSE)
prop.test(x=c(bus.drink,tech.drink),n=c(bus.n,tech.n))

#pg 379
1-pchisq(2.386,df=1)
prop.test(x=c(bus.drink,tech.drink),n=c(bus.n,tech.n),
          correct=FALSE)