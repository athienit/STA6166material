#reference https://www.r-bloggers.com/2019/09/understanding-bootstrap-confidence-interval-output-from-the-r-boot-package/
set.seed(2732837)
library(boot)
library(datarium)
library(broom)
library(ggplot2)

# Load the data.  A data frame containing the impact of three advertising medias 
# (youtube, facebook and newspaper) on sales. Data are the advertising budget in thousands 
# of dollars along with the sales. The advertising experiment has been repeated 200 times.
data("marketing", package = "datarium")

#fit linear regression model
model <- lm(sales ~ youtube, data = marketing)
confint(model)
plot(sales~youtube,data=marketing)
abline(model)

model.diag.metrics <- augment(model) #add residuals, etc to model
#fancier plot
ggplot(model.diag.metrics, aes(youtube, sales)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  geom_segment(aes(xend = youtube, yend = .fitted), color = "red", size = 0.3)

# CHECK ASSUMPTIONS...but we can already see issues in plot
# Normality
re=rstudent(model)
qqnorm(re,datax=T)
qqline(re,datax=T)

# Define the regression function
reg_fun <- function(formula, data, indices) {
    d <- data[indices,] #allows boot to select sample
    fit <- lm(formula, data=d) #fit regression model
    return(coef(fit)) #return coefficients 
}

# Bootstrap the regression 2000 times
results <- boot(data=marketing,statistic=reg_fun, sim="ordinary",R = 2000,formula=sales~youtube)

# use index=1 for intercept, 2 for slope since "coef" is a vector
plot(results, index=2) # plot histogram for slope coefficient
summary(results$t[,2])
boot.ci(boot.out=results, type="all",index=2) # BCa preferred
