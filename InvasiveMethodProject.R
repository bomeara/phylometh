# Phylogenetic Methods Project - M Mamantov
# Does invasion stage effect plasticity? Does plasticity decline over invasion (new invasion > old invasion)? Does plasticity increase probability to invade?

# First, install and load all necessary packages
# Install.packages(c("ape","geiger", "OUwie", "TreeSim"))
library(ape)
library(geiger)
library(OUwie)
library(TreeSim)
library(phytools)

# Function that tests whether a trait leads to invasion and whether that trait decreases or increases over the course of an invasion. We will then test this method. 

InvasionStagesFun <- function(plasticity.data,invasion.data,tree){
  # Get data in necessary form
  full.data <- cbind.data.frame(invasion.data, plasticity.data)
  colnames(full.data)<-c("Invasive Status","Plasticity")
  
  # Perform stocahstic character mapping of invasive state and show the tree
  traits.tree <- make.simmap(tree, x = invasion.data[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
  plotSimmap(traits.tree)
  legend("bottomleft", legend=c("NNL","NNH","NI","NO"),lwd=1, bty="n", col=c("black","red","green","blue"))
  
  # Use OUwie to calculate the optimum trait value along each branch (thetas)
  OUwie.data <- cbind.data.frame(rownames(full.data),invasion.data,plasticity.data)
  results <- OUwie(traits.tree,OUwie.data,model="OUM",simmap.tree=TRUE)
  
  # Use our results to answer the big questions
  # Visualize and compare bar height
  par(mar=c(4.75,4.75,1,1))
  thetas <- results$theta[,1]
  barplot(height=thetas, ylab= "Optimum Plasticity Value", names.arg= c("NNL","NNH","NI","OI"))
  
  # Print the answers too - just for good measure
  print(thetas)
  # Is plasticity effecting invasiveness of natives?
  if (abs(thetas[1]) >= abs(thetas[2])){
    print("Species less likely to invade have higher plasticity")}
  if (abs(thetas[1]) < abs(thetas[2])){
    print("Species more likely to invade have higher plasticity")}
  
  # Is plasticity decreasing over invasion history?
  if (abs(thetas[3]) >= abs(thetas[4])){
    print("New invadors have greater or equal plasticity")}
  if (abs(thetas[3]) < abs(thetas[4])){
    print("New invadors have less plasticity")}}

# Model testing - raw results and lots of data sets

# You need a tree. Generate trees of different numbers of species (low, medium, high). I generate 10 different trees with each taxa number to increase the variance in the data used to test the model. 

trees.low <- sim.bd.taxa(n=25,numbsim=10,lambda=2,mu=0.5,complete=FALSE)
trees.medium <- sim.bd.taxa(n=50,numbsim=10,lambda=2,mu=0.5,complete=FALSE)
trees.high <- sim.bd.taxa(n=100,numbsim=10,lambda=2,mu=0.5,complete=FALSE)


# Now, generate a rate matrix that will confine shifts between invasion stages.

# There are four invasion stages: native, low liklihood of invasion (NNL); native, high liklihood of invasion (NNH); invasive, new invasion (NI); invasive, old invasion (OI). If plasticity increases invasiveness, we would predict that plasticity theta will be higher for NNH state than NNL state. If plasticity decreases over the course of invasion, we would expect that plasticity theta will be higher for NI state than OI state. 

rate.matrix <- matrix(data=c(-0.9,0.2,0,0,0.8,-.7,0,0.1,0.1,0.5,-0.5,0,0,0,0.5,-0.1), nrow=4, ncol=4)
rownames(rate.matrix) <- c("NNL","NNH","NI","OI")
colnames(rate.matrix) <- c("NNL","NNH","NI","OI")


# Use the matrix to generate invasion stage data for each tree size. Using the five different trees, five different invasion state data sets are created for each tree size. 

# Small tree
invasion.data.low1 <- sim.char(trees.low[[1]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low1))!=4) {
  invasion.data.low1 <- sim.char(trees.low[[1]], rate.matrix, model="discrete",root=1)
}

invasion.data.low2 <- sim.char(trees.low[[2]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low2))!=4) {
  invasion.data.low2 <- sim.char(trees.low[[2]], rate.matrix, model="discrete",root=1)
}

invasion.data.low3 <- sim.char(trees.low[[3]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low3))!=4) {
  invasion.data.low3 <- sim.char(trees.low[[3]], rate.matrix, model="discrete",root=1)
}

invasion.data.low4 <- sim.char(trees.low[[4]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low4))!=4) {
  invasion.data.low4 <- sim.char(trees.low[[4]], rate.matrix, model="discrete",root=1)
}

invasion.data.low5 <- sim.char(trees.low[[5]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low5))!=4) {
  invasion.data.low5 <- sim.char(trees.low[[5]], rate.matrix, model="discrete",root=1)
}

invasion.data.low6 <- sim.char(trees.low[[6]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low6))!=4) {
  invasion.data.low6 <- sim.char(trees.low[[6]], rate.matrix, model="discrete",root=1)
}

invasion.data.low7 <- sim.char(trees.low[[7]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low7))!=4) {
  invasion.data.low7 <- sim.char(trees.low[[7]], rate.matrix, model="discrete",root=1)
}

invasion.data.low8 <- sim.char(trees.low[[8]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low8))!=4) {
  invasion.data.low8 <- sim.char(trees.low[[8]], rate.matrix, model="discrete",root=1)
}

invasion.data.low9 <- sim.char(trees.low[[9]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low9))!=4) {
  invasion.data.low9 <- sim.char(trees.low[[9]], rate.matrix, model="discrete",root=1)
}

invasion.data.low10 <- sim.char(trees.low[[10]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.low10))!=4) {
  invasion.data.low10 <- sim.char(trees.low[[10]], rate.matrix, model="discrete",root=1)
}

