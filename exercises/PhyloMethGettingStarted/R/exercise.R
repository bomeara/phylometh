# Some basic tests to make sure things are running. 

GetHowManyTrees_exercise <- function(ntaxa=10) {
	#ape can compute this for us.
	result <- __A FUNCTION FROM APE TO DO THIS__(ntaxa)
	return(result)	
}

GetAlignment_exercise <- function() {
	#Let's see where mafft is installed
	print(system("which mafft"))
	data(woodmouse)
	result <- mafft( __PUT SOMETHING HERE TO ALIGN__ ) #hint, look up one line
	return(result)
}
