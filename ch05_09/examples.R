library(tidyverse)

#pg 397
n <- 24
s <- 0.4
sigma.sq <- 0.12
t <- (n-1)*s^2 / sigma.sq

ggplot(data.frame(x=c(0,80)), aes(x=x)) +
  stat_function(fun=dchisq, args=list(df=(n-1))) +
  stat_function(fun=dchisq, args=list(df=(n-1)), xlim=c(t,80), geom="area") +
  annotate("text", x=50, y=0.05, cex=7, label="chi*{2} == 30.67", parse=TRUE)

p <- 1-pchisq(t,df=(n-1))
p < 0.05

#pg 398-399
ci <- c((n-1)*s^2 / qchisq(0.975,df=(n-1)),
        (n-1)*s^2 / qchisq(0.025,df=(n-1)))

#pg 399-400
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/chisqvar.R")
chisq.var(n,s^2,sigma.sq,alternative="greater")