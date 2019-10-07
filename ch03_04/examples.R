library(tidyverse)
data("diamonds")

summary(diamonds)
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

# one sample t-test
t.test(diamonds$carat, mu = 0.7, alternative = "two.sided")
# mean is about 0.797

diamonds %>% filter(as.integer(cut) > 2) %>% summary()

# two sample t-test
t.test(diamonds %>% filter(as.integer(cut) > 2) %>% select(carat),
       diamonds %>% filter(as.integer(cut) <= 2) %>% select(carat),
       alternative = "two.sided",
       var.equal = FALSE)
# cuts are of higher quality for smaller diamonds

diamonds %>% filter(as.integer(color) > 2) %>% summary()

# paired t-test
#TODO