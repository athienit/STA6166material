#artificicially generate data
set.seed(1521)
V110=rnorm(10,20,0.5)
V220=rnorm(16,10,0.225)

mean(V110);sd(V110)
mean(V220);sd(V220)

var.test(V110,V220,ratio=1,alternate="two.sided",conf.level=0.95)
