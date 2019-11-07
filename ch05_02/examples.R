library(tidyverse)

n <- 32
sd <- 5.6
mu.0 <- 30
y.hat <- 33

#pg 308
t <- (y.hat - mu.0) / (sd / sqrt(n))
t

#pg 309
ggplot(data.frame(x=c(-4,4)), aes(x=x)) +
  stat_function(fun=dt, args=list(df=n-1)) +
  stat_function(fun=dt, args=list(df=n-1), xlim=c(t, 5), geom="area")

#pg 310
p <- 1-pt(t, df=n-1)
p

p < 0.05

#pg 311
t.star <- qt(0.975,df=n-1)
t.star

ci <- c(y.hat - (t.star * (sd / sqrt(n))), y.hat + (t.star * (sd / sqrt(n))))
ci

#pg 312
speeds <- c(29,25,22,34,38,40,27,29,30,30,23,34,42,36,35,27,37)
length(speeds)
summary(speeds)
sd(speeds)
t.test(speeds,mu=30,alternative="greater")

#pg 313
t.test(speeds,mu=30)

t <- (mean(speeds) - 30) / (sd(speeds) / sqrt(length(speeds)))
t

p <- 1-pt(t,df=length(speeds)-1)
p

p < 0.05

ci <- c(mean(speeds) - ((qt(0.975,df=length(speeds)-1)) * (sd(speeds)/sqrt(length(speeds)))),
        mean(speeds) + ((qt(0.975,df=length(speeds)-1)) * (sd(speeds)/sqrt(length(speeds)))))
ci

#pg 314
t.test(speeds,mu=30)