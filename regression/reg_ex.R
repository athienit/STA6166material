weight=c(99,101.1,102.7,103,105.4,107,108.7,110.8,112.1,112.4,113.6,113.8,115.1,115.4,120)
porosity=c(28.8,27.9,27,25.2,22.8,21.5,20.9,19.6,17.1,18.9,16,16.7,13,13.6,10.8)
plot(weight~porosity)

reg=lm(weight~porosity)
summary(reg) # Obtain estimates
anova(reg) # ANOVA TABLE
abline(reg) # Plot regression line

### Sum of Squares Table 
anova(reg)

### Inference on beta_1 (slope)
# CI
reg$coefficients[2]+c(1,-1)*qt(0.025,reg$df.residual)*sqrt(vcov(reg)[2,2])

# Test stat
reg$coefficients[2]/sqrt(vcov(reg)[2,2])


### Confidence and Prediction Intervals on response
# since 27 is in the data the correct interval is "confidence"
which(porosity==27) # the third observation is 27

predict.lm(reg,newdata=data.frame(porosity=27),interval="confidence",level=0.95)
predict.lm(reg,newdata=data.frame(porosity=27),interval="prediction",level=0.95)


### Checking model assumptions
re=rstandard(reg) #standardized residuals
par(mfrow=c(2,2))

# Normality
hist(re)
qqnorm(re,datax=TRUE)
qqline(re,datax=TRUE)

# Independence
plot(re,type="o",pch=22,xlab="Order",main="Independence")
abline(h=0)

# Homogeneity of variance/Model Fit
plot(re~fitted.values(reg),main="Homogeneity / Fit")
abline(h=0)