count <- rnorm(200)
hist(count, freq=F )
curve(dnorm(x), add=T)

 ###########################
 count <- rnorm(200)
 hh <- hist(count, plot=F)
 ylim.hh <- range(0, hh$density, dnorm(0))
 hist(count, freq=F, ylim=ylim.hh)
 curve(dnorm(x), add=T)
