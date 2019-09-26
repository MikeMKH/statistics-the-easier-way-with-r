library("qcc")

#pg 128
defect.counts <- c(12,29,18,3,34,4)
names(defect.counts) <- c("Weather","Overslept", "Alarm Failure",
                          "Time Change","Traffic","Other")
summary(defect.counts)
pareto.chart(defect.counts)

#pg 129
mnms <- readr::read_csv("http://qualityandinnovation.com/spring-summer-2017-mnms")
summary(mnms)
pareto.chart(table(mnms$color))

#pg 131
pareto.chart(defect.counts, main="Pareto Chart",
             xlab="Reasons", ylab="Frequency", cex.names=0.5,
             las=1, col=topo.colors(6))
abline(h=0.8,lwd=4,col="red")