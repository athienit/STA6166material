n=100
x=runif(n,-20,60)
eps=rnorm(n,0,1.5)
y=3*x/20+5+eps

reg=lm(y~x)
plot(x,y,bty="n",xlim=c(-20,60),xaxp=c(-20,60,8),pch=NA,col='blue',xlab='x',ylab='y')
#abline(v=0,h=0,lwd=2)
abline(reg,col='red')
legend(30, 3, c("Data points","Regression line"),pch=c(16,NA),lty=c(NA,1),col=c(4,2),cex=1)


points(x,y,pch=16,col=4)
abline(h=mean(y))