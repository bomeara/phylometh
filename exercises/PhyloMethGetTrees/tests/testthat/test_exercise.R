test_that("GetFromTreeBase_exercise",{
	expect_is(GetFromTreeBase_exercise(), "phylo")
})

test_that("GetTreeFromOpenTree_exercise",{
	opentree.result <- GetTreeFromOpenTree_exercise()
	expect_is(opentree.result[[1]], "phylo")
	expect_is(opentree.result[[2]], "phylo")
})