# Medium tree
invasion.data.medium1 <- sim.char(trees.medium[[1]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium1))!=4) {
  invasion.data.medium1 <- sim.char(trees.medium[[1]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium2 <- sim.char(trees.medium[[2]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium2))!=4) {
  invasion.data.medium2 <- sim.char(trees.medium[[2]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium3 <- sim.char(trees.medium[[3]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium3))!=4) {
  invasion.data.medium3 <- sim.char(trees.medium[[3]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium4 <- sim.char(trees.medium[[4]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium4))!=4) {
  invasion.data.medium4 <- sim.char(trees.medium[[4]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium5 <- sim.char(trees.medium[[5]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium5))!=4) {
  invasion.data.medium5 <- sim.char(trees.medium[[5]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium6 <- sim.char(trees.medium[[6]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium6))!=4) {
  invasion.data.medium6 <- sim.char(trees.medium[[6]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium7 <- sim.char(trees.medium[[7]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium7))!=4) {
  invasion.data.medium7 <- sim.char(trees.medium[[7]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium8 <- sim.char(trees.medium[[8]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium8))!=4) {
  invasion.data.medium8 <- sim.char(trees.medium[[8]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium9 <- sim.char(trees.medium[[9]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium9))!=4) {
  invasion.data.medium9 <- sim.char(trees.medium[[9]], rate.matrix, model="discrete",root=1)
}

invasion.data.medium10 <- sim.char(trees.medium[[10]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.medium10))!=4) {
  invasion.data.medium10 <- sim.char(trees.medium[[10]], rate.matrix, model="discrete",root=1)
}

# Big tree
invasion.data.high1 <- sim.char(trees.high[[1]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high1))!=4) {
  invasion.data.high1 <- sim.char(trees.high[[1]], rate.matrix, model="discrete",root=1)
}

invasion.data.high2 <- sim.char(trees.high[[2]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high2))!=4) {
  invasion.data.high2 <- sim.char(trees.high[[2]], rate.matrix, model="discrete",root=1)
}

invasion.data.high3 <- sim.char(trees.high[[3]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high3))!=4) {
  invasion.data.high3 <- sim.char(trees.high[[3]], rate.matrix, model="discrete",root=1)
}

invasion.data.high4 <- sim.char(trees.high[[4]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high4))!=4) {
  invasion.data.high4 <- sim.char(trees.high[[4]], rate.matrix, model="discrete",root=1)
}

invasion.data.high5 <- sim.char(trees.high[[5]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high5))!=4) {
  invasion.data.high5 <- sim.char(trees.high[[5]], rate.matrix, model="discrete",root=1)
}

invasion.data.high6 <- sim.char(trees.high[[6]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high6))!=4) {
  invasion.data.high6 <- sim.char(trees.high[[6]], rate.matrix, model="discrete",root=1)
}

invasion.data.high7 <- sim.char(trees.high[[7]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high7))!=4) {
  invasion.data.high7 <- sim.char(trees.high[[7]], rate.matrix, model="discrete",root=1)
}

invasion.data.high8 <- sim.char(trees.high[[8]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high8))!=4) {
  invasion.data.high8 <- sim.char(trees.high[[8]], rate.matrix, model="discrete",root=1)
}

invasion.data.high9 <- sim.char(trees.high[[9]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high9))!=4) {
  invasion.data.high9 <- sim.char(trees.high[[9]], rate.matrix, model="discrete",root=1)
}

invasion.data.high10 <- sim.char(trees.high[[10]], rate.matrix, model="discrete",root=1)
while(length(unique(invasion.data.high10))!=4) {
  invasion.data.high10 <- sim.char(trees.high[[10]], rate.matrix, model="discrete",root=1)
}


# Generate plasticity data:

# First, generate plasticity data randomly across the different tree using Brownian motion:
rplasticity.data.low1 <- sim.char(trees.low[[1]],.2,model="BM",root=0.5)
rplasticity.data.low2 <- sim.char(trees.low[[2]],.2,model="BM",root=0.5)
rplasticity.data.low3 <- sim.char(trees.low[[3]],.2,model="BM",root=0.5)
rplasticity.data.low4 <- sim.char(trees.low[[4]],.2,model="BM",root=0.5)
rplasticity.data.low5 <- sim.char(trees.low[[5]],.2,model="BM",root=0.5)
rplasticity.data.low6 <- sim.char(trees.low[[6]],.2,model="BM",root=0.5)
rplasticity.data.low7 <- sim.char(trees.low[[7]],.2,model="BM",root=0.5)
rplasticity.data.low8 <- sim.char(trees.low[[8]],.2,model="BM",root=0.5)
rplasticity.data.low9 <- sim.char(trees.low[[9]],.2,model="BM",root=0.5)
rplasticity.data.low10 <- sim.char(trees.low[[10]],.2,model="BM",root=0.5)

rplasticity.data.medium1 <- sim.char(trees.medium[[1]],.2,model="BM",root=0.5)
rplasticity.data.medium2 <- sim.char(trees.medium[[2]],.2,model="BM",root=0.5)
rplasticity.data.medium3 <- sim.char(trees.medium[[3]],.2,model="BM",root=0.5)
rplasticity.data.medium4 <- sim.char(trees.medium[[4]],.2,model="BM",root=0.5)
rplasticity.data.medium5 <- sim.char(trees.medium[[5]],.2,model="BM",root=0.5)
rplasticity.data.medium6 <- sim.char(trees.medium[[6]],.2,model="BM",root=0.5)
rplasticity.data.medium7 <- sim.char(trees.medium[[7]],.2,model="BM",root=0.5)
rplasticity.data.medium8 <- sim.char(trees.medium[[8]],.2,model="BM",root=0.5)
rplasticity.data.medium9 <- sim.char(trees.medium[[9]],.2,model="BM",root=0.5)
rplasticity.data.medium10 <- sim.char(trees.medium[[10]],.2,model="BM",root=0.5)

rplasticity.data.high1 <- sim.char(trees.high[[1]],.2,model="BM",root=0.5)
rplasticity.data.high2 <- sim.char(trees.high[[2]],.2,model="BM",root=0.5)
rplasticity.data.high3 <- sim.char(trees.high[[3]],.2,model="BM",root=0.5)
rplasticity.data.high4 <- sim.char(trees.high[[4]],.2,model="BM",root=0.5)
rplasticity.data.high5 <- sim.char(trees.high[[5]],.2,model="BM",root=0.5)
rplasticity.data.high6 <- sim.char(trees.high[[5]],.2,model="BM",root=0.5)
rplasticity.data.high7 <- sim.char(trees.high[[5]],.2,model="BM",root=0.5)
rplasticity.data.high8 <- sim.char(trees.high[[5]],.2,model="BM",root=0.5)
rplasticity.data.high9 <- sim.char(trees.high[[5]],.2,model="BM",root=0.5)
rplasticity.data.high10 <- sim.char(trees.high[[5]],.2,model="BM",root=0.5)


# Now, generate plasticity data based on our hypotheses. Can the model pick up the trends in the data?

# First, we need a function that puts OUwie simulated data in the proper form for our function. 
data.fix.fun <- function(simulated.data,tree){
  simulated.data.right.format <- sim.char(tree,.2,model="BM",root=0.5)
  simulated.data.right.format[,,1] <- simulated.data[,2]
  dimnames(simulated.data.right.format)[[1]] <- simulated.data[,1]
  return(simulated.data.right.format)
}

# Plasticity data that matches our predictions (higher plasticity at NNH than NNL, decreased plasticity from NI to OI). High degree of difference between thetas. NNL = 0.5, NNH = 2.5, NI = 2.5, OI = 0.5. 

# Small tree
traits.tree.low1 <- make.simmap(trees.low[[1]], x = invasion.data.low1[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low2 <- make.simmap(trees.low[[2]], x = invasion.data.low2[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low3 <- make.simmap(trees.low[[3]], x = invasion.data.low3[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low4 <- make.simmap(trees.low[[4]], x = invasion.data.low4[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low5 <- make.simmap(trees.low[[5]], x = invasion.data.low5[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low6 <- make.simmap(trees.low[[6]], x = invasion.data.low6[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low7 <- make.simmap(trees.low[[7]], x = invasion.data.low7[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low8 <- make.simmap(trees.low[[8]], x = invasion.data.low8[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low9 <- make.simmap(trees.low[[9]], x = invasion.data.low9[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.low10 <- make.simmap(trees.low[[10]], x = invasion.data.low10[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))

plasticity.data.1.low <- OUwie.sim(traits.tree.low1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.2.low <- OUwie.sim(traits.tree.low2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.3.low <- OUwie.sim(traits.tree.low3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.4.low <- OUwie.sim(traits.tree.low4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.5.low <- OUwie.sim(traits.tree.low5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.6.low <- OUwie.sim(traits.tree.low6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.7.low <- OUwie.sim(traits.tree.low7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.8.low <- OUwie.sim(traits.tree.low8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.9.low <- OUwie.sim(traits.tree.low9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.10.low <- OUwie.sim(traits.tree.low10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))

# Medium tree
traits.tree.medium1 <- make.simmap(trees.medium[[1]], x = invasion.data.medium1[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium2 <- make.simmap(trees.medium[[2]], x = invasion.data.medium2[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium3 <- make.simmap(trees.medium[[3]], x = invasion.data.medium3[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium4 <- make.simmap(trees.medium[[4]], x = invasion.data.medium4[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium5 <- make.simmap(trees.medium[[5]], x = invasion.data.medium5[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium6 <- make.simmap(trees.medium[[6]], x = invasion.data.medium6[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium7 <- make.simmap(trees.medium[[7]], x = invasion.data.medium7[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium8 <- make.simmap(trees.medium[[8]], x = invasion.data.medium8[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium9 <- make.simmap(trees.medium[[9]], x = invasion.data.medium9[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.medium10 <- make.simmap(trees.medium[[10]], x = invasion.data.medium10[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))


plasticity.data.1.medium <- OUwie.sim(traits.tree.medium1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.2.medium <- OUwie.sim(traits.tree.medium2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.3.medium <- OUwie.sim(traits.tree.medium3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.4.medium <- OUwie.sim(traits.tree.medium4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.5.medium <- OUwie.sim(traits.tree.medium5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.6.medium <- OUwie.sim(traits.tree.medium6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.7.medium <- OUwie.sim(traits.tree.medium7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.8.medium <- OUwie.sim(traits.tree.medium8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.9.medium <- OUwie.sim(traits.tree.medium9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.10.medium <- OUwie.sim(traits.tree.medium10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))

# Big tree
traits.tree.high1 <- make.simmap(trees.high[[1]], x = invasion.data.high1[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high2 <- make.simmap(trees.high[[2]], x = invasion.data.high2[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high3 <- make.simmap(trees.high[[3]], x = invasion.data.high3[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high4 <- make.simmap(trees.high[[4]], x = invasion.data.high4[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high5 <- make.simmap(trees.high[[5]], x = invasion.data.high5[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high6 <- make.simmap(trees.high[[6]], x = invasion.data.high6[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high7 <- make.simmap(trees.high[[7]], x = invasion.data.high7[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high8 <- make.simmap(trees.high[[8]], x = invasion.data.high8[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high9 <- make.simmap(trees.high[[9]], x = invasion.data.high9[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))
traits.tree.high10 <- make.simmap(trees.high[[10]], x = invasion.data.high10[,,1], model = "ARD", nsim=1, pi=c(.5,.5,0,0))

plasticity.data.1.high <- OUwie.sim(traits.tree.high1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.2.high <- OUwie.sim(traits.tree.high2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.3.high <- OUwie.sim(traits.tree.high3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.4.high <- OUwie.sim(traits.tree.high4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.5.high <- OUwie.sim(traits.tree.high5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.6.high <- OUwie.sim(traits.tree.high6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.7.high <- OUwie.sim(traits.tree.high7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.8.high <- OUwie.sim(traits.tree.high8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.9.high <- OUwie.sim(traits.tree.high9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))
plasticity.data.10.high <- OUwie.sim(traits.tree.high10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,2.5,2.5,0.5))

# Plasticity data that matches our predictions (higher plasticity at NNH than NNL, decreased plasticity from NI to OI). Medium degree of difference between thetas. NNL = 0.5, NNH = 1.5, NI = 1.5, OI = 0.5.

plasticity.data.1.low2 <- OUwie.sim(traits.tree.low1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.2.low2 <- OUwie.sim(traits.tree.low2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.3.low2 <- OUwie.sim(traits.tree.low3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.4.low2 <- OUwie.sim(traits.tree.low4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.5.low2 <- OUwie.sim(traits.tree.low5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.6.low2 <- OUwie.sim(traits.tree.low6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.7.low2 <- OUwie.sim(traits.tree.low7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.8.low2 <- OUwie.sim(traits.tree.low8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.9.low2 <- OUwie.sim(traits.tree.low9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.10.low2 <- OUwie.sim(traits.tree.low10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))

plasticity.data.1.medium2 <- OUwie.sim(traits.tree.medium1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.2.medium2 <- OUwie.sim(traits.tree.medium2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.3.medium2 <- OUwie.sim(traits.tree.medium3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.4.medium2 <- OUwie.sim(traits.tree.medium4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.5.medium2 <- OUwie.sim(traits.tree.medium5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.6.medium2 <- OUwie.sim(traits.tree.medium6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.7.medium2 <- OUwie.sim(traits.tree.medium7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.8.medium2 <- OUwie.sim(traits.tree.medium8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.9.medium2 <- OUwie.sim(traits.tree.medium9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.10.medium2 <- OUwie.sim(traits.tree.medium10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))

plasticity.data.1.high2 <- OUwie.sim(traits.tree.high1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.2.high2 <- OUwie.sim(traits.tree.high2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.3.high2 <- OUwie.sim(traits.tree.high3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.4.high2 <- OUwie.sim(traits.tree.high4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.5.high2 <- OUwie.sim(traits.tree.high5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.6.high2 <- OUwie.sim(traits.tree.high6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.7.high2 <- OUwie.sim(traits.tree.high7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.8.high2 <- OUwie.sim(traits.tree.high8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.9.high2 <- OUwie.sim(traits.tree.high9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))
plasticity.data.10.high2 <- OUwie.sim(traits.tree.high10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.5,1.5,0.5))

# Plasticity data that matches our predictions (higher plasticity at NNH than NNL, decreased plasticity from NI to OI). Small degree of difference between thetas. NNL = 0.5, NNH = 1, NI = 1, OI = 0.5.

plasticity.data.1.low3 <- OUwie.sim(traits.tree.low1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.2.low3 <- OUwie.sim(traits.tree.low2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.3.low3 <- OUwie.sim(traits.tree.low3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.4.low3 <- OUwie.sim(traits.tree.low4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.5.low3 <- OUwie.sim(traits.tree.low5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.6.low3 <- OUwie.sim(traits.tree.low6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.7.low3 <- OUwie.sim(traits.tree.low7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.8.low3 <- OUwie.sim(traits.tree.low8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.9.low3 <- OUwie.sim(traits.tree.low9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.10.low3 <- OUwie.sim(traits.tree.low10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))

plasticity.data.1.medium3 <- OUwie.sim(traits.tree.medium1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.2.medium3 <- OUwie.sim(traits.tree.medium2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.3.medium3 <- OUwie.sim(traits.tree.medium3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.4.medium3 <- OUwie.sim(traits.tree.medium4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.5.medium3 <- OUwie.sim(traits.tree.medium5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.6.medium3 <- OUwie.sim(traits.tree.medium6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.7.medium3 <- OUwie.sim(traits.tree.medium7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.8.medium3 <- OUwie.sim(traits.tree.medium8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.9.medium3 <- OUwie.sim(traits.tree.medium9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.10.medium3 <- OUwie.sim(traits.tree.medium10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))

plasticity.data.1.high3 <- OUwie.sim(traits.tree.high1,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.2.high3 <- OUwie.sim(traits.tree.high2,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.3.high3 <- OUwie.sim(traits.tree.high3,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.4.high3 <- OUwie.sim(traits.tree.high4,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.5.high3 <- OUwie.sim(traits.tree.high5,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.6.high3 <- OUwie.sim(traits.tree.high6,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.7.high3 <- OUwie.sim(traits.tree.high7,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.8.high3 <- OUwie.sim(traits.tree.high8,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.9.high3 <- OUwie.sim(traits.tree.high9,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))
plasticity.data.10.high3 <- OUwie.sim(traits.tree.high10,simmap.tree=TRUE, alpha = c(1,1,1,1),sigma.sq=c(0.45,0.45,0.45,0.45), theta0=0, theta = c(0.5,1.0,1.0,0.5))

# Data collection 
# Codes:
# rplasticity = stochastic plasticity data
# plasticity = plasticity data matches hypotheses that more plastic species are more likely to invade and new invadors have higher plasticity
### plasticityh = high degree of difference between thetas, NNL = 0.5, NNH = 2.5, NI = 2.5, and OI = 0.5
### plasticitym = medium degree of difference between thetas, NNL = 0.5, NNH = 1.5, NI = 1.5, and OI = 0.5
### plasticityl = low degree of difference between thetas, NNL = 0.5, NNH = 1.0, NI = 1.0, and OI = 0.5

# h1 - hypothesis about plasticity effect on invasion liklihood
# h2 - hypothesis about declining plasticity over invasion history

# 1 as result for h1 -> more plastic species more likely to invade
# 0 as result for h1 -> less plastic species more likely to invade

# 1 as result for h2 -> new invadors more plastic
# 0 as result for h2 -> old invadors more plastic 

# Small tree summary (taxa number = 25)

results.data.low <- data.frame(rplasticity.h1=rep(NA,10),rplasticity.h2=rep(NA,10),plasticityh.h1=rep(NA,10),plasticityh.h2=rep(NA,10),plasticitym.h1=rep(NA,10),plasticitym.h2=rep(NA,10),plasticityl.h1=rep(NA,10),plasticityl.h2=rep(NA,10))

InvasionStagesFun(plasticity.data = rplasticity.data.low1, invasion.data=invasion.data.low1, trees.low[[1]])
InvasionStagesFun(plasticity.data = rplasticity.data.low2, invasion.data=invasion.data.low2, trees.low[[2]])
InvasionStagesFun(plasticity.data = rplasticity.data.low3, invasion.data=invasion.data.low3, trees.low[[3]])
InvasionStagesFun(plasticity.data = rplasticity.data.low4, invasion.data=invasion.data.low4, trees.low[[4]])
InvasionStagesFun(plasticity.data = rplasticity.data.low5, invasion.data=invasion.data.low5, trees.low[[5]])
InvasionStagesFun(plasticity.data = rplasticity.data.low6, invasion.data=invasion.data.low6, trees.low[[6]])
InvasionStagesFun(plasticity.data = rplasticity.data.low7, invasion.data=invasion.data.low7, trees.low[[7]])
InvasionStagesFun(plasticity.data = rplasticity.data.low8, invasion.data=invasion.data.low8, trees.low[[8]])
InvasionStagesFun(plasticity.data = rplasticity.data.low9, invasion.data=invasion.data.low9, trees.low[[9]])
InvasionStagesFun(plasticity.data = rplasticity.data.low10, invasion.data=invasion.data.low10, trees.low[[10]])

results.data.low[1,1] <- 0
results.data.low[1,2] <- 1
results.data.low[2,1] <- 0
results.data.low[2,2] <- 0
results.data.low[3,1] <- 0
results.data.low[3,2] <- 1
results.data.low[4,1] <- 0
results.data.low[4,2] <- 1
results.data.low[5,1] <- 0
results.data.low[5,2] <- 1
results.data.low[6,1] <- 1
results.data.low[6,2] <- 0 
results.data.low[7,1] <- 1
results.data.low[7,2] <- 1
results.data.low[8,1] <- 1
results.data.low[8,2] <- 1
results.data.low[9,1] <- 0
results.data.low[9,2] <- 1
results.data.low[10,1] <- 0
results.data.low[10,2] <- 0
  
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.low, trees.low[[1]]), invasion.data=invasion.data.low1, trees.low[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.low, trees.low[[2]]), invasion.data=invasion.data.low2, trees.low[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.low, trees.low[[3]]), invasion.data=invasion.data.low3, trees.low[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.low, trees.low[[4]]), invasion.data=invasion.data.low4, trees.low[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.low, trees.low[[5]]), invasion.data=invasion.data.low5, trees.low[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.low, trees.low[[6]]), invasion.data=invasion.data.low6, trees.low[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.low, trees.low[[7]]), invasion.data=invasion.data.low7, trees.low[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.low, trees.low[[8]]), invasion.data=invasion.data.low8, trees.low[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.low, trees.low[[9]]), invasion.data=invasion.data.low9, trees.low[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.low, trees.low[[10]]), invasion.data=invasion.data.low10, trees.low[[10]])

results.data.low[1,3] <- 1
results.data.low[1,4] <- 1
results.data.low[2,3] <- 1
results.data.low[2,4] <- 1
results.data.low[3,3] <- 0
results.data.low[3,4] <- 1
results.data.low[4,3] <- 1
results.data.low[4,4] <- 1
results.data.low[5,3] <- 1
results.data.low[5,4] <- 0
results.data.low[6,3] <- 1
results.data.low[6,4] <- 1 
results.data.low[7,3] <- 1
results.data.low[7,4] <- 1
results.data.low[8,3] <- 1
results.data.low[8,4] <- 1  
results.data.low[9,3] <- 1
results.data.low[9,4] <- 1
results.data.low[10,3] <- 1
results.data.low[10,4] <- 1

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.low2, trees.low[[1]]), invasion.data=invasion.data.low1, trees.low[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.low2, trees.low[[2]]), invasion.data=invasion.data.low2, trees.low[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.low2, trees.low[[3]]), invasion.data=invasion.data.low3, trees.low[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.low2, trees.low[[4]]), invasion.data=invasion.data.low4, trees.low[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.low2, trees.low[[5]]), invasion.data=invasion.data.low5, trees.low[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.low2, trees.low[[6]]), invasion.data=invasion.data.low6, trees.low[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.low2, trees.low[[7]]), invasion.data=invasion.data.low7, trees.low[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.low2, trees.low[[8]]), invasion.data=invasion.data.low8, trees.low[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.low2, trees.low[[9]]), invasion.data=invasion.data.low9, trees.low[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.low2, trees.low[[10]]), invasion.data=invasion.data.low10, trees.low[[10]])

results.data.low[1,5] <- 0
results.data.low[1,6] <- 1
results.data.low[2,5] <- 1
results.data.low[2,6] <- 1
results.data.low[3,5] <- 0
results.data.low[3,6] <- 1
results.data.low[4,5] <- 0
results.data.low[4,6] <- 1
results.data.low[5,5] <- 0
results.data.low[5,6] <- 1
results.data.low[6,5] <- 1
results.data.low[6,6] <- 1   
results.data.low[7,5] <- 1
results.data.low[7,6] <- 1
results.data.low[8,5] <- 0
results.data.low[8,6] <- 1
results.data.low[9,5] <- 1
results.data.low[9,6] <- 1
results.data.low[10,5] <- 1
results.data.low[10,6] <- 1
  
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.low3, trees.low[[1]]), invasion.data=invasion.data.low1, trees.low[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.low3, trees.low[[2]]), invasion.data=invasion.data.low2, trees.low[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.low3, trees.low[[3]]), invasion.data=invasion.data.low3, trees.low[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.low3, trees.low[[4]]), invasion.data=invasion.data.low4, trees.low[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.low3, trees.low[[5]]), invasion.data=invasion.data.low5, trees.low[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.low3, trees.low[[6]]), invasion.data=invasion.data.low6, trees.low[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.low3, trees.low[[7]]), invasion.data=invasion.data.low7, trees.low[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.low3, trees.low[[8]]), invasion.data=invasion.data.low8, trees.low[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.low3, trees.low[[9]]), invasion.data=invasion.data.low9, trees.low[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.low3, trees.low[[10]]), invasion.data=invasion.data.low10, trees.low[[10]])

results.data.low[1,7] <-1
results.data.low[1,8] <- 1
results.data.low[2,7] <- 1
results.data.low[2,8] <- 1
results.data.low[3,7] <- 0
results.data.low[3,8] <- 0
results.data.low[4,7] <- 1
results.data.low[4,8] <- 0
results.data.low[5,7] <- 0
results.data.low[5,8] <- 0
results.data.low[6,7] <- 1
results.data.low[6,8] <- 1 
results.data.low[7,7] <- 1
results.data.low[7,8] <- 0
results.data.low[8,7] <- 1
results.data.low[8,8] <- 1
results.data.low[9,7] <- 1
results.data.low[9,8] <- 1
results.data.low[10,7] <- 1
results.data.low[10,8] <- 0

# Medium tree summary (taxa number = 50)

results.data.medium <- data.frame(rplasticity.h1=rep(NA,10),rplasticity.h2=rep(NA,10),plasticityh.h1=rep(NA,10),plasticityh.h2=rep(NA,10),plasticitym.h1=rep(NA,10),plasticitym.h2=rep(NA,10),plasticityl.h1=rep(NA,10),plasticityl.h2=rep(NA,10))

InvasionStagesFun(plasticity.data = rplasticity.data.medium1, invasion.data=invasion.data.medium1, trees.medium[[1]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium2, invasion.data=invasion.data.medium2, trees.medium[[2]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium3, invasion.data=invasion.data.medium3, trees.medium[[3]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium4, invasion.data=invasion.data.medium4, trees.medium[[4]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium5, invasion.data=invasion.data.medium5, trees.medium[[5]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium6, invasion.data=invasion.data.medium6, trees.medium[[6]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium7, invasion.data=invasion.data.medium7, trees.medium[[7]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium8, invasion.data=invasion.data.medium8, trees.medium[[8]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium9, invasion.data=invasion.data.medium9, trees.medium[[9]])
InvasionStagesFun(plasticity.data = rplasticity.data.medium10, invasion.data=invasion.data.medium10, trees.medium[[10]])

results.data.medium[1,1] <- 0
results.data.medium[1,2] <- 0
results.data.medium[2,1] <- 0
results.data.medium[2,2] <- 0
results.data.medium[3,1] <- 0
results.data.medium[3,2] <- 0
results.data.medium[4,1] <- 1
results.data.medium[4,2] <- 1
results.data.medium[5,1] <- 1
results.data.medium[5,2] <- 1
results.data.medium[6,1] <- 1
results.data.medium[6,2] <- 0  
results.data.medium[7,1] <- 0
results.data.medium[7,2] <- 1
results.data.medium[8,1] <- 1
results.data.medium[8,2] <- 1
results.data.medium[9,1] <- 0
results.data.medium[9,2] <- 0
results.data.medium[10,1] <- 1
results.data.medium[10,2] <- 1

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.medium, trees.medium[[1]]), invasion.data=invasion.data.medium1, trees.medium[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.medium, trees.medium[[2]]), invasion.data=invasion.data.medium2, trees.medium[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.medium, trees.medium[[3]]), invasion.data=invasion.data.medium3, trees.medium[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.medium, trees.medium[[4]]), invasion.data=invasion.data.medium4, trees.medium[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.medium, trees.medium[[5]]), invasion.data=invasion.data.medium5, trees.medium[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.medium, trees.medium[[6]]), invasion.data=invasion.data.medium6, trees.medium[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.medium, trees.medium[[7]]), invasion.data=invasion.data.medium7, trees.medium[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.medium, trees.medium[[8]]), invasion.data=invasion.data.medium8, trees.medium[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.medium, trees.medium[[9]]), invasion.data=invasion.data.medium9, trees.medium[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.medium, trees.medium[[10]]), invasion.data=invasion.data.medium10, trees.medium[[10]])

results.data.medium[1,3] <- 1
results.data.medium[1,4] <- 1
results.data.medium[2,3] <- 1
results.data.medium[2,4] <- 1
results.data.medium[3,3] <- 1
results.data.medium[3,4] <- 1
results.data.medium[4,3] <- 1
results.data.medium[4,4] <- 0
results.data.medium[5,3] <- 0
results.data.medium[5,4] <- 1
results.data.medium[6,3] <- 1
results.data.medium[6,4] <- 0  
results.data.medium[7,3] <- 1
results.data.medium[7,4] <- 1
results.data.medium[8,3] <- 1
results.data.medium[8,4] <- 1
results.data.medium[9,3] <- 1
results.data.medium[9,4] <- 0
results.data.medium[10,3] <- 0
results.data.medium[10,4] <- 1

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.medium2, trees.medium[[1]]), invasion.data=invasion.data.medium1, trees.medium[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.medium2, trees.medium[[2]]), invasion.data=invasion.data.medium2, trees.medium[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.medium2, trees.medium[[3]]), invasion.data=invasion.data.medium3, trees.medium[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.medium2, trees.medium[[4]]), invasion.data=invasion.data.medium4, trees.medium[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.medium2, trees.medium[[5]]), invasion.data=invasion.data.medium5, trees.medium[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.medium2, trees.medium[[6]]), invasion.data=invasion.data.medium6, trees.medium[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.medium2, trees.medium[[7]]), invasion.data=invasion.data.medium7, trees.medium[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.medium2, trees.medium[[8]]), invasion.data=invasion.data.medium8, trees.medium[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.medium2, trees.medium[[9]]), invasion.data=invasion.data.medium9, trees.medium[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.medium2, trees.medium[[10]]), invasion.data=invasion.data.medium10, trees.medium[[10]])

results.data.medium[1,5] <- 1
results.data.medium[1,6] <- 1
results.data.medium[2,5] <- 0
results.data.medium[2,6] <- 1
results.data.medium[3,5] <- 1
results.data.medium[3,6] <- 1
results.data.medium[4,5] <- 1
results.data.medium[4,6] <- 1
results.data.medium[5,5] <- 1
results.data.medium[5,6] <- 1
results.data.medium[6,5] <- 1
results.data.medium[6,6] <- 0 
results.data.medium[7,5] <- 1
results.data.medium[7,6] <- 1
results.data.medium[8,5] <- 1
results.data.medium[8,6] <- 1
results.data.medium[9,5] <- 1
results.data.medium[9,6] <- 1
results.data.medium[10,5] <- 0
results.data.medium[10,6] <- 1

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.medium3, trees.medium[[1]]), invasion.data=invasion.data.medium1, trees.medium[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.medium3, trees.medium[[2]]), invasion.data=invasion.data.medium2, trees.medium[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.medium3, trees.medium[[3]]), invasion.data=invasion.data.medium3, trees.medium[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.medium3, trees.medium[[4]]), invasion.data=invasion.data.medium4, trees.medium[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.medium3, trees.medium[[5]]), invasion.data=invasion.data.medium5, trees.medium[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.medium3, trees.medium[[6]]), invasion.data=invasion.data.medium6, trees.medium[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.medium3, trees.medium[[7]]), invasion.data=invasion.data.medium7, trees.medium[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.medium3, trees.medium[[8]]), invasion.data=invasion.data.medium8, trees.medium[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.medium3, trees.medium[[9]]), invasion.data=invasion.data.medium9, trees.medium[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.medium3, trees.medium[[10]]), invasion.data=invasion.data.medium10, trees.medium[[10]])

results.data.medium[1,7] <- 1
results.data.medium[1,8] <- 1
results.data.medium[2,7] <- 1
results.data.medium[2,8] <- 0
results.data.medium[3,7] <- 0
results.data.medium[3,8] <- 1
results.data.medium[4,7] <- 1
results.data.medium[4,8] <- 1
results.data.medium[5,7] <- 1
results.data.medium[5,8] <- 1
results.data.medium[6,7] <- 1
results.data.medium[6,8] <- 1 
results.data.medium[7,7] <- 1
results.data.medium[7,8] <- 1
results.data.medium[8,7] <- 1
results.data.medium[8,8] <- 1
results.data.medium[9,7] <- 0
results.data.medium[9,8] <- 1
results.data.medium[10,7] <- 1
results.data.medium[10,8] <- 0

# Large tree summary (taxa number = 100)
  
results.data.high <- data.frame(rplasticity.h1=rep(NA,10),rplasticity.h2=rep(NA,10),plasticityh.h1=rep(NA,10),plasticityh.h2=rep(NA,10),plasticitym.h1=rep(NA,10),plasticitym.h2=rep(NA,10),plasticityl.h1=rep(NA,10),plasticityl.h2=rep(NA,10))

InvasionStagesFun(plasticity.data = rplasticity.data.high1, invasion.data=invasion.data.high1, trees.high[[1]])
InvasionStagesFun(plasticity.data = rplasticity.data.high2, invasion.data=invasion.data.high2, trees.high[[2]])
InvasionStagesFun(plasticity.data = rplasticity.data.high3, invasion.data=invasion.data.high3, trees.high[[3]])
InvasionStagesFun(plasticity.data = rplasticity.data.high4, invasion.data=invasion.data.high4, trees.high[[4]])
InvasionStagesFun(plasticity.data = rplasticity.data.high5, invasion.data=invasion.data.high5, trees.high[[5]])
InvasionStagesFun(plasticity.data = rplasticity.data.high6, invasion.data=invasion.data.high6, trees.high[[6]])
InvasionStagesFun(plasticity.data = rplasticity.data.high7, invasion.data=invasion.data.high7, trees.high[[7]])
InvasionStagesFun(plasticity.data = rplasticity.data.high8, invasion.data=invasion.data.high8, trees.high[[8]])
InvasionStagesFun(plasticity.data = rplasticity.data.high9, invasion.data=invasion.data.high9, trees.high[[9]])
InvasionStagesFun(plasticity.data = rplasticity.data.high10, invasion.data=invasion.data.high10, trees.high[[10]])

results.data.high[1,1] <- 0
results.data.high[1,2] <- 0
results.data.high[2,1] <- 1
results.data.high[2,2] <- 1
results.data.high[3,1] <- 0
results.data.high[3,2] <- 1
results.data.high[4,1] <- 1
results.data.high[4,2] <- 1
results.data.high[5,1] <- 0
results.data.high[5,2] <- 1
results.data.high[6,1] <- 1
results.data.high[6,2] <- 0 
results.data.high[7,1] <- 0
results.data.high[7,2] <- 1
results.data.high[8,1] <- 0
results.data.high[8,2] <- 1
results.data.high[9,1] <- 1
results.data.high[9,2] <- 1
results.data.high[10,1] <- 1
results.data.high[10,2] <- 1

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.high, trees.high[[1]]), invasion.data=invasion.data.high1, trees.high[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.high, trees.high[[2]]), invasion.data=invasion.data.high2, trees.high[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.high, trees.high[[3]]), invasion.data=invasion.data.high3, trees.high[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.high, trees.high[[4]]), invasion.data=invasion.data.high4, trees.high[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.high, trees.high[[5]]), invasion.data=invasion.data.high5, trees.high[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.high, trees.high[[6]]), invasion.data=invasion.data.high6, trees.high[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.high, trees.high[[7]]), invasion.data=invasion.data.high7, trees.high[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.high, trees.high[[8]]), invasion.data=invasion.data.high8, trees.high[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.high, trees.high[[9]]), invasion.data=invasion.data.high9, trees.high[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.high, trees.high[[10]]), invasion.data=invasion.data.high10, trees.high[[10]])

results.data.high[1,3] <- 1
results.data.high[1,4] <- 1
results.data.high[2,3] <- 1
results.data.high[2,4] <- 1
results.data.high[3,3] <- 1
results.data.high[3,4] <- 1
results.data.high[4,3] <- 1
results.data.high[4,4] <- 1
results.data.high[5,3] <- 1
results.data.high[5,4] <- 1
results.data.high[6,3] <- 1
results.data.high[6,4] <- 1 
results.data.high[7,3] <- 1
results.data.high[7,4] <- 1
results.data.high[8,3] <- 1
results.data.high[8,4] <- 0  
results.data.high[9,3] <- 1
results.data.high[9,4] <- 1
results.data.high[10,3] <- 1
results.data.high[10,4] <- 1

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.high2, trees.high[[1]]), invasion.data=invasion.data.high1, trees.high[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.high2, trees.high[[2]]), invasion.data=invasion.data.high2, trees.high[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.high2, trees.high[[3]]), invasion.data=invasion.data.high3, trees.high[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.high2, trees.high[[4]]), invasion.data=invasion.data.high4, trees.high[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.high2, trees.high[[5]]), invasion.data=invasion.data.high5, trees.high[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.high2, trees.high[[6]]), invasion.data=invasion.data.high6, trees.high[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.high2, trees.high[[7]]), invasion.data=invasion.data.high7, trees.high[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.high2, trees.high[[8]]), invasion.data=invasion.data.high8, trees.high[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.high2, trees.high[[9]]), invasion.data=invasion.data.high9, trees.high[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.high2, trees.high[[10]]), invasion.data=invasion.data.high10, trees.high[[10]])

results.data.high[1,5] <- 1
results.data.high[1,6] <- 1
results.data.high[2,5] <- 1
results.data.high[2,6] <- 1
results.data.high[3,5] <- 1
results.data.high[3,6] <- 1
results.data.high[4,5] <- 1
results.data.high[4,6] <- 1
results.data.high[5,5] <- 1
results.data.high[5,6] <- 1
results.data.high[6,5] <- 1
results.data.high[6,6] <- 1  
results.data.high[7,5] <- 1
results.data.high[7,6] <- 1
results.data.high[8,5] <- 1
results.data.high[8,6] <- 1
results.data.high[9,5] <- 1
results.data.high[9,6] <- 1
results.data.high[10,5] <- 1
results.data.high[10,6] <- 0

InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.1.high3, trees.high[[1]]), invasion.data=invasion.data.high1, trees.high[[1]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.2.high3, trees.high[[2]]), invasion.data=invasion.data.high2, trees.high[[2]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.3.high3, trees.high[[3]]), invasion.data=invasion.data.high3, trees.high[[3]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.4.high3, trees.high[[4]]), invasion.data=invasion.data.high4, trees.high[[4]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.5.high3, trees.high[[5]]), invasion.data=invasion.data.high5, trees.high[[5]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.6.high3, trees.high[[6]]), invasion.data=invasion.data.high6, trees.high[[6]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.7.high3, trees.high[[7]]), invasion.data=invasion.data.high7, trees.high[[7]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.8.high3, trees.high[[8]]), invasion.data=invasion.data.high8, trees.high[[8]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.9.high3, trees.high[[9]]), invasion.data=invasion.data.high9, trees.high[[9]])
InvasionStagesFun(plasticity.data = data.fix.fun(plasticity.data.10.high3, trees.high[[10]]), invasion.data=invasion.data.high10, trees.high[[10]])

results.data.high[1,7] <-1
results.data.high[1,8] <- 1
results.data.high[2,7] <- 0
results.data.high[2,8] <- 1
results.data.high[3,7] <- 0
results.data.high[3,8] <- 1
results.data.high[4,7] <- 1
results.data.high[4,8] <- 1
results.data.high[5,7] <- 1
results.data.high[5,8] <- 1
results.data.high[6,7] <- 1
results.data.high[6,8] <- 1 
results.data.high[7,7] <- 1
results.data.high[7,8] <- 1
results.data.high[8,7] <- 0
results.data.high[8,8] <- 0
results.data.high[9,7] <- 0
results.data.high[9,8] <- 0
results.data.high[10,7] <- 1
results.data.high[10,8] <- 1

# Visualize our results
library(lattice)

# First, make some summary charts which count up the fraction of "1"s --> expected result.

hypothesis1.data <- data.frame(data.type=c("Random","High Variation","Medium Variation","Low Variation","Random","High Variation","Medium Variation","Low Variation","Random","High Variation","Medium Variation","Low Variation"),tree.size=c("low","low","low","low","medium","medium","medium","medium","high","high","high","high"),fractions=c(.3,.9,.5,.8,.5,.8,.8,.8,.5,1,1,.6))

hypothesis2.data$data.type <- factor(hypothesis1.data$data.type, levels=c("Random","High Variation","Medium Variation","Low Variation"))
hypothesis1.data$tree.size <- factor(hypothesis1.data$tree.size, levels=c("low","medium","high"))

hypothesis2.data <- data.frame(data.type=c("Random","High Variation","Medium Variation","Low Variation","Random","High Variation","Medium Variation","Low Variation","Random","High Variation","Medium Variation","Low Variation"),tree.size=c("low","low","low","low","medium","medium","medium","medium","high","high","high","high"),fractions=c(.7,.9,1,.4,.5,.7,.9,.8,.8,.8,.9,.8))

hypothesis1.data$data.type <- factor(hypothesis1.data$data.type, levels=c("Random","High Variation","Medium Variation","Low Variation"))
hypothesis1.data$tree.size <- factor(hypothesis1.data$tree.size, levels=c("low","medium","high"))

hypothesis2.data$data.type <- factor(hypothesis2.data$data.type, levels=c("Random","High Variation","Medium Variation","Low Variation"))
hypothesis2.data$tree.size <- factor(hypothesis2.data$tree.size, levels=c("low","medium","high"))

barchart(fractions~data.type,data=hypothesis1.data,groups=tree.size,col=c("dark red","dark blue","dark grey"),ylab="Fraction of Trials that Showed Predicted Result",alternating=1,key=list(corner=c(0,0.97),lines=list(col=c("dark red","dark blue","dark grey")),lwd=6,text=list(c("25 Taxa","50 Taxa", "100 Taxa"))), main = "H1: Plasticity Increases Invasiveness")

barchart(fractions~data.type,data=hypothesis2.data,groups=tree.size,col=c("dark red","dark blue","dark grey"),ylab="Fraction of Trials that Showed Predicted Result",alternating=1,key=list(corner=c(0,0.97),lines=list(col=c("dark red","dark blue","dark grey")),lwd=6,text=list(c("25 Taxa","50 Taxa", "100 Taxa"))), main = "H2: Plasticity Declines With Increasing Invasion Age")

# Broadly, the results indicate that the method has greater power to detect patterns in plasticity based on invasion stage in larger trees. Power decreases as the difference in plasticity thetas decreases. Overall, there is a lot of spread in the results, which would be improved as more and more data sets are tested. 


