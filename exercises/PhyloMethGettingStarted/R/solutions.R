# Some basic tests to make sure things are running. 

GetHowManyTrees_solution <- function(ntaxa=10) {
	#ape can compute this for us.
	result <- howmanytrees(ntaxa)
	return(result)	
}

GetAlignment_solution <- function() {
	#Let's see where mafft is installed
	print(system("which mafft"))
	data(woodmouse)
	result <- mafft(woodmouse)
	return(result)
}
