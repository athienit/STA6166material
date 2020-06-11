
alpha=0.05
ns=50 #number of samples
n=100 #sample size of each sample
x=array(rpois(ns*n,30),dim=c(ns,n)) #sample from Poisson dist with mean 30
CIs=array(NA,dim=c(ns,3))
dimnames(CIs)=list(1:ns,c("Fitted","Lower","Upper"))

for(i in 1:ns){
  CIs[i,1]=mean(x[i,])
  CIs[i,2:3]=CIs[i,1]+c(-1,1)*qnorm(1-alpha/2)*sd(x[i,])/sqrt(n)
}

# CLT illustration
xtemp=CIs[,1]
h<-hist(xtemp, col="red", xlab="Sample",main="Histogram of sample means with Normal Curve") 
xfit<-seq(floor(min(xtemp)),ceiling(max(xtemp)),length=40) 
yfit<-dnorm(xfit,mean=mean(xtemp),sd=sd(xtemp)) 
yfit <- yfit*diff(h$mids[1:2])*length(xtemp) 
lines(xfit, yfit, col="blue", lwd=2)

# Confidence interval illustration
CIsdf=as.data.frame(CIs)
require(ggplot2)
ggplot(CIsdf, aes(x = 1:ns, y = Fitted)) +
  geom_point(size = 4) +
  geom_errorbar(aes(ymax = Upper , ymin = Lower))+
  geom_hline(yintercept=30,color="red")

#number of CI's (out of 50) that do not include mean=30
ns-sum(CIs[,2]<30 & CIs[,3]>30)
