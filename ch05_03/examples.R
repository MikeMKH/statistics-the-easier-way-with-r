library(tidyverse)

#pg 317-318
foam <- read_csv("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/beer-foam.csv")
summary(foam)
foam

#pg 319
foam %>%
  ggplot(aes(x=tau)) +
  geom_histogram(aes(y=..count..),binwidth=25,color="black",fill="gray") +
  facet_grid(.~test.case,scales="free") +
  scale_x_continuous(limits=c(100,400))

#pg 321
var.test(
  foam[foam$test.case=="SH-COLD",]$tau,
  foam[foam$test.case=="SH-RT",]$tau) # p-value = 0.003049

var.test(
  foam[foam$test.case=="3B-COLD",]$tau,
  foam[foam$test.case=="3B-RT",]$tau) # p-value = 0.5862

#pg 323-324
foam %>%
  group_by(test.case) %>%
  summarize(sd=sd(tau),mean=mean(tau)) %>%
  mutate_if(is.numeric, format)

s.p <- sqrt(((39*55.53293^2)+(39*50.86631^2))/(40 +40-2))
s.p

t <- (221.1892-226.8597)/(s.p*sqrt(1/40 + 1/40))
t

#pg 324
ggplot(data.frame(x=c(-4,4)),aes(x=x)) +
  stat_function(fun=dnorm) +
  stat_function(fun=dnorm,xlim=c(t,4),geom="area")

#pg 326
ci <- c((221.1892-226.8597)-qt(0.975,df=39)*s.p*sqrt(1/40 + 1/40),
        (221.1892-226.8597)+qt(0.975,df=39)*s.p*sqrt(1/40 + 1/40))
ci

#pg 327-328
t.test(
  (foam %>% filter(test.case == "3B-COLD") %>% select(tau))$tau,
  (foam %>% filter(test.case == "3B-RT") %>% select(tau))$tau,
  alternative="greater",var.equal=TRUE)

t.test(
  (foam %>% filter(test.case == "3B-COLD") %>% select(tau))$tau,
  (foam %>% filter(test.case == "3B-RT") %>% select(tau))$tau,
  alternative="less",var.equal=TRUE)

t.test(
  (foam %>% filter(test.case == "3B-COLD") %>% select(tau))$tau,
  (foam %>% filter(test.case == "3B-RT") %>% select(tau))$tau,
  var.equal=TRUE)