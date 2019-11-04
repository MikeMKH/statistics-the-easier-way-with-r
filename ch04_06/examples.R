#pg 283
qchisq(0.95,df=31)  # 90% ci upper
qchisq(0.975,df=31) # 95% ci upper
qchisq(0.995,df=31) # 99% ci upper

qchisq(0.05,df=31)  # 90% ci lower
qchisq(0.025,df=31) # 95% ci lower
qchisq(0.005,df=31) # 99% ci lower

#pg 284

# 99%
(31 * .08^2) / qchisq(0.995,df=31)
(31 * .08^2) / qchisq(0.005,df=31)

# 90%
(31 * .08^2) / qchisq(0.95,df=31)
(31 * .08^2) / qchisq(0.05,df=31)