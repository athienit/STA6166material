lead=c(41,46,32,17,32,41,23,12,3,13,10,11,5,30,48,53,44,55,52,39,62,
	38,23,27,41,37,11,9,7,11,77,210,38,112,52,10,6)

qqnorm(lead,datax=TRUE,col=2)
qqline(lead,datax=TRUE)
# Note the axis, some programs flip the axis, hence reversing the interpretation.  To flip use datax=FALSE

hist(lead,freq=F,main="Histogram with density and normal pdf")
lines(density(lead,bw=13),lty=2,lwd=2,col="red")
plot(function(t)dnorm(t,mean(lead),sd(lead)),from=0,to=250,lwd=2,add=TRUE)
legend("topright",c("Normal","Data"),col=1:2,lty=1:2,lwd=2,bg="gray90")

### fancier version using ggplot2
## QQ plot
library(qqplotr)
library(gridExtra)
library(dplyr)



smp=data.frame(norm=lead)
#lets standardize the data
standardize <- function(data) {
  mean_val <- mean(data)
  sd_val <- sd(data)
  standardized_data <- (data - mean_val) / sd_val
  return(standardized_data)
}

smp.st=mutate(smp,norm.lead=standardize(norm))
gg <- ggplot(data = smp.st, mapping = aes(sample = norm.lead)) +
  stat_qq_band() +
  stat_qq_line() +
  stat_qq_point() +
  labs(x = "Theoretical Quantiles", y = "Sample Quantiles")+
  coord_flip() #flip axes
gg

# Histogram
dat_hist=data.frame(value=smp.st$norm.lead)
n_obs = sum(!is.na(dat_hist$value))

g <- ggplot(dat_hist, aes(value))  + 
  geom_histogram(aes(y = ..density..), colour = "black") + 
  stat_function(aes(color="Normal"),fun = dnorm, args = list(mean = 0, sd = 1))+
  geom_density(aes(color="Density"),alpha=0.2)+
  scale_colour_manual("Legend", values = c("black","red"))+
  labs(
    title = "Histogram of Standadrized Values",
    x = "Standardized values",
    y = "Density"
  )
g

grid.arrange(gg, g, ncol=2,nrow=1,top="Assesing normality of data")

### Some frequentist tests, p-values > 0.05 indicate assumption of normality holds
shapiro.test(lead)
ks.test(x=lead,y=pnorm)

