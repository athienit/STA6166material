placebo=c(0.90,0.37,1.63,0.83,0.95,0.78,0.86,0.61,0.38,1.97)
alcohol=c(1.46,1.45,1.76,1.44,1.11,3.07,0.98,1.27,2.56,1.32)

#manually calculate sum of ranks for placebo
T=sum(rank(c(placebo,alcohol))[1:length(placebo)]);T

#check assumption that centered data have the same distribution
pcenter=placebo-mean(placebo)
acenter=alcohol-mean(alcohol)
# basic plot
plot(density(pcenter),main="Histograms of centered values")
lines(density(acenter),col=2,lty=2,add=TRUE)
legend(0.5,1.5,legend=c("Placebo","Alcohol"),col=1:2,lty=1:2,bg="lightgrey")

# fancy plot
library(ggplot2)
library(reshape2)
# prepare data in long format
lf=melt(cbind(pcenter,acenter))
lf=lf[,-1]
colnames(lf)=c("Treatment","Value")

ggplot(lf, aes(x=Value, fill=Treatment))+
  geom_histogram(bins=15,color="grey80")+
  geom_density(alpha=.2, fill="grey") +
  facet_grid(Treatment~.)

ggplot(lf, aes(x=Value, fill=Treatment, color=Treatment)) +
  geom_histogram(bins=15,position="identity", alpha=0.25)


ks.test(pcenter,acenter)

wilcox.test(placebo,alcohol,conf.int=TRUE)
# The built in function gives a test statistic that is adjusted...see help file