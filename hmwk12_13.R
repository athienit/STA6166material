### Thanks to Travis Guy for this code

Dose=rep(c(0.2,0.4,0.8,1.6),each=3)
Product=rep(c("A","B","C"),4)
y=c(2.0,1.8,1.3,4.3,4.1,2.0,6.5,4.9,2.8,8.9,5.7,3.4)
ds=data.frame(Dose=(Dose),Product=factor(Product),Response=y)
xtabs(Response~Dose+Product,data=ds)
ds

# Full model
modelfull=lm(Response~Dose*Product,data=ds)
summary(modelfull)
anova(modelfull)

library(car)
scatterplot(Response~Dose|Product,smooth=FALSE,reg.line=lm,data=ds)

# Notice that a log transformation on Dose may help fit a more linear relationship
ds$Dose=log(Dose)
# Full model
modelfull=lm(Response~Dose*Product,data=ds)
summary(modelfull)
anova(modelfull)

scatterplot(Response~Dose|Product,smooth=FALSE,reg.line=lm,data=ds)
# The log transform really helps reduce s and increases R^2 adj

### Things to note:

# The coefficients for the interactions are both significant and negative
# so slope for Dose is:
# 3.3038 for A
# 3.3038-1.5004 for B
# 3.3038-2.2795 for C

# Is slope for Dose the same for B and C?
# Do a CI on beta_4 - beta_5
vmat=vcov(modelfull);round(vmat,3)
d=diff(modelfull$coefficients[6:5]);names(d)=NULL;d
d+c(1,-1)*qt(0.025,6)*sqrt(vmat[5,5]+vmat[6,6]-2*vmat[5,6])

# We can always choose which is the base group.  Let's choose C to be the base group
ds_base_c=transform(ds,Product=relevel(Product,"C"))
model_bc=lm(Response~Dose*Product,data=ds_base_c)
summary(model_bc)

# Reduced model
modelred=lm(Response~Dose+Product,data=ds)
summary(modelred)
anova(modelred)

