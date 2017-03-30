library(ape)
library(geiger)
library(phytools)
library(phangorn)


tree <- read.tree("Maggie_nexus.tre")
discrete.data <- read.delim(file="edriodata.csv",stringsAsFactors=FALSE)
ape::compute.brlen(tree)
tree<-ape::compute.brlen(tree)

CleanData <- function(tree, discrete.data) {
  tree$tip.label <- gsub("_", " ", tree$tip.label)
  rownames(discrete.data) <- discrete.data[,1]
  # make it a character matrix
  discrete.data <- as.matrix(discrete.data[,-1])
  # define ambiguous states "N" and "?"
  data <- phyDat(as.matrix(discrete.data), type="USER", levels=c("0", "1", "2"), ambiguity = c("N", "?"))
  # reorder data
  data <- subset(data, tree$tip.label) 
  list(phy=tree, data = data)
}

cleaned.results <- CleanData(tree, discrete.data)
cleaned.tree <- cleaned.results$phy
cleaned.data <- cleaned.results$data

match(cleaned.tree$tip.label, names(cleaned.data))  # should be 1:15
as.character(cleaned.data) # should look like the original


VisualizeData <- function(tree, data) {
  plot(tree)
  print(data)
}

VisualizeData(cleaned.tree, cleaned.data)

discrete.data.matrix <- as.matrix(cleaned.data)
rownames(discrete.data.matrix) <- rownames(cleaned.data)

print(discrete.data.matrix)

anc.p <- ancestral.pars(cleaned.tree, cleaned.data)
print(anc.p)
plotAnc(tree, anc.p, attr(anc.p, "index")[1])
plotAnc(tree, anc.p, attr(anc.p, "index")[25])
###########

anc.ml <- ancestral.pml(pml(cleaned.tree, cleaned.data), type="ml")
#Error in pml(tree, cleaned.discrete.phyDat) : tree must have edge weights
plotAnc(tree, anc.ml, 1)
#Error in subset(data, , i) : object 'anc.ml' not found