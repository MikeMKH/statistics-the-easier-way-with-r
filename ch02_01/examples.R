library(tidyverse)

#pg 85-86
mm.counts <- c(12,6,8,10,6,7)
mm.colors <- c("blue","brown","green","orange","red","yellow")
names(mm.counts) <- mm.colors

barplot(mm.counts, col=mm.colors)

#pg 87-89
dataurl <- "http://qualityandinnovation.com/spring-summer-2017-mnms"
mnms <- readr::read_csv(dataurl)
summary(mnms)

mnms %>% mutate_at(vars(color),
                   function(x) case_when(
                     x == "R" ~ "red",
                     x == "BR" ~ "brown",
                     x == "Y" ~ "yellow",
                     x == "G" ~ "green",
                     x == "BL" ~ "blue",
                     x == "O" ~ "orange"
                   )) -> mnms2
mnms2

mnms2 %>% select(color) %>%
  ggplot(aes(x=color, fill=color)) +
  geom_bar() +
  scale_fill_identity()

mnms2 %>% select(color) %>%
  ggplot(aes(x=color, fill=color)) +
  geom_bar() +
  scale_fill_identity() +
  ggtitle("My M&M Color Distribution") +
  xlab("M&M Colors") +
  ylab("Number of M&Ms in Bag")

mnms %>% mutate_at(vars(defect),
                   function(x) case_when(
                     x == "N" ~ "none",
                     x == "C" ~ "cracked",
                     x == "L" ~ "letter issue"
                   )) -> mnms3
mnms3

mnms3 %>% select(defect) %>%
  ggplot(aes(x=defect, fill=factor(defect))) +
  geom_bar()