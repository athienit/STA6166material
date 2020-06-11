stepT=function(fitmax,alpha.rem=0.20,alpha.enter=0.20,direction=c("backward","forward","both")){
  if(!require(MASS)){
    print("trying to install MASS")
    install.packages("car",dependencies=TRUE)
    if(!require(MASS))stop("could not install MASS")
  }
  if(missing(direction))direction=c("backward")
  direction<-match.arg(direction)
  backward<-direction=="backward"|direction=="both"
  forward<-direction=="forward"|direction=="both"
  # "fitmax" is of class "lm" and is the maximum full model
  if(class(fitmax)!="lm")stop("argument not of class lm")
  
  if(forward){
    fit=update(fitmax,.~1)
    temp=na.omit(addterm(fit,scope=formula(fitmax),test="F"))
    pvals=temp[,"Pr(F)"]
    minpval=min(pvals)
    i=0
    while(minpval<=alpha.enter){
      i=i+1
      add=dimnames(temp)[[1]][which.min(pvals)]
      print(formula(fit))
      fit=update(fit,paste(".~.+",add))
      cat("----------------------------------------------\n")
      cat("Step",i,"-> Adding:+",add,"\n")
      print(round(summary(fit)$coefficients[,c(1,4)],3)) 
      cat("\n")
      temp=na.omit(addterm(fit,scope=formula(fitmax),test="F"))
      pvals=temp[,"Pr(F)"]
      minpval=min(pvals)
    }
  }#close forward
  
  if(backward){
    fit=fitmax
    temp=na.omit(dropterm(fit,scope=formula(fitmax),test="F"))
    pvals=temp[,"Pr(F)"]
    maxpval=max(pvals)
    i=0
    while(maxpval>alpha.rem){
      i=i+1
      drop=dimnames(temp)[[1]][which.max(pvals)]
      print(formula(fit))
      fit=update(fit,paste(".~.-",drop))
      cat("----------------------------------------------\n")
      cat("Step",i,"-> Removing:-",drop,"\n")
      print(round(summary(fit)$coefficients[,c(1,4)],3)) 
      cat("\n")
      temp=na.omit(dropterm(fit,scope=formula(fit),test="F"))
      pvals=temp[,"Pr(F)"]
      maxpval=max(pvals)
    }
  }#close backward

  cat("\n")
  cat("Final model:\n")
  print(formula(fit))
  fit
}