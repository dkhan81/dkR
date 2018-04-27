income <- c(880, 1511, 2350, 3135, 3609)
mfrow=c(1,2)
mfrow=c(1)

plot(income)
plot(log(income))


x <- rnorm(1000,1,0.15)
hist(x)
hist(x^2)
hist(x^4)
hist(sqrt(x))
