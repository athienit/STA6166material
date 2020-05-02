time.d=matrix(c(15,32,18,5,8,29,23,18,1,20,25,22),3,4,byrow=T,
		dimnames=list(1:3,1:4))
addmargins(time.d)

# table of proportions
p.table=prop.table(time.d)
round(addmargins(p.table),4)

# table of expected values
round(addmargins(margin.table(p.table,1)%*%t(margin.table(p.table,2))),4)

# Test statistic, expected values and residuals
T=chisq.test(time.d)
round(addmargins(T$expected),4)
round(T$stdres,4)

