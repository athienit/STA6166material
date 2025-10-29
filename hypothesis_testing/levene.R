# install.packages("car",dependencies=TRUE)
library(car) #need to install the package lawstat first and then load it using this command.

# ENTERING DATA
y=c(4.2,2.9,0.2,25.7,6.3,7.2,2.3,9.9,5.3,6.5,
	0.2,11.3,0.3,17.1,51.0,10.1,0.3,0.6,7.9,7.2,
	7.2,6.4,9.9,3.5,10.6,10.8,10.6,8.4,6.0,11.9)

additive=factor(rep(1:3,each=10))

# to see how the output will be used
cbind(y,additive)

# PERFORMING TEST
leveneTest(y,additive)


# CREATE PLOT FOR P-VALUE
zv=qf(1-0.1802647,2,27)
 cord.x <- c(zv,seq(zv,4,0.01),4) 
 cord.y <- c(0,df(seq(zv,4,0.01),2,27),0) 
 curve(df(x,2,27),xlim=c(0,4),xaxp=c(0,0,1),xlab='',ylab='',main='F(2,27) distribution') 
 axis(1,zv,col='red',labels=TRUE,cex.axis=1,font=3)
 polygon(cord.x,cord.y,density=20,col='blue')
legend(2,0.6,legend=expression(paste(0.1803," area")),col='blue',fill='blue',density=20,cex=1)

