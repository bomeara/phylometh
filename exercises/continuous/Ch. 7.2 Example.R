Ch. 7.2 Brownian Motion Example
library(rotl)
library(ape)
phy<-get_study_tree("ot_485","tree1")
plot(phy,cex=0.5)
axisPhylo(backward=TRUE)
#This tree is a chronogram
ngen <- 100
positions <- c(0, rep(NA,ngen))
for (i in sequence(ngen)) {
  positions[i+1] <- positions[i] + runif(1,-1,1)
}
plot(x=positions, y=sequence(length(positions)), xlab="trait value", ylab="generation", bty="n", type="l")
#Can repeat this many times and see what it looks like
ngen <- 100
nsims <- 500
final.positions <- rep(NA, nsims)
# make a plot to hold our lines
plot(x=c(-1,1)*ngen, y=c(1, 1+ngen), xlab="trait value", ylab="generation", bty="n", type="n")
for (sim.index in sequence(nsims)) {
  positions <- c(0, rep(NA,ngen))
  for (i in sequence(ngen)) {
    positions[i+1] <- positions[i] + runif(1,-1,1)
  }
  lines(positions, sequence(length(positions)), col=rgb(0,0,0,0.1))
  final.positions[sim.index] <- positions[length(positions)]
}
plot(density(final.positions), col="black", bty="n")

rweird <- function() {
  displacement <- 0
  if(runif(1,-2,2) < .1) {
    displacement <- rnorm(1, 7, 3) + runif(1,0,7)
  } else {
    displacement <- 0.5 * rexp(1, 0.3) - 1
  }
  displacement <- displacement + round(runif(1,1,100) %% 7)
  return(displacement)  
}

plot(density(replicate(100000, rweird())), bty="n")
#Rinse and Repeat

ngen <- 100
nsims <- 500
final.positions <- rep(NA, nsims)
# make a plot to hold our lines
plot(x=c(-100,1200), y=c(1, 1+ngen), xlab="trait value", ylab="generation", bty="n", type="n")
for (sim.index in sequence(nsims)) {
  positions <- c(0, rep(NA,ngen))
  for (i in sequence(ngen)) {
    positions[i+1] <- positions[i] + rweird()
  }
  lines(positions, sequence(length(positions)), col=rgb(0,0,0,0.1))
  final.positions[sim.index] <- positions[length(positions)]
}
plot(density(final.positions), col="black", bty="n")
