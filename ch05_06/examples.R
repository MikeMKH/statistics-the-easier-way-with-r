library(tidyverse)

#pg 355
n <- 360
p.hat <- 312/n
p0 <- 0.9
q0 <- 1-p0

z <- (p.hat-p0) / sqrt((p0*q0)/n)

#pg 356
ggplot(data.frame(x=c(-4,4)), aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm, xlim=c(-4,-2.09), geom="area")

#pg 357
pnorm(z)

#pg 360-361
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/ztest.R")
z.test(312,360)
z.test(312,360,p=0.9)

z.test(312,360,p=0.9)$cint

#pg 362-363
prop.test(312,360)
prop.test(312,360,correct=FALSE)
prop.test(312,360,p=0.9,alt="less",correct=FALSE)

#pg 364
binom.test(312,360,p=0.9)