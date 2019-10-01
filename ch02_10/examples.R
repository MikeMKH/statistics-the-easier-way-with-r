library(tidyverse)

#pg 151-152
mnms <- readr::read_csv("http://qualityandinnovation.com/spring-summer-2017-mnms")
summary(mnms)
table(mnms$color,mnms$defect)

library(gmodels)
CrossTable(mnms$color, mnms$defect, prop.t=FALSE, prop.r=FALSE,
           prop.c=FALSE, prop.chisq=FALSE, chisq=FALSE)

#pg 153
m <- CrossTable(mnms$color, mnms$defect, prop.t=FALSE, prop.r=FALSE,
                prop.c=FALSE, prop.chisq=FALSE, chisq=FALSE)
m$prop.row
m$prop.col
m$prop.tbl

#pg 154-155
CrossTable(mnms$color, mnms$defect, prop.t=TRUE, prop.r=TRUE,
           prop.c=TRUE, prop.chisq=TRUE, chisq=TRUE)
# p =  0.0142785, so color does matter

#pg 156
left <- data.frame(table(mnms$color)) %>%
  ggplot(aes(x=Var1,y=Freq)) +
  geom_bar(stat="identity") +
  ggtitle("Marginal Distribution of Colors") +
  xlab("Colors") +
  ylab("Counts")
right <- data.frame(table(mnms$defect)) %>%
  ggplot(aes(x=Var1,y=Freq)) +
  geom_bar(stat="identity") +
  ggtitle("Marginal Distribution of Defects") +
  xlab("Defects") +
  ylab("Counts")
cowplot::plot_grid(left,right)

#pg 158
mnms %>%
  filter(color=="G") %>%
  group_by(defect) %>%
  tally()

left <- mnms %>%
  filter(color=="G") %>%
  group_by(defect) %>%
  tally() %>%
  ggplot(aes(x=defect,y=n)) +
  geom_bar(stat="identity") +
  ggtitle("Distribution of Defects\n(Green)") +
  xlab("Defects") +
  ylab("Counts")
right <- mnms %>%
  filter(defect=="C") %>%
  group_by(color) %>%
  tally() %>%
  ggplot(aes(x=color,y=n)) +
  geom_bar(stat="identity") +
  ggtitle("Distribution of Colors\n(Chipped/Cracked)") +
  xlab("Colors") +
  ylab("Counts")
cowplot::plot_grid(left,right)