#pg 232-233
score <- c(.06,2.17,2.46,2.67,2.86,3.01,3.17,3.34,3.43,3.45, 3.46,3.48,3.5,3.52,3.54,3.56,3.58,3.6,3.62,3.65,3.67,3.69, 3.71,3.74,3.77,3.79,3.82,3.85,3.88,3.91,3.94,3.96,4.0,4.0)
summary(score)

perc.ranks <- c(0,10,20,30,40,50,60,70,75,76,77,78,79,80,81, 82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100)
fn <- ecdf(perc.ranks)
xs <- score
ys <- fn(perc.ranks)

slope <- rep(NA,length(xs))
for (i in 2:length(xs)) {
  slope[i] <- (ys[i]-ys[i-1])/(xs[i]-xs[i-1])
}
slope[1] <- 0
slope[length(xs)] <- slope[length(xs)-1]

par(mfrow=c(1,2))
plot(xs,slope,type="l",main="Estimated PDF")
plot(xs,ys,type="l",main="Estimated CDF")

# dev.off()

library(stabledist)
x <- seq(0,4,length=100)
hx <- dstable(x, alpha=0.5, beta=0.75, gamma=1, delta=3.2)
plot(x,hx,type="l",lty=2,lwd=2)

#pg 234
sample.size <- 100
trails <- 10000
p.vals <- rep(NA,trails)
gpa.means <- rep(NA,trails)
compare.to <- 3.00

library(stabledist)
for (j in 1:trails) {
  r <- rstable(n=1000,alpha=0.5,beta=0.75,gamma=1,delta=3.2)
  meets.conds <- r[r>0 & r<4.001]
  my.sample <- round(meets.conds[1:sample.size],3)
  gpa.means[j] <- round(mean(my.sample),3)
  p.vals[j] <- t.test(my.sample, mu=compare.to, alternative="greater")$p.value
  if (p.vals[j] < 0.02) {
    # capture the last one of these data sets to look at later
    capture <- my.sample
  }
}

summary(p.vals)
p.vals.under.pointohfive <- p.vals[p.vals<0.05]
length(p.vals.under.pointohfive)

par(mfrow=c(1,2))
hist(capture,main="One Rogue Sample",col="purple")
boxplot(p.vals,main="All P-Values")