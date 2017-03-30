library(ape)
library(geiger)
library(phytools)
library(phangorn)
library(corHMM)

tree <- read.tree("Maggie_nexus.tre")
discrete.data <- read.delim(file="edriodata.csv",stringsAsFactors=FALSE) 

CleanData <- function(tree, discrete.data) {
  tree$tip.label <- gsub("_", " ", tree$tip.label)
  rownames(discrete.data) <- discrete.data[,1]
  discrete.data <- discrete.data[,-1]
  for (i in sequence(ncol(discrete.data))) {
    discrete.data[,i] <- as.integer(discrete.data[,i])
  }
  return(geiger::treedata(tree, discrete.data, warnings=FALSE))
}

cleaned.results <- CleanData(tree, discrete.data)
cleaned.tree <- cleaned.results$phy
cleaned.data <- cleaned.results$data

VisualizeData <- function(tree, data) {
  plot(tree)
  print(data)
}

VisualizeData(cleaned.tree, cleaned.data)

discrete.data.matrix <- as.matrix(cleaned.data)
rownames(discrete.data.matrix) <- rownames(cleaned.data)

print(discrete.data.matrix)
cleaned.discrete.phyDat <- phangorn::phyDat(discrete.data.matrix, type="USER", levels=c("0", "1", "2"))
print(cleaned.discrete.phyDat)
anc.p <- phangorn::ancestral.pars(tree, cleaned.discrete.phyDat)
print(anc.p)
plotAnc(tree, anc.p, 1)
save(list=ls(), file="~/Desktop/debug.rda")

###########


anc.p <- phangorn::ancestral.pars(tree, cleaned.discrete.phyDat)
print(paste("i is ", i))
plotAnc(tree, anc.p, 1)

#Error in data[[i]][rows, ] : subscript out of bounds


anc.ml <- ancestral.pml(pml(tree, cleaned.discrete.phyDat), type="ml")
#Error in pml(tree, cleaned.discrete.phyDat) : tree must have edge weights
plotAnc(tree, anc.ml, 1)
#Error in subset(data, , i) : object 'anc.ml' not found