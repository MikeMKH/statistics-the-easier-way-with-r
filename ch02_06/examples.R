library(tidyverse)

#pg 121
df <- data.frame(color=c("blue","brown","green","orange","red","yellow"),
                 count=c(12,6,8,10,6,7))
summary(df)
pairs(df)
df

new <- df %>%
  mutate(prop=sprintf("%0.1f",(count/sum(df$count))*100)) %>%
  mutate(label=paste0(toupper(color), " ", prop, "%"))

#pg 122
library(gplots)

pie(new$count, labels=new$label,
    col=gplots::col2hex(new$color), main="M&M Color Distribution")

new %>%
  ggplot(aes(x="", y=count, fill=color)) +
  geom_bar(width=1, stat="identity") +
  coord_polar(theta = "y") + # makes it a pie chart
  geom_text(aes(label=label), size=3, position=position_stack(vjust=0.6)) +
  scale_fill_manual(values=gplots::col2hex(new$color)) +
  ggtitle("M&M Color Distribution") +
  theme_void()

#pg 124-125
mnms <- readr::read_csv("http://qualityandinnovation.com/spring-summer-2017-mnms")
summary(mnms)
mnms

new <- mnms %>%
  group_by(color) %>%
  tally() %>%
  mutate(color=recode(color,
                      "BL"="blue","BR"="brown","G"="green",
                      "O"="orange","R"="red","Y"="yellow"),
         prop = n/sum(n),
         label = paste0(color, ": ", round(prop*100,2), "%"))
new

pie(new$n, labels=new$label,
    col=gplots::col2hex(new$color), main="M&M Color Distribution")

new %>%
  ggplot(aes(x="", y=n, fill=color)) +
  geom_bar(width=1, stat="identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label=label), size=3, position=position_stack(vjust=0.6)) +
  scale_fill_manual(values=gplots::col2hex(new$color)) +
  ggtitle("M&M Color Distribution") +
  theme_void()

#pg 126
library(waffle)
waffle((new$n/10), rows=10, colors=new$color,
        title="M&M Colors", xlab="1 square = 10 M&Ms")