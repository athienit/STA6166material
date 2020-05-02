A=c(211.4,204.4,202,201.9,202.4,202,202.4,207.1,203.6,216,
	208.9,208.7,213.8,201.6,201.8,200.3,201.8,201.5,212.1,203.4)
B=c(186.3,205.7,184.4,203.6,180.4,202,181.5,186.7,205.7,189.1,
	183.6,188.7,188.6,204.2,181.6,208.7,181.5,208.7,186.8,182.9)

wilcox.test(A,B,paired=TRUE,conf.int=TRUE)
# The built in function gives a test statistic that is adjusted...see help file

# for remark 6.6
wilcox.test(A,B,alternative="greater",mu=5,paired=TRUE,conf.int=TRUE)