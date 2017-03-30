#Continuous Exercise
library(ape) #utility fns
library(geiger) #utilty fns
library(OUwie)
setwd("~/Desktop/phylometh2/exercises/Continuous/")
library(phangorn)
?read.nexus.data
SumFam.nex<-read.nexus.data(file="SumFam2")



tree <- read.tree("Maggie_nexus.tre")
continuous.data<-read.csv(file="Edrio_Lat_data.csv",stringsAsFactors=FALSE)

library(geiger)
CleanData <- function(tree, continous.data)
phytools::contMap(CleanData)
#{r, eval=TRUE}
CleanData <- function(tree, continous.data)
CleanData
class(CleanData)
?phytools
?contMap
class(tree)
phytools::contMap(tree)
