#pg 287

temp.var <- (2.6/3.2)

# 90% ci
F.upper <- qf(0.95,df1=19,df2=23)
F.lower <- qf(0.05,df1=19,df2=23)
temp.var * F.lower
temp.var * F.upper

# 95 ci
F.upper <- qf(0.975,df1=19,df2=23)
F.lower <- qf(0.025,df1=19,df2=23)
temp.var * F.lower
temp.var * F.upper

# 99 ci
F.upper <- qf(0.995,df1=19,df2=23)
F.lower <- qf(0.005,df1=19,df2=23)
temp.var * F.lower
temp.var * F.upper