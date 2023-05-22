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
# used ChatGPT to make function to get mode

getmode <- function(data) {
  # Count the frequency of each unique value
  frequencies <- table(data)
  # Find the maximum frequency
  max_frequency <- max(frequencies)
  # Extract the values with maximum frequency (mode)
  mode <- as.numeric(names(frequencies[frequencies == max_frequency]))
  # Create a data frame with the mode and its frequency
  mode_data <- data.frame(Value = mode, Frequency = max_frequency)
  
  return(mode_data)
}
getmode(frac)

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



