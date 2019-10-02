library(tidyverse)

#pg 161
choices <- data.frame(name=c(1,2,3,4), value=c(2,5,13,6))
summary(choices)
choices %>%
  ggplot() +
  geom_bar(aes(x=name,y=value), stat="identity")

# dice rolling
sample(1:6, size=1, replace=TRUE)

sample(1:6, size=6, replace=TRUE)
sample(1:6, size=6, replace=FALSE)

roll <- sample(1:6, size=100, replace=TRUE)
data.frame(x=roll) %>%
  ggplot(aes(x=x)) +
  geom_histogram()
  
