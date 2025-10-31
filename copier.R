copier=read.csv("https://raw.githubusercontent.com/athienit/STA6166material/master/copiers.csv",skip=1,header=TRUE)
plot(copier$Copiers,copier$Time,pch=16,xlab="Quantity",ylab="Time (in minutes)",main="Scatterplot")

reg=lm(Time~Copiers,data=copier)
summary(reg)
anova(reg)
abline(reg)

confint(reg,level=0.95,method="Wald")

predict.lm(reg,se.fit=TRUE,newdata=data.frame(Copiers=5),interval="confidence",level=0.95)
# alternatively
v=vcov(reg);v
sum(coefficients(reg)*c(1,5))+c(-1,1)*qt(0.975,df.residual(reg))*sqrt(v[1,1]+5^2*v[2,2]+2*5*v[1,2])

predict.lm(reg,se.fit=TRUE,newdata=data.frame(Copiers=7),interval="prediction",level=0.95)

### Checking model assumptions
re=rstandard(reg) #standardized residuals
# Normality
#windows(6.5,5.4)
par(mfrow=c(1,2))
plot(density(re),col='red',ylim=c(0,0.5),xlab="std. residuals",main="Histogram of std residuals")
hist(re,freq=FALSE,border='red',add=TRUE)
plot(function(t)dnorm(t),from=-3,to=3,add=TRUE)

#windows(6.5,5.4)
qqnorm(re,datax=TRUE)
qqline(re,datax=TRUE)

# Homogeneity of variance/Model Fit
#windows(6.5,5.4)
plot(re~fitted.values(reg),ylim=c(-3,3),xlab=expression(hat(y)),ylab="std res",main="Homogeneity / Fit")
abline(h=0)

# Independence
#windows(6.5,5.4)
plot(re,type="o",pch=22,xlab="Order",ylab="std res",main="Independence")
abline(h=0)


