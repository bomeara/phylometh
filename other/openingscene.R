set.seed(42)
library(ape)
library(geiger)
library(phytools)
tree <- sim.bdtree(b=1, d=0.8, stop="taxa", n=300)
while(Ntip(tree) < 300) {
  tree <- sim.bdtree(b=1, d=0.8, stop="taxa", n=300)
}
#for (i in sequence(Ntip(tree))) {
 # tree$tip.label[i] <- paste(rep(" ", i), collapse="") 
#}
#tree$tip.label <- rep("", length(tree$tip.label))
#char <- sim.char(tree, matrix(0.1,ncol=1, nrow=1), model="BM")[,,1]
pdf(file="TreeStart.pdf", width=30, height=30)
#contMap(tree, char, show.tip.label=FALSE, type="fan", outline=FALSE, legend=FALSE)
plot.phylo(tree, type="fan", show.tip.label=FALSE, open.angle=180)
dev.off()