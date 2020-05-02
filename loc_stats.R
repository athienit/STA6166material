# enter the data as vector
frac=c(30,75,79,80,80,105,126,138,149,179,179,191,
	223,232,232,236,240,242,245,247,254,274,384,470)

# to sort the data
frac=sort(frac) #not necessary

#---------------------------------------------------------------------

### LOCATION ###
# mean
mean(frac)

# median
median(frac)

# mode
freq=table(frac) # find frequency of observations
which(freq==max(freq))

# 5% trimmed mean
mean(frac, trim=0.05)

# 25th percentiles, type=6 is weighted average
quantile(frac,0.25,type=6)

#------------------------------------------------------------------

### SPREAD ###
# variance and standard deviation
var(frac)
sqrt(var(frac)) #standard deviation
sd(frac)

# range
diff(range(frac))

# IQR
IQR(frac,type=6)



