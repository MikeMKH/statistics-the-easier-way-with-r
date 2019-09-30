library(tidyverse)
library(janitor)

#pg 140
wx <- read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/kshd-2013.txt", delim="\t") %>%
  janitor::clean_names()
summary(wx)
pairs(wx)

#pg 141
wx %>%
  ggplot(aes(x=temp, y=dewp)) +
  geom_point() +
  ggtitle("Dewpoint vs. Temperature") +
  xlab("Temperature (F)") +
  ylab("Dewpoint (F)")

#pg 142-144
i <- 1:10
xi <- c(1,2,3,4,5,6,7,8,9,10)
yi <- c(.8,2.1,2.9,3.8,5.3,6,6.9,8.1,9.3,9.9)

data.frame(xi,yi) %>%
  ggplot(aes(x=xi,y=yi)) +
  geom_point(size=5)

xbar <- mean(xi)
ybar <- mean(yi)
xi.minus.xbar <- xi - xbar
yi.minus.ybar <- yi - ybar
xdiff.x.ydiff <- xi.minus.xbar * yi.minus.ybar

data.frame(data=xdiff.x.ydiff) %>%
  ggplot(aes(x=data)) +
  geom_histogram(binwidth=1)

df <- cbind(i,xi,yi,xi.minus.xbar,yi.minus.ybar,xdiff.x.ydiff)
df

sum(xdiff.x.ydiff)/(length(xdiff.x.ydiff)-1) #cov
cov(xi,yi)

cov(xi,yi)/(sd(xi)*sd(yi)) #cor
cor(xi,yi)

#pg 144-147
library(lubridate)
wx

wx$yearmoda <- ymd(wx$yearmoda)
wx

winter <- interval(ymd("2013-01-01"), ymd("2013-03-20"))
spring <- interval(ymd("2013-03-21"), ymd("2013-06-20"))
summer <- interval(ymd("2013-06-21"), ymd("2013-09-20"))
autumn <- interval(ymd("2013-09-21"), ymd("2013-12-20"))
wintr2 <- interval(ymd("2013-12-21"), ymd("2013-12-31"))

wx <- wx %>%
  mutate(season = case_when(
  wx$yearmoda %within% winter ~"winter",
  wx$yearmoda %within% spring ~"spring",
  wx$yearmoda %within% summer ~"summer",
  wx$yearmoda %within% autumn ~"autumn",
  wx$yearmoda %within% wintr2 ~"winter"))

left <- wx %>%
  ggplot(aes(x=temp, y=dewp, color=season)) +
  geom_point(size=3)
right <- wx %>%
  ggplot(aes(x=temp, y=dewp, shape=season)) +
  geom_point(size=3)
cowplot::plot_grid(left,right)

wx %>% 
  ggplot(aes(x=temp, y=dewp, shape=season)) +
  geom_point(size=3) +
  scale_shape_manual(values=c(0,7,15,20))

#pg 148
library(GGally)
ggpairs(wx[,2:10])