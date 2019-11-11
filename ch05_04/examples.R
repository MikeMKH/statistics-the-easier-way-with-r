library(tidyverse)

#pg 330
foam <- read_csv("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/beer-foam.csv")
foam
summary(foam)

#pg 333
foam %>%
  ggplot(aes(x=tau)) +
  geom_histogram(data=filter(foam, test.case=="SH-COLD"),
                 aes(y=..count..), alpha=0.7, binwidth=25,
                 color="black", fill="pink") +
  geom_histogram(data=filter(foam, test.case=="SH-RT"),
                 aes(y=..count..), alpha=0.3, binwidth=25,
                 color="black", fill="blue")

foam %>%
  filter(brewery=="SH") %>%
  {var.test(.$tau~.$temp)}

#pg 336
foam %>%
  filter(brewery=="SH") %>%
  group_by(temp) %>%
  summarise(mean=mean(tau),sd=sd(tau))

df <- ((57.7^2/40 + 35.4^2/40)^2) /
  ((1/(40-1) * (57.7^2/40)^2) + (1/(40-1) * (35.4^2/40)^2))

t <- (271 - 202) /
  sqrt(57.7^2/40 + 35.4^2/40)

#pg 337
1-pt(t,df)

#pg 339
cold <- foam %>%
  filter(test.case=="SH-COLD") %>%
  select(tau)

rt <- foam %>%
  filter(test.case=="SH-RT") %>%
  select(tau)

t.test(cold$tau ,rt$tau, alternative="greater", var.equal=FALSE)

t.test(cold$tau ,rt$tau, var.equal=FALSE)