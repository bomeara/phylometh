test_that("GetFromTreeBase_exercise",{
	expect_is(GetFromTreeBase_exercise(), "phylo")
})

test_that("GetFromOpenTree_exercise",{
	opentree.result <- GetFromOpenTree_exercise()
	expect_is(opentree.result[[1]], "phylo")
	expect_is(opentree.result[[2]], "phylo")
})
