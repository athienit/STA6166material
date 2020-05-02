drug=data.frame(potency=c(10.2,9.8,10.5,9.6,10.3,10.1,10.8,10.2,9.8,10.1,10.6,
			 	9.7,10.7,9.5,10.2,9.6,10.0,9.8,10.6,9.9),
		    method=rep(c("Fresh","Stored"),5))

stripchart(drug$potency,method="stack",vertical=TRUE,
	pch=1,cex=1.5,ylab="potency")
abline(h=mean(drug$potency),col=3)
legend(1.2,10.6, c("Observations", "Grand Mean"), col = c(1,3), text.col= "black",
       lty=c(0,1),pch=c(1,NA),bg='gray90')

stripchart(potency~method,data=drug,method="stack",vertical=TRUE,
	pch=1,cex=1.5,xlab="Method",ylab="potency")
points(c(1,2),tapply(drug$potency,drug$method,mean),col=2,pch=8)
abline(h=mean(drug$potency),col=3)
legend(1.8,10.7, c("Observations","Trt Mean","Grand Mean"), col = c(1,2,3), text.col= "black",
       lty=c(0,0,1),pch=c(1,8,NA),bg='gray90')