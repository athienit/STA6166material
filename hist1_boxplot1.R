frac=c(30,75,79,80,80,105,126,138,149,179,179,191,
       223,232,232,236,240,242,245,247,254,274,384,470)

#make fancy dotplot
library(ggplot2)
ggplot(data.frame(frac),aes(x=frac))+geom_dotplot(binwidth=20) #binwidth=1/30*range default

#make non-fancy histogram
hist(frac,nclass=6,freq=FALSE,main="Histogram",xlab="Fracture stress") # plots using frequency
hist(frac,breaks=c(0,100,200,300,500),freq=TRUE,main="Histogram",xlab="Fracture stress")
hist(frac,breaks=c(0,100,200,300,500),freq=FALSE,main="Histogram",xlab="Fracture stress") #plots using density

#somewhat fancy histogram
ggplot(data=data.frame(frac), aes(frac)) + 
  geom_histogram(aes(y =..density..), 
                 bins=5,
                 binwidth=100,
                 center=50,
                 col="red", 
                 fill="green", 
                 alpha=.2)+ 
  geom_density(col=2)+
  labs(title="Histogram", x="Fracture Stress", y="Density")

#make non-fancy boxplot
boxplot(frac,horizontal=TRUE,xlab="Fracture stress")

#make fancy boxplot
ggplot2.boxplot(data=frac)
