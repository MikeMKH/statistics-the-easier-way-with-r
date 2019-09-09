#pg 34
library(tidyverse)
tvs <- read_csv("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/tvs-201407.csv")
summary(tvs)
tvs

#pg 36
sub.tvs <- tvs %>% select(DEPTH,TOP,MAX_SHEAR)
summary(sub.tvs)

#pg 37
sub.tvs %>%
  summarise(sd=sd(DEPTH))
sub.tvs %>%
  summarise(var=var(DEPTH))

source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/mode.R")
mode(c(2,3,4,4,4,4,5,6))

sub.tvs %>%
  summarise(mode=mode(TOP))

#pg 38
library(pastecs)
stat.desc(sub.tvs)

options(scipen=100)
options(digits=3)
stat.desc(sub.tvs)

options(scipen=99)
stat.desc(sub.tvs, norm=TRUE, p=0.99)