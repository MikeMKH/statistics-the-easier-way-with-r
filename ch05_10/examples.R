library(tidyverse)

#pg 405
scores <- read_delim("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/anova-textbooks.txt", delim="\t1")
scores %>%
  mutate_at(vars(textbook), factor) -> scores
summary(scores)

scores %>%
  ggplot(aes(x=textbook, y=score)) +
  geom_boxplot()

#pg 408
totals <- scores %>%
  filter(textbook!=2) %>%
  group_by(textbook) %>%
  summarize(var=var(score))
totals

t <- totals %>% select(var) %>% max() /
  totals %>% select(var) %>% min()
t

#pg 409
qf(0.975,15,15)
qf(0.95,15,15)

lower <- qf(0.025,df1=15,df2=15)
upper <- qf(0.975,df1=15,df2=15)
c(lower, upper)

#pg 410
scores %>% filter(textbook==1) %>% select(score) -> group.1
scores %>% filter(textbook==3) %>% select(score) -> group.3
var.test(group.3$score,group.1$score)