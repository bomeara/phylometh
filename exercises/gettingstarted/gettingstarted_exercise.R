# Some basic tests to make sure things are running.

GetHowManyTrees <- function(ntaxa=10) {
	#ape can compute this for us.
    result <- ape::howmanytrees(ntaxa)
	return(result)
}

GetAlignment <- function() {
	#Let's see where mafft is installed
	library(ape)
	print(system("which mafft"))
	data(woodmouse)
	result <- ips::mafft(woodmouse)
	return(result)
}
