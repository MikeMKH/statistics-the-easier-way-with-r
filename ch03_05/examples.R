library(pwr)

#pg 205
pwr.t.test(n=NULL,sig.level=0.05,power=0.8,d=0.3,type="one.sample") # n~90
pwr.t.test(n=NULL,sig.level=0.01,power=0.8,d=0.3,type="one.sample") # n~134
pwr.t.test(n=NULL,sig.level=0.01,power=0.8,d=0.01,type="one.sample") # n~116793

#pg 206
pwr.t.test(n=NULL,sig.level=0.05,power=0.8,d=0.3,type="two.sample", alternative="greater") # n~139 per group
pwr.t.test(n=NULL,sig.level=0.01,power=0.8,d=0.3,type="two.sample", alternative="greater") # n~225 per group

pwr.t.test(n=NULL,sig.level=0.05 ,power=0.8,d=0.3,type="paired", alternative="greater") # n~71 pairs
pwr.t.test(n=NULL,sig.level=0.01,power=0.8,d=0.3,type="paired", alternative="greater") # n~115 pairs

#pg 206-207
pwr.t.test(n=28,power=NULL,sig.level=0.05,d=0.3,type="paired", alternative="greater") # power=0.4612366
pwr.t.test(n=28,power=0.8,sig.level=0.05,d=NULL,type="paired", alternative="greater") # d=0.4821407

pwr.t.test(n=12,power=0.8,sig.level=0.01,d=NULL,type="two.sample", alternative="greater") # d=1.379379

pwr.t.test(n=NULL,sig.level=0.05,power=0.8,d=0.3,type="paired", alternative="greater")$n