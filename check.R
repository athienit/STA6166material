#Check regression model assumptions

check=function(lm.object,tests=FALSE){ ### Checking model assumptions
  re=rstandard(lm.object) #standardized residuals
  ylimits=c(-3,3)
  ylimits[1]=ifelse(min(re)<(-3),min(re),-3)
  ylimits[2]=ifelse(max(re)>(3),max(re),3)
  
  par(mfrow=c(2,2))
  
  # Normality
  hist(re,main="Standardized residuals",xlab="std res.")
  qqnorm(re,datax=TRUE)
  qqline(re,datax=TRUE)
  
  # Homogeneity of variance/Model Fit
  plot(re~fitted.values(lm.object),xlab=expression(hat(y)),ylab="std res.",main="Homogeneity / Fit",ylim=ylimits)
  abline(h=0)
  
  # Independence
  plot(re,type="o",pch=22,xlab="Order",ylab="std res.",main="Independence",ylim=ylimits)
  abline(h=0)
  
  par(mfrow=c(1,1))
  if(tests==TRUE){
    if(!require(lawstat)){
     print("trying to install lawstat")
    install.packages("lawstat",dependencies=TRUE)
    if(!require(lawstat))stop("could not install lawstat")
    }
    if(!require(car)){
      print("trying to install car")
      install.packages("car",dependencies=TRUE)
      if(!require(car))stop("could not install car")
    }
    ConstantVar=NULL
    if(class(lm.object)[1]=="lm")ConstantVar=ncvTest(lm.object)
    if(class(lm.object)[1]=="aov")ConstantVar=leveneTest(lm.object$model[,1],lm.object$model[,2])
    list(Independence=list(runs.test(re),durbinWatsonTest(lm.object)),Normality=shapiro.test(re),c("Constant Variance only valid if data are in groups"),ConstantVar=ConstantVar)
  }
}