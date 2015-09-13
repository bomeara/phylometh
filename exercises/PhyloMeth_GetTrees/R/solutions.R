#Let's get some trees from TreeBASE. TreeBASE is a repository started in 1994
# to store phylogenetic information from published papers to allow reuse.
# It has been maintained largely through the work of one scientist, Bill Piel.
# Sadly, most trees do not end up there, but those that do can be very useful.
# Another issue is that until recenty TreeBASE prohibited branch length
# information, though more recent trees do (often) have this info. 
GetFromTreeBase_solution <- function() {
	# Get all trees for Formica (a genus of ants), searching by taxon, with branch lengths
	# Replace the __________ with appropriate arguments
	# When you run this, it'll take some time. But less time than sequencing
	# and building the tree yourself.
#	trees <- search_treebase(input="__________", by="__________", branch_lengths=__________)
	trees <- search_treebase(input="Formica", by="taxon", branch_lengths=TRUE)
	
	# Pull out just the biggest tree (for convenience)
	biggest.tree <- trees[[which.max(sapply(trees, Ntip))]]
	
	# Print out a description of the biggest tree
#	print(__________)
	print(biggest.tree)
	
	# Print let's look at the TreeBASE page for this study
	browseURL(paste("http://treebase.org/treebase-web/search/study/summary.html?id=", biggest.tree$S.id, sep=""))
	
	# Return this tree
	return(biggest.tree)
}