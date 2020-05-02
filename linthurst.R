#Linthurst Data: Spartina Biomass

linthurst <- read.table("http://www.stat.ufl.edu/~athienit/STA6166/linthurst.txt",
                        row.names=1,  # interpret column 1 as row names
                        skip=1,
                        col.names=c("obsnum","loc","type","biomass",
                                    "salinity","pH","K","Na","Zn"))
print(linthurst)

# regression model
linthurst.model <- lm(biomass ~ salinity + pH + K + Na + Zn, data=linthurst)
summary(linthurst.model)
AIC(linthurst.model)


# correlation matrix
round(cor(linthurst[c("biomass","salinity","pH","K","Na","Zn")]),3)  
# correlation between (Zn and pH) and (Na and K)

# remove one at a time
# K has the highrst p-value
linthurst.model.noK = update(linthurst.model, . ~ . -K)
summary(linthurst.model.noK)
linthurst.model.noKZn = update(linthurst.model.noK, . ~ . -Zn)
summary(linthurst.model.noKZn)
linthurst.model.noKZnsal = update(linthurst.model.noKZn, . ~ . -salinity)
summary(linthurst.model.noKZnsal)


# Can we remove salinity , K and Zn simultaneously?
# Not including Na as it is correlated with K.
linthurst.model.r <- update(linthurst.model, . ~ . - salinity -K -Zn)
summary(linthurst.model.r)
AIC(linthurst.model.r)

anova(linthurst.model)
anova(linthurst.model.r)

anova(linthurst.model.r,linthurst.model) # Simultaneous F-test

# Remove Na
linthurst.model.r2 <- update(linthurst.model.r, . ~ . -Na)
summary(linthurst.model.r2)
AIC(linthurst.model.r2)
# So final model to use is linthurst.model.r or linthurst.model.r2? Depends!!!

# Fit biomass for pH=4.15 AND Na=10000. and create a P.I.
newdata=data.frame(pH=4.15,Na=10000)
#apply(linthurst[,c("pH","Na")], 1, function(x, want) isTRUE(all.equal(as.numeric(x), want)), newdata)
predict(linthurst.model.r, newdata, interval="prediction",level=0.95)

# Next one should check the assumptions
source("http://www.stat.ufl.edu/~athienit/check.R")
check(linthurst.model.r,tests=TRUE)