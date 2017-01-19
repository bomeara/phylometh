# Some basic tests to make sure things are running.
suppressWarnings(library(ape))
GetHowManyTrees <- function(ntaxa=10) {
	#ape can compute this for us.
	result <-howmanytrees(ntaxa)
	return(result)
}

GetAlignment <- function() {
	#Let's see where mafft is installed
	suppressWarnings(library(ape))
	print(system("which mafft"))
	data(woodmouse)
	result <- suppressWarnings(ips::mafft(woodmouse))
	return(result)
}


