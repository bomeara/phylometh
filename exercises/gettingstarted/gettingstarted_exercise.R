# Some basic tests to make sure things are running.

GetHowManyTrees <- function(ntaxa=10) {
	#ape can compute this for us.
	result <- ___SOME FUNCTION WITH AN ARGUMENT_____
	return(result)
}

GetAlignment <- function() {
	#Let's see where mafft is installed
	library(ape)
	print(system("which mafft"))
	data(woodmouse)
	result <- ips::mafft(____SOME INPUT ARGUMENT____)
	return(result)
}
