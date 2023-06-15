library(Rfit)
data(telephone)
fit <- rfit(calls ~ year, data = telephone)
summary(fit)
# The output is similar to that of lm and can be interpreted in the same way


with(telephone,plot(year, calls))
abline(fit)
abline(lm(calls ~ year, data = telephone), col = 2, lty = 2)
legend("topleft", legend = c("R", "LS"), col = 1:2, lty = 1:2)
