#Install github from https://github.com/cscheid/rgithub
library(github) 
repos <- github:::.api.get.request(ctx=get.github.context(), c("users", "PhyloMeth", "repos"))$content
all.results <- data.frame()
for (repo.index in sequence(length(repos))) {
	repo.name <- repos[[repo.index]]$name
	requests <- get.pull.requests("PhyloMeth", repo.name, state="all")$content
	status <- rep(NA, length(requests))
	users <- rep(NA, length(requests))
	for (i in sequence(length(requests))) {
		status[i] <- requests[[i]]$state
		users[i] <- requests[[i]]$user$login
	}
	if(length(requests)==0) {
		print(paste(repo.name, ": No pulls", sep=""))
	}
	print(cbind(rep(repo.name, length(status)), status, users))
	all.results <- rbind(all.results, cbind(rep(repo.name, length(status)), status, users))
	save(all.results, file="phylometh_progress.rda")
	Sys.sleep(30)
}