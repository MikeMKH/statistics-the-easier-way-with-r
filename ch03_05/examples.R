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

#pg 209
pwr.p.test(h=0.2,n=NULL,power=0.8,sig.level=0.05,alternative="two.sided") # n~197
pwr.p.test(h=0.5,n=NULL,power=0.8,sig.level=0.05,alternative="two.sided") # n~32

pwr.2p.test(h=0.2,n=NULL,power=0.8,sig.level=0.05, alternative="two.sided") # n~393
pwr.2p.test(h=0.5,n=NULL,power=0.8,sig.level=0.05, alternative="two.sided") # n~63

#pg 211
pwr.chisq.test(w=0.3,N=NULL,df=4,sig.level=0.05,power=0.8) # n~133
pwr.chisq.test(w=0.1,N=NULL,df=4,sig.level=0.05,power=0.8) # n~1194
pwr.chisq.test(w=0.3,N=NULL,df=6,sig.level=0.05,power=0.8) # n~152

#pg 212
pwr.anova.test(k=4,f=0.3,sig.level=0.05,power=0.8) # n~32 per group, so 32*4
pwr.anova.test(k=4,f=0.5,sig.level=0.05,power=0.8) # n~12 per group, so 12*4
pwr.anova.test(k=6,f=0.3,sig.level=0.05,power=0.8) # n~25 per group, so 25*6

#pg 213
pwr.f2.test(u=1, v=NULL, f2=0.15, sig.level=0.01, power=0.8) # v~80
pwr.f2.test(u=1, v=NULL, f2=0.35, sig.level=0.01, power=0.8) # v~35
pwr.f2.test(u=2, v=NULL, f2=0.15, sig.level=0.01, power=0.8) # v~95
pwr.f2.test(u=100, v=NULL, f2=0.15, sig.level=0.01, power=0.8) # v~326