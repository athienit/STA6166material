set.seed(7227)
x=1:10
y1=1+0.7*x
y2=y1+rnorm(10,0,1)
y3=9-0.9*x+rnorm(10,0,1)
y4=3+0.4*x+rnorm(10,0,2)

par(mfrow=c(2,2))

cor(y1,x)
plot(x,y1,ylim=c(1,10),pch=19)
mtext("r = 1")
abline(lm(y1~x),col="red")

cor(y2,x)
plot(x,y2,ylim=c(1,10),pch=19)
mtext("r = 0.8775")
abline(lm(y2~x),col="red")

cor(y3,x)
plot(x,y3,lim=c(1,10),pch=19)
mtext("r = -0.9307")
abline(lm(y3~x),col="red")

cor(y4,x)
plot(x,y4,ylim=c(1,10),pch=19)
mtext("r = 0.4968")
abline(lm(y4~x),col="red")
