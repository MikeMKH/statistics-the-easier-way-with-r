#pg 276
my.props <- cbind(c(92,64),c(200-92,200-64))

prop.test(my.props,200,correct=FALSE)
prop.test(my.props,200)

#pg 277
success <- c(92,64)
failure <- c(200-92,200-64)
group <- c(1,2)
my.props <- data.frame(cbind(success,failure,group))

library(pairwiseCI)
pairwiseCI(cbind(success,failure)~group,
           data=my.props,
           method="Prop.diff",
           CImethod="CC")

#pg 278-279
library(PropCIs)
wald2ci(92,200,64,200,conf.level=0.95,adjust=TRUE)

library(pairwiseCI)
pairwiseCI(cbind(success,failure)~group,
           data=my.props,
           method="Prop.diff",
           CImethod="AC")

pairwiseCI(cbind(success,failure)~group,
           data=my.props,
           method="Prop.diff",
           CImethod="NHS")