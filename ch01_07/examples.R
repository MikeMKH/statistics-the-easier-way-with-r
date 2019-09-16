#pg 55
library(tidyverse)
x = -5:5
df <- data.frame(x, dnorm(x, 0, 1.5), pnorm(x, 0, 1.5))
names(df) <- c("x", "PDF", "CDF")

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("Normal PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("Normal CDF")

library(cowplot)
cowplot::plot_grid(left, right)

#pg 57
rnorm(20, 0, 1.5)
rnorm(20, 3, 20)
x <- -10:10

df <- data.frame(x, HOW = rnorm(x, 0, 1.5))
ggplot(df,aes(x=x, y=HOW)) + geom_line()

df <- data.frame(x, HOW = dnorm(x, 0, 1.5))
ggplot(df,aes(x=x, y=HOW)) + geom_line()

df <- data.frame(x, HOW = pnorm(x, 0, 1.5))
ggplot(df,aes(x=x, y=HOW)) + geom_line()

#pg 58

#beta
df <- data.frame(x, PDF = dbeta(x, 0, 1.5), CDF = pbeta(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#cauchy
df <- data.frame(x, PDF = dcauchy(x, 0, 1.5), CDF = pcauchy(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#chisq
df <- data.frame(x, PDF = dchisq(x, 0, 1.5), CDF = pchisq(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#exp
df <- data.frame(x, PDF = dexp(x, 0, 1.5), CDF = pexp(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#gamma
df <- data.frame(x, PDF = dgamma(x, 0, 1.5), CDF = pgamma(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#logis
df <- data.frame(x, PDF = dlogis(x, 0, 1.5), CDF = plogis(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#norm
df <- data.frame(x, PDF = dnorm(x, 0, 1.5), CDF = pnorm(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)

#unif
df <- data.frame(x, PDF = dunif(x, 0, 1.5), CDF = punif(x, 0, 1.5))

left <- ggplot(df,aes(x=x, y=PDF)) + geom_line() + ggtitle("PDF")
right <- ggplot(df,aes(x=x, y=CDF)) + geom_line() + ggtitle("CDF")
cowplot::plot_grid(left, right)