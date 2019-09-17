#pg 61
library(tidyverse)

x <- seq(-4, 4, length=500)
df <- data.frame(x, dnorm(x, mean=0, sd=1))
names(df) <- c("x", "y")
ggplot(df, aes(x=x, y=y)) + geom_line() +
  ggtitle("Standard Normal Model: N(0, 1)")

#pg 65
library(cowplot)
labels <- c("P[-1 < z < 1]=68%","P[-2 < z < 2]=95%","P[-3 < z < 3]=99.7%")
first <- ggplot(data.frame(x=c(-4,4)), aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm, xlim=c(-1,1), geom="area") +
  ggtitle(labels[1])
second <- ggplot(data.frame(x=c(-4,4)), aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm, xlim=c(-2,2), geom="area") +
  ggtitle(labels[2])
third <- ggplot(data.frame(x=c(-4,4)), aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm, xlim=c(-3,3), geom="area") +
  ggtitle(labels[3])
cowplot::plot_grid(first, second, third, nrow=1)

#pg 73
x <- seq(20, 80, 0.05)
df <- data.frame(x=x, y=dnorm((x-47.3)/(9.3)) )
ggplot(df, aes(x=x,y=y)) + geom_line() + geom_vline(xintercept=50) +
  geom_area(mapping=aes(ifelse(x<50, x, 0)), fill="red", alpha=0.2) +
  xlim(20,80)

#pg 74
pnorm(50, mean=47.3, sd=9.3)

#pg 78
labels <- c("This Area", "Minus THIS Area", "Equals THIS Area")
x <- seq(20, 80, 0.05)
df <- data.frame( x=x, y=dnorm((x-47.3)/(9.3)) )
plot1 <- ggplot(df, aes(x=x,y=y)) + geom_line() +
  geom_area(mapping=aes(ifelse(x<60,x,0)), fill="black", alpha=0.2) +
  xlim(20,80) + ggtitle(labels[1])
plot2 <- ggplot(df, aes(x=x,y=y)) + geom_line() +
  geom_area(mapping=aes(ifelse(x<40,x,0)), fill="black", alpha=0.2) +
  xlim(20,80) + ggtitle(labels[2])
plot3 <- ggplot(df, aes(x=x,y=y)) + geom_line() +
  geom_area(mapping=aes(ifelse(x>40 & x<60,x,0)),
            fill="black", alpha=0.2) +
  xlim(20,80) + ggtitle(labels[3])
cowplot::plot_grid(plot1,plot2,plot3,nrow=1)

pnorm(60, mean=47.3, sd=9.3) - pnorm(40, mean=47.3, sd=9.3)

#pg 80
x <- seq(60, 100, .05)
ggplot(data.frame( x=x, y=dnorm((x-78)/(5)) ), aes(x=x,y=y)) +
  geom_line() +
  geom_area(mapping=aes(ifelse(x<85, x, 0)), fill="black", alpha=0.2) +
  xlim(60,100)

pnorm(85, mean=78, sd=5)

#pg 81-82
x <- seq(2.98, 3.02, 0.0005)
ggplot(data.frame(x=x, y=dnorm((x-3)/(0.005)) ), aes(x=x,y=y)) +
  geom_line() +
  geom_area(mapping=aes(ifelse(x<2.99,x,0)), fill="black", alpha=0.2) +
  geom_area(mapping=aes(ifelse(x>3.01,x,0)), fill="black", alpha=0.2) +
  xlim(2.98,3.02)

z <- (2.99 - 3.00) / 0.005
z #-2
pnorm(-2) * 2
pnorm(2.99, mean=3, sd=0.005) * 2