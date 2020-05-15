par(mfrow=c(2,2))

set.seed(1925) #221186
n=c(5,20,100,500) #number of samples
sn=100 #sample size of each sample

for(i in 1:length(n)){
x=array(runif(ns*n[i],0,50),dim=c(n[i],sn)) #sample from 
means=apply(x,1,mean)

hist(means, # histogram
     col="peachpuff", # column color
     border="black",
     prob = TRUE, # show densities instead of frequencies
     xlab = "means",
     main = paste(c("no. of samples is "),n[i]))
lines(density(means,bw=0.5), # density plot
      lwd = 2, # thickness of line
      col = "red")
}