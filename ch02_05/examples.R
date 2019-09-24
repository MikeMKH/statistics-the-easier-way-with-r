library(tidyverse)

#pg 113-115
allscores <- readr::read_csv("https://goo.gl/MJyzNs")
allscores
summary(allscores)
pairs(allscores)

allscores %>%
  gather(key="test.type", value="score", pre, post)

left <- allscores %>%
  gather(key="test.type", value="score", pre, post) %>%
  ggplot() + geom_boxplot(aes(x="All Scores", y=score))
right <- allscores %>%
  gather(key="test.type", value="score", pre, post) %>%
  ggplot() + geom_boxplot(aes(x=test.type, y=score))
cowplot::plot_grid(left, right)

# flip post and pre order
right <- allscores %>%
  gather(key="test.type", value="score", pre, post) %>%
  mutate(test.type=factor(test.type, levels=c("pre","post"), ordered=TRUE)) %>%
  ggplot() + geom_boxplot(aes(x=test.type, y=score))
cowplot::plot_grid(left, right)

#pg 116
right +
  ggtitle("Statistics Pre- and Post-Test Score Distributions") +
  scale_y_continuous(limits=c(0,100)) +
  xlab("Groups") +
  scale_fill_manual(values=c("gray","white"))

#pg 117
p1 <- allscores %>% ggplot() + geom_boxplot(aes(y=diff))
p2 <- allscores %>% ggplot() + geom_boxplot(aes(y=diff, group=group))
p3 <- allscores %>% ggplot() + geom_boxplot(aes(y=diff, group=group, fill=group))
cowplot::plot_grid(p1, p2, p3, nrow=1)

#pg 118
# group is discrete, not continous as it is treated without factor
allscores %>%
  mutate(group=factor(group, levels=c("1","2","3"), ordered=TRUE)) %>%
  ggplot() +
  geom_boxplot(aes(y=diff, group=group, fill=group)) +
  scale_fill_manual(values=c("white","lightgray","darkgray")) +
  theme(axis.text.x=element_blank())

#pg 119
allscores %>%
  mutate(group=factor(group, levels=c("1","2","3"), ordered=TRUE)) %>%
  ggplot() +
  geom_boxplot(aes(y=diff, group=group, fill=group)) +
  scale_fill_manual(values=c("blue","lightblue","purple")) +
  theme(axis.text.y=element_blank()) +
  ggtitle("Score Improvements Across Three Groups") +
  coord_flip()