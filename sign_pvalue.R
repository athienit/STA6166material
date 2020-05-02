windows(6.5,5.4)

low=0;high=15;n=15;p=0.6
values = low:high
probs = dbinom(values, n, p=p)
library(graphics)
plot(c(low,high), c(0,max(probs)), type = "n" ,xaxt="n",xlab = "Possible Values",
     ylab = "Probability",
     main = paste("Binomial Distribution \n", "n =", n, ", p =", p))
axis(1,at=c(0:4,6:15))
axis(1,at=5,cex.axis=2,font=3)
lines(values,probs,type="h",col=1)
lines(c(low:5),probs[c(1:6)],type="h",col=2)
rect(xleft=-0.5,ybottom=-0.001,xright=5.5,ytop=dbinom(5,high,p)+0.001,density=NULL,border=2)
legend(11,0.17,legend=c("p-value"),box.lty=1,box.col="red",cex=1)

legend(11,0.20,legend="P(B=5)",lty=1,lwd=2,col="green",cex=1)
abline(h=dbinom(5,15,p),lwd=2,col="green")
lines(c(10:high),probs[c(11:16)],type="h",col=2)
rect(xleft=12.5,ybottom=-0.001,xright=15.5,ytop=dbinom(5,high,p)+0.001,density=NULL,border=2)


