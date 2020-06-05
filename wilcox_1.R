placebo=c(0.90,0.37,1.63,0.83,0.95,0.78,0.86,0.61,0.38,1.97)
alcohol=c(1.46,1.45,1.76,1.44,1.11,3.07,0.98,1.27,2.56,1.32)

#manually calculate sum of ranks for placebo
T=sum(rank(c(placebo,alcohol))[1:length(placebo)]);T

#check assumption that centered data have the same distribution
pcenter=placebo-mean(placebo)
acenter=alcohol-mean(alcohol)
qqplot(pcenter,acenter,main="QQ plot of centered data",ylab="Centered alcohol quantiles",xlab="Centered placebo quantiles")
abline(c(0,1))
ks.test(pcenter,acenter)

wilcox.test(placebo,alcohol,conf.int=TRUE)
# The built in function gives a test statistic that is adjusted...see help file