library(tidyverse)

#pg 383-384
satisfied <- c(36,39,11)
unsatisfied <- c(8,7,14)
col.totals <- satisfied+unsatisfied
ct <- rbind(satisfied, unsatisfied, col.totals)
colnames(ct) <- c("18-34","35-49","50+")
row.totals <- c(sum(satisfied),
                sum(unsatisfied),
                sum(satisfied)+sum(unsatisfied))
ct <- cbind(ct, row.totals)
ct

expected.values.row.1 <- c( ((row.totals[1]*col.totals[1])/row.totals[3]),
                            ((row.totals[1]*col.totals[2])/row.totals[3]),
                            ((row.totals[1]*col.totals[3])/row.totals[3]))
expected.values.row.2 <- c( ((row.totals[2]*col.totals[1])/row.totals[3]),
                            ((row.totals[2]*col.totals[2])/row.totals[3]),
                            ((row.totals[2]*col.totals[3])/row.totals[3]))
expected.values <- rbind(expected.values.row.1,expected.values.row.2)
expected.values

chisq.1 <- ((satisfied[1]-expected.values.row.1[1])^2)/expected.values.row.1[1]
chisq.2 <- ((satisfied[2]-expected.values.row.1[2])^2)/expected.values.row.1[2]
chisq.3 <- ((satisfied[3]-expected.values.row.1[3])^2)/expected.values.row.1[3]
chisq.4 <- ((unsatisfied[1]-expected.values.row.2[1])^2)/expected.values.row.2[1]
chisq.5 <- ((unsatisfied[2]-expected.values.row.2[2])^2)/expected.values.row.2[2]
chisq.6 <- ((unsatisfied[3]-expected.values.row.2[3])^2)/expected.values.row.2[3]
ts.chisq <- sum(chisq.1,chisq.2,chisq.3,chisq.4,chisq.5,chisq.6)
ts.chisq

#pg 385
ggplot(data.frame(x=c(0,20)), aes(x=x)) +
  stat_function(fun=dchisq, args=list(df=5)) +
  stat_function(fun=dchisq, args=list(df=5), xlim=c(12,20), geom="area")

#pg 386
p <- 1-pchisq(ts.chisq,df=(length(satisfied)-1)*(2-1))
p < 0.05

#pg 386-389
ctable <- rbind(satisfied,unsatisfied)
dimnames(ctable) <- list(state = c("Satisfied","Unsatisfied"),
                         agegroup = c("18 to 34","35 to 49","Over 50"))
ctable

res <- chisq.test(ctable)
res
str(res)

res$expected
((res$observed-res$expected)^2)/res$expected
sum(((res$observed-res$expected)^2)/res$expected)

#pg 389-390
contin.coeff <- function(xsq) {
  sqrt(xsq$statistic/(sum(xsq$observed)+xsq$statistic))
}
contin.coeff(res)

#pg 390-391
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/cramersv.R")
cramers.v(res)

#pg 391
fair.rolls <- c(12,8,11,9,10,10)
chisq.test(fair.rolls, p=c(1/6,1/6,1/6,1/6,1/6,1/6))

unfair.rolls <- c(17,3,13,7,5,15)
chisq.test(unfair.rolls, p=c(1/6,1/6,1/6,1/6,1/6,1/6))