library(tidyverse)

#pg 134
wx <- read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/kshd-2013.txt", delim="\t")  %>%
  janitor::clean_names()
summary(wx)
pairs(wx)

#pg 135-136
wx %>%
  ggplot() +
  geom_histogram(aes(x=wdsp), binwidth=1)

wx %>%
  ggplot(aes(sample=wdsp)) +
  stat_qq() +
  geom_qq_line()

sim.speeds <- data.frame(wind=round(rnorm(365,mean=4,sd=2),2))

left <- sim.speeds %>% ggplot() +
  geom_histogram(aes(x=wind), binwidth=1) +
  ggtitle("Simulated Wind Speed – N(4,2)")
right <- sim.speeds %>% ggplot(aes(sample=wind)) +
  stat_qq() + geom_qq_line() +
  ggtitle("Normal Q-Q Plot")

cowplot::plot_grid(left,right)

#pg 137
shapiro.test(wx$wdsp)
shapiro.test(sim.speeds$wind)

#pg 138
library("ggExtra")

df <- data.frame(sim=sim.speeds$wind, real=wx$wdsp)
p <- ggplot(df,aes(x=sort(sim),y=sort(real))) + geom_point()
ggMarginal(p + theme_gray(), type="histogram", fill="steelblue", col="darkblue")

#pg 138-139
perfect.x <- rnorm(10000,mean=10,sd=2)
perfect.y <- rnorm(10000,mean=10,sd=2)
df <- data.frame(x=perfect.x, y=perfect.y)
summary(df)
pairs(df)

p <- ggplot(df, aes(x=sort(x),y=sort(y))) + geom_point()
ggMarginal(p + theme_gray(), type="histogram", fill="steelblue", col="darkblue")
ggMarginal(p + theme_gray(), type="violin", fill="steelblue", col="darkblue")
ggMarginal(p + theme_gray(), type="densigram", fill="steelblue", col="darkblue")