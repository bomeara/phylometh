#Let's get some trees from TreeBASE. TreeBASE is a repository started in 1994
# to store phylogenetic information from published papers to allow reuse.
# It has been maintained largely through the work of one scientist, Bill Piel.
# Sadly, most trees do not end up there, but those that do can be very useful.
# Another issue is that until recenty TreeBASE prohibited branch length
# information, though more recent trees do (often) have this info. 
GetFromTreeBase_solution <- function() {
	# Get all trees for Formica, searching by taxon, with branch lengths
	# Replace the __________ with appropriate arguments
	# When you run this, it'll take some time. But less time than sequencing
	# and building the tree yourself.
#	trees <- search_treebase(input="__________ by="__________", branch_lengths=__________)
	trees <- search_treebase(input="Formica", by="taxon", branch_lengths=TRUE)
	
	# Pull out just the biggest tree (for convenience)
	biggest.tree <- trees[[which.max(sapply(trees, Ntip))]]
	
	# Get the metadata (data describing the data -- authors, etc.)
	biggest.tree.metadata <- metadata(biggest.tree$S.id)
	
	
}