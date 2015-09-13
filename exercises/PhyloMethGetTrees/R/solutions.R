# Let's get some trees from TreeBASE. TreeBASE is a repository started in 1994
# to store phylogenetic information from published papers to allow reuse.
# It has been maintained largely through the work of one scientist, Bill Piel.
# Sadly, most trees do not end up there, but those that do can be very useful.
# Another issue is that until recenty TreeBASE prohibited branch length
# information, though more recent trees do (often) have this info. 
GetFromTreeBase_solution <- function() {
	# Get all trees for Formica (a genus of ants), searching by taxon, with branch
	# lengths
	# Replace the "__________" with appropriate arguments
	# When you run this, it'll take some time. But less time than sequencing
	# and building the tree yourself.
#	trees <- search_treebase(input="__________", by="__________", 
# branch_lengths="__________")
	trees <- search_treebase(input="Formica", by="taxon", branch_lengths=TRUE)
	
	# Pull out just the biggest tree (for convenience)
	biggest.tree <- trees[[which.max(sapply(trees, Ntip))]]
	
	# Print out a description of the biggest tree
#	print("__________")
	print(biggest.tree)
	
	# Let's look at the TreeBASE page for this study
	browseURL(paste(
	"http://treebase.org/treebase-web/search/study/summary.html?id=", 
	biggest.tree$S.id, sep=""))
	
	# Return this tree
	return(biggest.tree)
}


# Let's get some trees from Open Tree of Life. This is in some ways a
# successor to TreeBASE: another repository of trees (though it has only partial
# overlap with the trees in TreeBASE (or in another repository, Dryad). Unlike
# TreeBASE, anyone, not just the author, can add trees to Open Tree's 
# repository. Another important distinction is that Open Tree seeks to create
# a single tree for all life by creating essentially a supreme super tree.
GetTreeFromOpenTree_solution <- function() {
	# Now let's look for the gecko genus Anolis
	# Figure out the id used for Anolis in Open Tree's database

	# Replace the "__________" with appropriate arguments
	
#	anolis.id <- tnrs_match_names("__________")$ott_id
	anolis.id <- tnrs_match_names("Anolis")$ott_id
	
	# Now get Open Tree's current best estimate of the phylogeny for the group
	# They call this the tree of life; we can get the subtree for just this group.
	anolis.tree <- tol_subtree(ott_id=anolis.id)
	
	# Let's plot the tree:
#	plot.phylo("__________", type="fan", cex=0.2)
	plot.phylo(anolis.tree, type="fan", cex=0.2)
	
	# It has a lot of polytomies, representing uncertainty. A maximally resolved
	# tree (if rooted) will have one fewer internal nodes than terminal nodes:
	# think of a tree with three taxa, ((A,B),C): it'll have the MRCA of A and B
	# and the MRCA of A, B, and C: three terminals, two internal nodes. If it had
	# no information, it would only have one node. So we can look at the ratio of
	# number of internal nodes to number of possible internal nodes to figure out
	# how resolved a tree is (subtracting 1 from each to account for the root
	# node that must always exist)
	
	print(paste("The Anolis tree has ", Ntip(anolis.tree), " terminals and ", 
	Nnode(anolis.tree), " internal nodes out of ",Ntip(anolis.tree)-2,
	" possible, which means it is ", 
	round(100*(Nnode(anolis.tree)-1)/(Ntip(anolis.tree)-3), 2),
	"% resolved", sep=""))
	
	# Open Tree can also return the original studies with the source trees.
	anolis.studies <- studies_find_studies(property="ot:focalCladeOTTTaxonName",
	value="Anolis")
	anolis.studies.ids <- unlist(anolis.studies$matched_studies)
	
	# Let's get info on the first study
	anolis.study1.metadata <- get_study_meta(anolis.studies[[1]][[1]]$`ot:studyId`)
	print(get_publication(anolis.study1.metadata))
	
	# And let's get the tree from this study
	# Look in rotl documentation for the right function
	# Hint: get_study_trees() is close, but you don't know the tree.id
#	anolis.study1.tree1 <- get_______FUNCTION_FROM_rotl____(anolis.studies.ids[[1]])
	anolis.study1.tree1 <- get_study(anolis.studies.ids[[1]])
	
	# And plot it
	plot.phylo(anolis.study1.tree1, type="fan", cex=0.2)
	
	#Return both trees
	return.list <- list(anolis.tree, anolis.study1.tree1)
	names(return.list) <- c("tol.tree", "study1.tree")
	return(return.list)
}