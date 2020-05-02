dat=read.table("T:/Teaching/STA 6166/Class Notes/wordrecall.txt",header=TRUE)
reg=lm(prop~time,data=dat)
plot(prop~time,data=dat)
abline(reg)

### Checking model assumptions
re=rstandard(reg) #standardized residuals
par(mfrow=c(2,2))

# Normality
hist(re,xlab="std res",main="Histogram of std res")
qqnorm(re,datax=TRUE)
qqline(re,datax=TRUE)

# Independence
plot(re,type="o",pch=22,xlab="Order",ylab="std res",main="Independence")
abline(h=0)

# Homogeneity of variance/Model Fit
plot(re~fitted.values(reg),ylim=c(-3,3),xlab=expression(hat(y)),ylab="std res",main="Homogeneity / Fit")
abline(h=0)

### Transform only predictor
library(car)
bc2=powerTransform(dat$time)
summary(bc2)

l.time=log(dat$time)
dat=cbind(dat,l.time)

reg2=lm(prop~l.time,data=dat)
par(mfrow=c(1,1))
plot(prop~l.time,data=dat)
abline(reg2)

### Checking model assumptions
re2=rstandard(reg2) #standardized residuals
par(mfrow=c(2,2))

# Normality
hist(re2,xlab="std res",main="Histogram of std res")
qqnorm(re2,datax=TRUE)
qqline(re2,datax=TRUE)

# Independence
plot(re2,ylab="std res",type="o",pch=22,xlab="Order",main="Independence")
abline(h=0)

# Homogeneity of variance/Model Fit
plot(re2~fitted.values(reg2),ylab="std res",xlab=expression(hat(y)),main="Homogeneity / Fit")
abline(h=0)
