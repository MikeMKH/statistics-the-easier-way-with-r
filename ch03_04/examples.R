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

diamonds <- mutate(diamonds,
                   quality=factor(case_when(as.integer(cut) <= 2 ~ "HIGH",
                                            TRUE ~ "LOW")))
diamonds %>% summary()

# paired t-test
# t.test(carat ~ quality, data = diamonds, paired = FALSE) # not a paired test