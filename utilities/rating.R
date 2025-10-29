rating=matrix(c(21,20,4,3,25,36,14,8,2,10,7,6),4,3,
       dimnames=list(c("M.D.","Good","Adequate","Undesirable"),c("Outstanding","Average","Poor")))
rating
addmargins(rating)

test=chisq.test(rating);test
test$expected
test$stdres

# Exact test
fisher.test(rating)