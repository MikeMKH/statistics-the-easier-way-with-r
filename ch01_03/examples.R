#pg 16
p <- dbinom(0:10, size=10, prob=0.5)
i <- seq(0:10)
df.discrete <- data.frame(i,p)
summary(df.discrete)

x <- seq(0,10,length=100)
y <- dnorm(x,mean=5,sd=2)
df.cont <- data.frame(x,y)
summary(df.cont)

library(ggplot2)
library(dplyr)

plot1 <- df.discrete %>% ggplot(aes(x=i,y=p)) +
  geom_bar(stat="identity", width=0.1) +
  ggtitle("Discrete Distribution") +
  xlim(0,10)
plot2 <- df.cont %>% ggplot(aes(x=x,y=y)) +
  geom_line() +
  ggtitle("Continuous Distribution")

library(cowplot)
plot_grid(plot1, plot2)