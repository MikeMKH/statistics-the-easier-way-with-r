library(tidyverse)

#pg 342
temps <- read_csv("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/comp-temps.csv", col_types=cols(date=col_date("%Y%m%d")))
summary(temps)
pairs(temps)

#pg 343
sample.temps <- sample_n(temps,30)
summary(sample.temps)
pairs(sample.temps)

left <- ggplot() +
  geom_bar(aes(x=sample.temps$diff)) +
  ggtitle("Histogram of scores")
right <- ggplot() +
  geom_qq(aes(sample=sample.temps$diff)) +
  geom_qq_line(aes(sample=sample.temps$diff)) +
  ggtitle("Normal Q-Q Plot")
cowplot::plot_grid(left,right)

#pg 346
sample.temps %>%
  summarise(mean=mean(diff), sd=sd(diff))

t <- (mean(sample.temps$diff) - 0) /
  (sd(sample.temps$diff) / sqrt(length(sample.temps$diff)))
t

d <- length(sample.temps$diff)-1
d

ggplot(data.frame(x=c(-5,5)), aes(x=x)) +
  stat_function(fun=dt, args=list(df=d)) +
  stat_function(fun=dt, args=list(df=d), xlim=c(t,5), geom="area")

#pg 347
1-pt(t,df=d)

#pg 349-350
t.test(sample.temps$cho, sample.temps$shd, paired=TRUE, alternative="greater")
t.test(sample.temps$cho, sample.temps$shd, paired=TRUE)