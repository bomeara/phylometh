library(ape)
library(deSolve)

# simple ODE system to replace exp(Qt)
nuc.ode <- function(t,y,X)
{
  res <- X%*%y
  return( list(res) )
}


## For a given taxa pair, calculate the sum of log likelihoods over all sites at each time point.
## The observed data is assumed to be multinomial distributed with theta values based on the 
## probabilities obtained by solving the ODE system at various time points
AllSitesTaxaPairLike <- function(siteData, P.vec, taxa1, taxa2, nTimePoints)
{
  liks.per.time <- rep(0, nTimePoints)
  nsites <- length(P.vec)
  for(k in 1:nsites) # for each site, calculate the likelihood at each time point
  {
    curData <- siteData[[k]]
    pForSite <- P.vec[[k]]

    curP1 <- pForSite[[taxa1]]
    curP2 <- pForSite[[taxa2]]
    curP <- curP1 * curP2 # dmultinom normalizes prob argument, no need to do it here
    for(t in 1:nrow(curP)) # add likelihood at timepoint for current site to other sites at the same timepoint
    {
      #cat("t: ",  t, " Taxa", taxa1, ": ", dmultinom(curData[, taxa1], prob = curP[t,], log=T), 
      #    " Taxa", taxa2, ": ", dmultinom(curData[, taxa2], prob = curP[t,], log=T), 
      #    " Sum: ", (dmultinom(curData[, taxa1], prob = curP[t,], log=T) + dmultinom(curData[, taxa2], prob = curP[t,], log=T)), "\n")
      ## this is wrong since the data is already taken into account when solving the ode system.
#      liks.per.time[t] <- liks.per.time[t] + (dmultinom(curData[, taxa1], prob = curP[t,], log=T) + 
#                                                dmultinom(curData[, taxa2], prob = curP[t,], log=T))
      # new likelihood, but no improvement.
      liks.per.time[t] <- liks.per.time[t] + sum(log(curP[t, ]))
    }
  }
  return(liks.per.time)
}


## Simulate all sites backwards in time from observed site data.
## probabilities for each Nuc at each Site for each Time is returned
AllSitesODESolution <- function(siteData, X, times)
{
  siteProbVec <- vector("list", length(siteData))
  for(i in 1:length(siteData)) # for all sites
  {
    curD <- siteData[[i]]
    siteP <- vector("list", ncol(curD))
    for(k in 1:ncol(curD)) # for all species
      siteP[[k]] <- lsoda(curD[, k], times, func = nuc.ode, X)[-1,-1]
    
    siteProbVec[[i]] <- siteP
  }
  
  return(siteProbVec)
}

## Find all pairwise maximum likelihood values and the coresbonding time
AllSitePairwiseLikelihood <- function(siteData, X, tmax)
{
  times <- seq(from = 0, to = tmax, by = tmax/(tmax*1000))
  
  allSitePVec <- AllSitesODESolution(siteData, X, times)
  ntaxa <- ncol(siteData[[1]])
  times <- times[-1]
  
  log.liks <- matrix(NA, ncol=ntaxa, nrow=ntaxa)
  bl.times <- matrix(NA, ncol=ntaxa, nrow=ntaxa)
  
  tip.names <- colnames(siteData[[1]])
  colnames(log.liks) <- tip.names
  rownames(log.liks) <- tip.names
  colnames(bl.times) <- tip.names
  rownames(bl.times) <- tip.names
  
  # look at all taxa pairs and find the most likely divergend time
  for(i in 1:ntaxa){
    for(j in i:ntaxa){
      if(i == j) next
      
      liks.per.time <- AllSitesTaxaPairLike(siteData, allSitePVec, i, j, length(times))
      k <- which(liks.per.time == max(liks.per.time, na.rm=T)) # where is the maximum likelihood
      log.liks[i, j] <- liks.per.time[k]
      bl.times[i, j] <- times[k]
    }
  }
  diag(bl.times) <- NA
  diag(log.liks) <- NA
  
  bl.times[lower.tri(bl.times)] <- t(bl.times)[lower.tri(bl.times)]
  log.liks[lower.tri(log.liks)] <- t(log.liks)[lower.tri(log.liks)]
  return(list(logLik=log.liks, blTimes=bl.times))
}

## simulate a tree and data with "simulate_data.R"
## you can just source both files and everything will run.

res <- AllSitePairwiseLikelihood(d.vec, Xmat, 0.01)
# Currently, the first time is always the most likely one. 
# This makes sense in cases in which a taxon pair shares the same observation (Taxa1 and Taxa2 have an "a").
# I first assumed that there are to many sites sharing an observation.
# However, even when different nucleotides are observed, the first time point seems to be the most likely one. 
# So what happends is that each site seems to have a monoton declining likelihood function with time, summing such functions will only produce
# another monoton declining function.

# Exploring the approach further, I realized:
# - If the initial conditions look like [0,1,0,0] the state with the one will always decline. If now two taxa share the same initial conditions, the first timepoint will be the most likey one.
# - The same same holds true if the initial conditions differ ([0,1,0,0] and [1,0,0,0]). When the resulting probabilities are muliplied, the first two values in the vector will be larger than the last two. 
#   In addition, the monotone behaviour of the two time series will be retained after muliplication.

# I think I understand mathematicaly why this happends. However, I am not clear on why other methods do not seem to suffer from that behaviour.
# Looking at the likelihood value, I always find one taxon that is appears to be the closest relative in the case of all other taxa. This is a puzzling behaviour.
res$blTimes
res$logLik
apply(res$logLik, 1, max, na.rm=T)


