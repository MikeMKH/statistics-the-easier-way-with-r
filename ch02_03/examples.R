library(tidyverse)

#pg 100
mnms <- as.tibble(read.csv("https://goo.gl/NWzVem",header=TRUE))
summary(mnms)
pairs(mnms)

table(mnms$color, mnms$defect)

#pg 101
mnms %>%
  group_by(color, defect) %>%
  tally() %>%
  spread(defect, n, fill=0)

library(janitor)
mnms %>%
  tabyl(color, defect)

#pg 102
barplot(prop.table( table(mnms$defect, mnms$color),2 ))

mm.colors <- c("blue","brown","green","orange","red","yellow")
barplot(prop.table(table(mnms$color, mnms$defect), 2),
        main="Distribution of M&M Colors by Defect Category",
        xlab="defect", ylab="percent", col=mm.colors)

#pg 104
mnms %>%
  group_by(color, defect) %>%
  tally() %>%
  ggplot() +
    geom_bar(aes(x=color, y=n, fill=defect), stat="identity")

mnms %>%
  group_by(color, defect) %>%
  tally() %>%
  ggplot() +
    geom_bar(aes(x=color, y=n, fill=defect), position="fill", stat="identity") +
    scale_y_continuous(labels=scales::percent_format())

mnms %>%
  group_by(defect, color) %>%
  tally() %>%
  ggplot() +
  geom_bar(aes(x=defect, y=n, fill=color), position="fill", stat="identity") +
  scale_y_continuous(labels=scales::percent_format()) +
  scale_fill_manual("legend",values=c("BL"="blue","BR"="brown","G"="green",
                                      "O"="orange","R"="red","Y"="yellow"))