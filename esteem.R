Height=c(68, 71, 62, 75, 58, 60, 67, 68, 71, 69, 68, 67, 63, 62, 60, 63, 65, 67, 63, 61)
Esteem=c(4.1, 4.6, 3.8, 4.4, 3.2, 3.1, 3.8, 4.1, 4.3, 3.7, 3.5, 3.2, 3.7, 3.3, 3.4, 4.0, 4.1, 3.8, 3.4, 3.6)

plot(Esteem,Height,pch=19)
abline(lm(Height~Esteem), col="red")

cor(Height,Esteem)