library(tidyverse)
library(janitor)

#pg 431
(shd <- janitor::clean_names(
  read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/kshd-2013.txt", delim="\t1")))

#pg 432
(slope <- cor(shd$dewp, shd$temp) * (sd(shd$dewp)/sd(shd$temp)))
(intercept <- mean(shd$dewp) - (slope*mean(shd$temp)))

fit <- lm(dewp~temp,data=shd)
shd$residuals <- resid(fit)
summary(fit)

#pg 433
left <- shd %>% 
  ggplot(aes(x=temp, y=dewp)) +
  geom_point() +
  geom_smooth(aes(color="red"), se=FALSE, method="lm") +
  ggtitle("Dewpoint vs. Temperature") +
  theme(legend.position="none")
right <- shd %>%
  ggplot(aes(x=temp, y=residuals)) +
  geom_point() +
  geom_hline(yintercept=0) +
  ggtitle("Residuals")
cowplot::plot_grid(left,right)

#pg 436
cor(shd$dewp,shd$temp)
cor(shd$dewp,shd$temp)^2

summary(fit)$r.squared

#pg 437
par(mfrow=c(2,2))
plot(fit)

aov(fit)

#pg 439
df <- data.frame(age=c(21,24,25,32), number.of.kids=c(1,2,4,5))
children <- lm(df$number.of.kids~df$age)
df$residuals <- resid(children)
summary(children)

par(mfrow=c(2,2))
plot(children)

left <- df %>%
  ggplot(aes(x=age, y=number.of.kids)) +
  geom_point(size=5) +
  geom_smooth(aes(color="red"), se=FALSE, method="lm") +
  ggtitle("# of Kids by Mother's Age at Birth") +
  theme(legend.position="none")

right <- df %>%
  ggplot(aes(x=age, y=residuals)) +
  geom_point() +
  geom_hline(yintercept=0) +
  ggtitle("Residuals")

cowplot::plot_grid(left,right)

aov(children)