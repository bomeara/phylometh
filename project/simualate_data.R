library(ape)
library(deSolve)

dummy <- function(t,y,X)
{
  res <- X%*%y
  return( list(res) )
}


SingleSiteUpPassTest <- function(phy, X, root.p){
  
  #Randomly choose starting state at root using the root.values as the probability:
  root.value <- sample.int(dim(X)[2], 1, FALSE, prob=root.p)
  #Reorder the phy:
  phy <- reorder(phy, "postorder")
  ntips <- length(phy$tip.label)
  N <- dim(phy$edge)[1]
  ROOT <- ntips + 1 #perhaps use an accessor to get the root node id
  #Generate vector that contains the simulated states:
  yinit <- vector("list", ntips + phy$Nnode)
  tmp <- rep(0, length(root.p))
  tmp[root.value] <- 1
  yinit[[ROOT]] <- tmp
  
  sim.codon.data.site <- integer(ntips + phy$Nnode)
  sim.codon.data.site[ROOT] <- as.integer(root.value)
  anc <- phy$edge[,1]
  des <- phy$edge[,2]
  edge.length <- phy$edge.length
  for (i in N:1) {
    times <- c(0, edge.length[i])
    #browser()
    p <- lsoda(yinit[[anc[i]]], times, func = dummy, Xmat)[-1,-1]
    sim.codon.data.site[des[i]] <- sample.int(dim(X)[2], size = 1, FALSE, prob = p)
    tmp <- rep(0, length(root.p))
    tmp[sim.codon.data.site[des[i]]] <- 1
    yinit[[des[i]]] <- tmp
  }
  sim.codon.data.site <- sim.codon.data.site[1:ntips]
  names(sim.codon.data.site) <- phy$tip.label
  return(sim.codon.data.site)
}

nspecies <- 6
phy <- rtree(nspecies)
plot(phy)

Xmat <- matrix(0, 20, 20)
params <- runif(190)
Xmat[upper.tri(Xmat)] <- params
Xmat[lower.tri(Xmat)] <- t(Xmat)[lower.tri(Xmat)]
diag(Xmat) <- -rowSums(Xmat)


nsites <- 75
d.vec <- vector("list", nsites)
for(k in 1:nsites){
  
  site.data <- SingleSiteUpPassTest(phy, Xmat, rep(1/20, 20))
  
  D <- matrix(0, 20, length(site.data))
  colnames(D) <- names(site.data)
  for(i in 1:length(site.data))
    D[site.data[i],i] <- 1 
  
  d.vec[[k]] <- D
}

#aln <- matrix("", ncol=nsites, nrow=nspecies)
#rownames(aln) <- colnames(d.vec[[i]])
#for(i in 1:nsites)
#  aln[,i] <- seqinr::n2s(which(d.vec[[i]] == 1, arr.ind = T)[,1]-1) 

#d <- dist.dna(as.DNAbin(aln), model="raw")
#plot(nj(d))
