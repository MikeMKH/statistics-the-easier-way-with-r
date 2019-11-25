library(tidyverse)

#pg 417
scores <- read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/anova-textbooks.txt", delim="\t1")
summary(scores)

attach(scores)
mean(score)
(dev.from.grand.mean <- (score - mean(score))^2)
(sst <- sum(dev.from.grand.mean))

#pg 419
(scores %>%
    group_by(textbook) %>%
    summarize(mean=mean(score))
  -> group.means)

(group.dev.from.grand.mean <- ((group.means$mean - mean(score))^2)*16)
(ssb <- sum(group.dev.from.grand.mean))

(msb <- ssb/2)
(ssw <- sst-ssb)
(msw <- ssw/(48-3))

(F <- msb/msw)
detach(scores)

#pg 420
ggplot(data.frame(x=c(0,10)), aes(x=x)) +
  stat_function(fun=df, args=list(df1=2, df2=45)) +
  stat_function(fun=df, args=list(df1=2, df2=45), xlim=c(F,10), geom="area")

(p <- 1-pf(F,2,45))

#pg 421
scores %>%
  ggplot(aes(x=textbook,y=score,group=textbook)) +
  geom_boxplot() +
  ggtitle("Scores by Textbook Choice")

#pg 422
scores$textbook <- as.factor(scores$textbook)
model <- aov(score~textbook,data=scores)
summary(model)

#pg 423
TukeyHSD(model)

#pg 424
par(mfrow=c(1,3))
plot(TukeyHSD(model,conf.level=0.95))
plot(TukeyHSD(model,conf.level=0.99))
plot(TukeyHSD(model,conf.level=0.999))