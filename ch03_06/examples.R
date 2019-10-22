library(tidyverse)

viz <- function(samples, left.x, left.y, right.x, right.y) {
  df <- data.frame(t(samples))
  names(df)
  
  all.sample.means <- data.frame(X1=apply(df,2,mean))
  global.mean <- mean(all.sample.means$X1)
  summary(all.sample.means)
  global.mean
  
  label.left <- paste0("Mean of one\nsample: ", round(mean(df$X1),3))
  left <- df %>%
    ggplot() +
    geom_histogram(aes(x=X1),bins=10) +
    annotate("text", x=left.x, y=left.y, label=label.left)
  
  label.right <- paste0("Mean of sampling\ndistribution over\n", r,
                        " samples of\n", n, " obs each = ", round(global.mean,2) )
  right <- all.sample.means %>%
    ggplot() +
    geom_histogram(aes(x=X1)) +
    annotate("text", x=right.x, y=right.y, label=label.right)
  
  cowplot::plot_grid(left,right)
} 

#pg 218-219
n <- 10 # observations in each sample
r <- 10000 # total number
my.samples <- matrix(rexp(n*r,3),r)
summary(my.samples)
viz(sample=my.samples,
    left.x=0.6, left.y=2.5,
    right.x=0.7, right.y=900)

#pg 220-221
n <- 200 # observations in each sample
r <- 10000 # total number
my.samples <- matrix(rexp(n*r,3),r)
summary(my.samples)
viz(sample=my.samples,
    left.x=0.7, left.y=40,
    right.x=0.4, right.y=900)