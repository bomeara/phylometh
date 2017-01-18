GetTreeFromOpenTree_solution <- function()
  library(rotl)
  library(ape)
  anolis.id <- tnrs_match_names("Anolis")$ott_id
  anolis.tree <- tol_subtree(ott_id=anolis.id)
  plot.phylo(anolis.tree, type="fan", cex=0.2)
  print(paste("The Anolis tree has ", Ntip(anolis.tree), " terminals and ", 
              Nnode(anolis.tree), " internal nodes out of ",Ntip(anolis.tree)-2,
              " possible, which means it is ", 
              round(100*(Nnode(anolis.tree)-1)/(Ntip(anolis.tree)-3), 2),
              "% resolved", sep=""))
  anolis.studies <- studies_find_studies(property="ot:focalCladeOTTTaxonName",
                                         value="Anolis")
  anolis.studies.ids <- unlist(anolis.studies$matched_studies)	
  anolis.study1.metadata <- get_study_meta(anolis.studies[[1]][[1]])
  print(get_publication(anolis.study1.metadata))
  
  #not working - needs argument 
  anolis.study1.tree1 <- get_study(anolis.studies.ids[[1]])
  plot.phylo(anolis.study1.tree1, type="fan", cex=0.2)
  return.list <- list(anolis.tree, anolis.study1.tree1)
  names(return.list) <- c("tol.tree", "study1.tree")
  return(return.list)
