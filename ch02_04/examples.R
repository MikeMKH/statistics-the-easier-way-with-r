library(tidyverse)

#pg 105
temps <- data.frame(temps = rnorm(40, mean=76, sd=9))
head(temps)
summary(temps)
fivenum(temps$temps)

#pg 108
top <- ggplot(data=temps, aes(y=temps)) +
  geom_boxplot() +
  theme_bw() +
  coord_flip() +
  ggtitle("Box Plot of Summer High Temps") +
  xlab("Temperature (F)") +
  ylab("")

bottom <- ggplot(data=temps, aes(x=temps)) +
  geom_histogram(color="black", fill="gray", binwidth=3) +
  theme_bw() +
  ggtitle("Histogram of Summer High Temps")

cowplot::plot_grid(top, bottom, ncol=1)

#pg 109-111
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  gender = sample(c("M", "F", "O"), size=29, replace=TRUE),
  age = runif(n=29, min=18, max=54)
)
head(dfx)
my.labels <- round(fivenum(dfx$age), digits=2)

boxplot(dfx$age, horizontal=TRUE, ylim=c(10,60),
        col="lightgray", add=FALSE, main="Distribution of Ages")
text(x=my.labels, y=c(1.15, 1.25, 1.25, 1.25, 1.15),labels=my.labels)

ggplot(dfx, aes(x="", y=age)) +
  geom_boxplot() +
  coord_flip() +
  theme_bw() +
  stat_summary(geom="text", fun.y=quantile, aes(label=sprintf("%1.1f",..y..)),
               position=position_nudge(x=0.42), size=5)