library(EnvStats) #make sure this package is first installed
set.seed(1531)
x=rnorm(30,506,3.6) #made up data

mean(x);sd(x)
# to get CI
varTest(x,conf.level=0.95)

#to get test
varTest(x,alternative="two.sided",sigma.squared=16,conf.level=0.95)
