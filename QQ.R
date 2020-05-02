lead=c(41,46,32,17,32,41,23,12,3,13,10,11,5,30,48,53,44,55,52,39,62,
	38,23,27,41,37,11,9,7,11,77,210,38,112,52,10,6)

qqnorm(lead,datax=TRUE,col=2)
qqline(lead,datax=TRUE)
# Note the axis, some programs flip the axis, hence reversing the interpretation.  To flip use datax=FALSE

plot(density(lead,bw=13),col=2,lty=2,ylim=c(0,0.016),main="Smoothed Histogram",xlab="")
plot(function(t)dnorm(t,mean(lead),sd(lead)),from=-50,to=250,add=TRUE)

legend(150,0.015,c("Normal","Data"),col=1:2,lty=1:2,bg="gray90")