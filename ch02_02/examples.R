library(tidyverse)

#pg 93 - 94
x <- rbeta(5000,5,2)
summary(x)
sd(x)
var(x)

ggplot() +
  geom_histogram(aes(x=x), binwidth=0.1, color="black", fill="gray") +
  ggtitle("Histogram of x") +
  theme_bw()

#pg 95
par(mfrow=c(1,2))
hist(x, col="gray", xlab="Our Randomly Sampled Values",
     ylab="Frequency of Occurrence", main="Frequency")
hist(x, col="gray", freq=FALSE, xlab="Our Randomly Sampled Values",
     ylab="Density", main="Density")
lines(density(x),lty="dotted", lwd=3)

# S&P 500 simulated
x <- rnorm(5000, 9, 15)
summary(x)
sd(x)
var(x)

ggplot() +
  geom_histogram(aes(x=x), binwidth=5, color="black", fill="gray") +
  ggtitle("Simulated S&P 500 returns") +
  theme_bw()