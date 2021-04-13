Input="
BF AOT
84.33 603.40
87.80 582.50
82.20 556.20
78.21 594.60
78.44 558.90
80.01 575.20
83.53 580.10
79.46 451.20
75.22 404.00
76.58 484.00
77.90 452.40
78.80 448.40
80.67 334.80
86.60 320.30
78.20 350.30
"

cerebral=read.table(textConnection(Input),header=T)
plot(BF~AOT,data=cerebral)
title("Cerebral Blood Flow")

reg=lm(BF~AOT,data=cerebral)
summary(reg)
abline(reg)

library(car)
powerTransform(cerebral$AOT)

reg2=lm(BF~AOT+I(AOT^2),data=cerebral)
summary(reg2)
anova(reg2) # to get SSE
curve(141.6118-0.2819271*x+0.0003091408*x^2,from=300,to=600,col=2,lty=2,add=T)

legend(400, 88, legend=c("Linear", "Quadratic"),
       col=c("black", "red"), lty=1:2, cex=0.8,
       title="Models", text.font=4, bg='lightblue')
