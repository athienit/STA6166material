copier=read.csv("https://raw.github.com/athienit/STA6166material/master/copiers.csv",skip=1,header=TRUE)
x=copier$Copiers
y=copier$Time

regm=lm(y~x)
summary(regm)
plot(y~x)
abline(regm)


re=rstandard(regm) #standardized residuals
### BOX-COX: 2 methods in R
# Method 1
library(MASS)
bc1=boxcox(regm)
lambda=bc1$x[which.max(bc1$y)];lambda
axis(1,at=round(lambda,2),cex.axis=0.7)

# Method 2
library(car)
bc2=powerTransform(y~x)
summary(bc2)
yT=bcPower(y,0.63)

reg2=lm(yT~x)
summary(reg2)

### Checking model assumptions
re2=rstandard(reg2) #standardized residuals
par(mfrow=c(2,2))

# Normality
hist(re2)
qqnorm(re2,datax=TRUE)
qqline(re2,datax=TRUE)

# Independence
plot(re2,type="o",pch=22,xlab="Order",main="Independence")
abline(h=0)

# Homogeneity of variance/Model Fit
plot(re2~fitted.values(reg2),main="Homogeneity / Fit")
abline(h=0)
