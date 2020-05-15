lead=c(41,46,32,17,32,41,23,12,3,13,10,11,5,30,48,53,44,55,52,39,62,
	38,23,27,41,37,11,9,7,11,77,210,38,112,52,10,6)

qqnorm(lead,datax=TRUE,col=2)
qqline(lead,datax=TRUE)
# Note the axis, some programs flip the axis, hence reversing the interpretation.  To flip use datax=FALSE

plot(density(lead,bw=13),col=2,lty=2,ylim=c(0,0.016),main="Smoothed Histogram",xlab="")
plot(function(t)dnorm(t,mean(lead),sd(lead)),from=-50,to=250,add=TRUE)

legend(150,0.015,c("Normal","Data"),col=1:2,lty=1:2,bg="gray90")

### fancier version using ggplot2
## QQ plot
library(qqplotr)
smp=data.frame(norm=lead)
gg <- ggplot(data = smp, mapping = aes(sample = norm)) +
  stat_qq_band() +
  stat_qq_line() +
  stat_qq_point() +
  labs(x = "Theoretical Quantiles", y = "Sample Quantiles")+
  coord_flip() #flip axes
gg

# Histogram
dat_hist=data.frame(value=lead)
bw = 10 #binwidth
n_obs = sum(!is.na(dat_hist$value))

g <- ggplot(dat_hist, aes(value))  + 
  geom_histogram(aes(y = ..density..), binwidth = bw, colour = "black") + 
  stat_function(aes(color="Normal"),fun = dnorm, args = list(mean = mean(dat_hist$value), sd = sd(dat_hist$value)))+
  geom_density(aes(color="Density"),alpha=0.2)+
  scale_colour_manual("Legend title", values = c("black","red"))

# And then rescale the y axis.
ybreaks = seq(0,50,2) 
## On primary axis
opa=g + scale_y_continuous("Counts", breaks = round(ybreaks / (bw * n_obs),3), labels = ybreaks)

## Or on secondary axis
opa=g + scale_y_continuous("Density", sec.axis = sec_axis(
  trans = ~ . * bw * n_obs, name = "Counts", breaks = ybreaks))
opa
library(gridExtra)
grid.arrange(gg, opa, ncol=2,nrow=1,top="Assesing normality of data")

### Some frequentist tests
shapiro.test(lead)