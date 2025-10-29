set.seed(192)
ns=100 # sample size of each sample
k=250 # collection of sample means to draw histogram

x=array(runif(ns*k,0,50),dim=c(k,sn)) #sample from 
means=apply(x,1,mean)

hist(means, # histogram
     col="peachpuff", # column color
     border="black",
     prob = TRUE, # show densities instead of frequencies
     xlab = "means",
     main = paste(c("no. of samples is "),k))
lines(density(means,bw=0.5), # density plot
      lwd = 2, # thickness of line
      col = "red")
