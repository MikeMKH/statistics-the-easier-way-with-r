library(PropCIs)

#pg 269 - 271
add4ci(39,120,conf.level=0.95)  # Agresti-Coull correction
scoreci(39,120,conf.level=0.95) # Wilson Score Interval
exactci(39,120,conf.level=0.95) # Clopper-Pearson exact method