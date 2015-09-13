test_that("GetFromTreeBase_solution",{
	expect_is(GetFromTreeBase_solution(), "phylo")
})

test_that("GetFromOpenTree_solution",{
	opentree.result <- GetFromOpenTree_solution()
	expect_is(opentree.result[[1]], "phylo")
	expect_is(opentree.result[[2]], "phylo")
})
