library(tidyverse)
library(janitor)

#pg 443
wx <- read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/kshd-2013.txt", delim="\t") %>%
  janitor::clean_names()
summary(wx)

#pg 444-445
summary(
  fit1 <- lm(dewp~.,data=wx)
)

summary(
  fit2 <- lm(dewp~yearmoda+temp+visib+wdsp+min+prcp,data=wx)
)

#pg 446
anova(fit1,fit2)

#pg 447
anova(fit1)
anova(fit2)

summary(
  fit3 <- lm(dewp~yearmoda+temp+visib,data=wx)
)

summary(
  fit4 <- lm(dewp~temp+visib,data=wx)
)

anova(fit3,fit4)

anova(fit3)
anova(fit4)