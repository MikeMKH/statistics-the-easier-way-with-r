library(tidyverse)

#pg 424
(coffee <- read_csv("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/coffee.csv"))
summary(coffee)

#pg 425
(coffee %>%
  mutate(total=mrating+nrating) %>%
  mutate_at(vars(who, milk, coffee, scoops), funs(factor)) -> coffee)

model <- aov(total~scoops*coffee,data=coffee)
summary(model)

#pg 426
coffee.model <- aov(total~coffee,data=coffee)
summary(coffee.model)

plot(TukeyHSD(coffee.model),las=2,cex.aix=0.6)

scoops.model <- aov(total~scoops,data=coffee)
summary(scoops.model)

plot(TukeyHSD(scoops.model),las=2,cex.aix=0.6)