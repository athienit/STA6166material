# Exam overview
overview=function(exam,y.lim=0.05){
  windows(20,8)
  par(mfrow=c(1,2))
  boxplot(exam,horizontal=TRUE)
  plot(density(exam,bw=4),col=2,ylim=c(0,y.lim),main="Exam",xlab="Score")
  hist(exam,nclass=6,density=10,angle=45,freq=FALSE,add=TRUE)
  abline(v=median(exam),col=3,lty=2,lwd=2)
  
  # Some percentiles (25,50,75,90)
  list(mean=mean(exam),sd=sd(exam),median=median(exam),
       percentiles=quantile(exam,c(0.10,0.25,0.50,0.75,0.90),type=2))
}