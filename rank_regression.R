library(Rfit)
library(MASS)
library(deming)

# Create some example data with non-linear relationship
set.seed(1243)
x <- seq(0, 10, length.out = 100)
y <- 0.5+0.1.3* + scale(rchisq(100, 1))

# Plot the data
plot(x, y)

# fit regression and check normality
re=rstudent(lm(y~x))
qqnorm(re,datax=T)
qqline(re,datax=T)

# Option 1
# Calculate the Theil-Sen estimator of the slope and intercept
ts_coef <- theilsen(y~x)
ts_coef
ts_slope <- ts_coef[2]
ts_intercept <- ts_coef[1]

# Add the regression line to the plot
abline(a = ts_intercept, b = ts_slope, col = "red")

# Option 2
fit<-rfit(y~x)
summary(fit)

