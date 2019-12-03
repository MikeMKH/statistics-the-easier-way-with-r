library(tidyverse)
library(janitor)
library(lubridate)
library(car)

#pg 452-453
(wx <-
    read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/kshd-2013.txt", delim="\t") %>%
    janitor::clean_names() %>%
    mutate(yearmoda = ymd(yearmoda)) %>%
    filter(between(yearmoda,as.Date("2013-05-31"), as.Date("2013-08-31"))))
  
simple.fit <- lm(max~visib,data=wx)
summary(simple.fit)
ncvTest(simple.fit)

#pg 454
multiple.fit <- lm(max~.,data=wx)
summary(multiple.fit)
ncvTest(multiple.fit)

#pg 457
iv <- wx$visib
est.beta <- simple.fit$coefficients[2]
ss.xx <- sum( ((iv-mean(iv))^2 ))
se <- sqrt((sum((simple.fit$residuals^2)) / (length(iv)-2)))
( t <- est.beta / (se / sqrt(ss.xx)) )

-0.51156/0.31581

#pg 458
ggplot(data.frame(x=c(-5,5)), aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm, xlim=c(1.62, 5), geom="area") +
  stat_function(fun=dnorm, xlim=c(-5, -1.62), geom="area")

#pg 459
(1-pt(1.65, df=91))*2
pt(-1.62, df=91)*2

#pg 460
iv <- wx$visib
est.alpha <- simple.fit$coefficients[1]
ss.xx <- sum( ((iv-mean(iv))^2 ))
se <- sqrt((sum((simple.fit$residuals^2)) / (length(iv)-2)))
sum.xs <- sum(wx$visib^2)
( t <- est.alpha/ (se* sqrt(sum.xs/(93*ss.xx))) )

#pg 461
(1-pt(22.648, df=91))*2

#pg 462
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/plotaddci.R")
plot(wx$visib, wx$max, pch=16, main="Max Temp vs. Visibility (Summer)")
plot.add.ci(wx$visib, wx$max, interval="confidence", level=0.95, lwd=3, col="red")