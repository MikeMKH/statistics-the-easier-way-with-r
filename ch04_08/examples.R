#pg 290-292
shd.wx <- read.table("https://raw.githubusercontent.com/NicoleRadziwill/Data-for-R-Examples/master/kshd-2013.txt",header=TRUE)
summary(shd.wx)
pairs(shd.wx)

simple.fit <- lm(shd.wx$DEWP ~ shd.wx$TEMP)
summary(simple.fit)

se <- sqrt((sum((simple.fit$residuals^2))/(length(shd.wx$TEMP)-2)))
se

se.slope <- se/(sd(shd.wx$TEMP)*sqrt(length(shd.wx$TEMP)-1))
se.slope

t.star <- qt(0.995, df=363)
t.star

# by hand (scalar)
simple.fit$coefficients[2] +
  c(-1*t.star*se.slope, +1*t.star*se.slope)

# built in
confint(simple.fit,level=0.99)

#pg 294
a.fit <- anova(simple.fit)
summary(a.fit)

ss.xx <- sum((shd.wx$TEMP-mean(shd.wx$TEMP))^2)
sy.x <- sqrt(a.fit$"Sum Sq"[2] / (length(shd.wx$TEMP)-2) )
se.alpha <- sy.x * sqrt((1/length(shd.wx$TEMP)) +
                          ((mean(shd.wx$TEMP)^2)/ss.xx))
t.star <- qt(0.995,df=(length(shd.wx$TEMP)-2))

# by hand (intercept)
ME <- t.star * se.alpha
CI <- simple.fit$coefficients[1] + c(-ME,ME)
CI

# built in
confint(simple.fit,level=0.99)

#pg 295-296
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/plotaddci.R")
plot.add.ci <- function(x, y, interval='prediction', level=0.9, regressionColor='red', ...) {
  xOrder <- order(x)
  x <- x[xOrder]
  y <- y[xOrder]
  fit <- lm(y ~ x, data=data.frame(x=x, y=y))
  newX <- data.frame(x=jitter(x))
  fitPred <- predict.lm(fit, newdata=newX, interval=interval,level=level, ...)
  abline(lm(y ~ x), col=regressionColor)
  lines(newX$x, fitPred[,2], lty=2, ...)
  lines(newX$x, fitPred[,3], lty=2, ...)
}

plot(shd.wx$TEMP,shd.wx$DEWP, pch=19, main="Confidence and Prediction Intervals")
plot.add.ci(interval="prediction",  col="red", level=0.99, lwd="3", shd.wx$TEMP, shd.wx$DEWP)
plot.add.ci(interval="confidence", col="blue", level=0.99, lwd="3", shd.wx$TEMP, shd.wx$DEWP)