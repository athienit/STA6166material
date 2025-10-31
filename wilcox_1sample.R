barplot(dsignrank(0:21,6),names.arg=0:21,cex.names=0.8,ylim=c(0,0.08),col=c(rep("grey",3),rep(2,21)))
legend(0,0.075,legend=c("p-value=0.9531"),box.lty=0,fill=2)
barplot(dsignrank(0:21,6),names.arg=0:21,cex.names=0.8,ylim=c(0,0.08),col=c(rep(2,4),rep("grey",14),rep(2,4)))
legend(0,0.075,legend=c("p-value=0.1563"),box.lty=0,fill=2)

x=c(13.9, 11.0,  5.0, 21.7,  9.3,  0.9)
wilcox.test(x,mu=16,alternative="greater",conf.int=TRUE)
wilcox.test(x,mu=16,conf.int=TRUE)
