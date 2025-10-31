friedman.test2=function(formula,data=data,method=NULL,level=0.95){
  require(NSM3)
  y=all.vars(formula)[1]
  trt=all.vars(formula)[2]
  block=all.vars(formula)[3]
  ranks=tapply(data[,y],data[,block],rank)
  # make sure block is a factor
  data[,block]=factor(data[,block])
  b=length(levels(data[,block]))
  t=length(levels(data[,trt]))
  
  mat=matrix(0,b,t)
  for(i in 1:b){
    mat[i,]=ranks[[i]]
  }
  R.sum=apply(mat,2,sum)
  
    print(paste(level*100,"%"," Pairwise CIs on rank sums"))

    d=apply(-combn(R.sum,2),2,diff) # pairwise differences
    d=as.array(d)
    names=combn(levels(data[,trt]),2)
    C=t*(t-1)/2 # number of parwise comparisons
    
    CI=matrix(NA,C,4)
    colnames(CI)=c("Difference","Lower","Upper","Differ?")
    CI[,1]=d
    rnames=rep(NA,C)
    if(is.null(method)){
      cv=cFrd(1-level,t,b)
      ME=cWNMT(1-level,t,b)$cutoff.U
    }else{
      if(method=="Asymptotic"){
        cv=cFrd(1-level,t,b,method="Asymptotic")
        ME=cWNMT(1-level,t,b,method="Asymptotic")$cutoff.U
      }
      if(method=="Monte Carlo"){
        cv=cFrd(1-level,t,b,method="Monte Carlo")
        ME=cWNMT(1-level,t,b,method="Monte Carlo")$cutoff.U
      }
      if(method=="Exact"){
        cv=cFrd(1-level,t,b,method="Exact")
        ME=cWNMT(1-level,t,b,method="Exact")$cutoff.U
      }
    }
  
    for(i in 1:C){
      rnames[i]=paste(names[1,i],"-",names[2,i])
      CI[i,2:3]=round(d[i]+c(-1,1)*ME,4)
      CI[i,4]=abs(d[i])>=ME
    }#end for loop
    rownames(CI)=rnames
    print(CI)

  return(list(critical.value=cv,friedman.test(formula,data=data)))
}# function created
