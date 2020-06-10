cruise <- read.fwf("https://github.com/athienit/STA6166material/cruise_ship.dat", width=c(20,20,rep(8,7)),
                   col.names=c("ship", "cline", "age", "tonnage", "passengers", "length", "cabins", "passdens", "crew"))

#attach(cruise)

####### Fit "Full" model
fit0 <- lm(crew ~ age + tonnage + passengers + length + cabins + passdens,data=cruise)
summary(fit0)
anova(fit0)

######### Perform Backward Elimination, Forward Selection using individual t tests
# Created function that takes a "full" regression model and 
# (backward) removes one term at a time if the individual t-test pvalue>alpha.rem
# OR
# (forward) adds one term at a time if the individual t-test pvalue<=alpha.enter
# OR 
# (both) performs forward until done and then checks existing model by permorming backwards
source("http://www.stat.ufl.edu/~athienit/stepT.R")
stepT(fit0,alpha.rem=0.2,direction="backward")
stepT(fit0,alpha.enter=0.2,direction="forward")
#stepT(fit0,alpha.rem=0.2,alpha.enter=0.2,direction="both")

######### Perform Backward Elimination, Forward Selection, and Stepwise Regression
######### Based on Model AIC (not individual regression coefficients)
######### fit1 and fit2 represent "extreme" models
library(MASS)
fit1 <- lm(crew ~ age + tonnage + passengers + length + cabins + passdens,data=cruise)
fit2 <- lm(crew ~ 1,data=cruise)
fit3=stepAIC(fit1,direction="backward")
stepAIC(fit2,direction="forward",scope=list(upper=fit1,lower=fit2))
stepAIC(fit2,direction="both",scope=list(upper=fit1,lower=fit2))

########## Perform all possible regressions (aka all subset regressions)
########## Prints out best 4 models of each # of predictors
library(leaps)

allcruise <- regsubsets(crew ~ age + tonnage + passengers + length + cabins + passdens,
                        nbest=4,data=cruise)
aprout <- summary(allcruise)
with(aprout,round(cbind(which,adjr2,cp,bic),3))     ## Prints "readable" results
plot(allcruise,scale="bic")
plot(allcruise,scale="adjr2")
