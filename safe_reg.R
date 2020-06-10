dat=read.csv("https://github.com/athienit/STA6166material/safe_reg.csv",header=TRUE)
attach(dat)

library(car)
scatterplot(y~x1|x2,smooth=FALSE,regLine=FALSE,data=dat)
reg1=lm(y~x1+x2)
summary(reg1)
coef1=coef(reg1)
curve(coef1[1]+coef1[3]+coef1[2]*x,from=1500,to=10000,add=T,col="red")
curve(coef1[1]+coef1[2]*x,from=1500,to=10000,add=T)

scatterplot(y~x1|x2,smooth=FALSE,regLine=lm,data=dat)

reg2=lm(y~x1+x2+x1:x2) #same as lm(y~x1+x2+x1*x2) or lm(y~x1*x2)
summary(reg2)
vc=vcov(reg2);round(vc,2)
sum(reg2$coefficients[c(2,4)])+c(1,-1)*qt(0.025,reg2$df.residual)*sqrt(vc[2,2]+vc[4,4]+2*vc[2,4])