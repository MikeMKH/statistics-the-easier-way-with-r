#pg 247-248
source("https://raw.githubusercontent.com/NicoleRadziwill/R-Functions/master/cimean.R")

ci.mean(n=30,ybar=16,s=11.7,
        vname="number of opium poppies per acre")

my.ci <- ci.mean(n=30,ybar=16,s=11.7)
my.ci$short
my.ci$verbose
my.ci$cint

sp500.ci <- ci.mean(n=62,ybar=7.96,s=19.7028)
sp500.ci$verbose
sp500.ci$cint

ci.mean(n=62,ybar=7.96,s=19.7028,conf.level=0.90)$cint
ci.mean(n=62,ybar=7.96,s=19.7028,conf.level=0.95)$cint
ci.mean(n=62,ybar=7.96,s=19.7028,conf.level=0.99)$cint