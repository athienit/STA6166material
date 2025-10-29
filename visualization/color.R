# creating some artifical data
set.seed(7234681)
green=rnorm(2,3,1)
red=rnorm(2,5,1)
yellow=rnorm(2,10,1)

# for the sake of the example we will code color as 1,2,3
# rather than strings to show the issue at hand
mydata=data.frame(Response=c(green,red,yellow), 
                  Color=rep(1:3,each=2))
print(mydata)
summary(lm(Response~Color,data=mydata))

mydata$Color=factor(mydata$Color,
                    levels=c(1,2,3),
                    labels=c("green","red","yellow"))

reg=lm(Response~Color,data=mydata)
summary(reg)