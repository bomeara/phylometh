test_that("GetHowManyTrees_solution",{
	expect_equal(GetHowManyTrees_solution(), 34459425)
})

test_that("GetAlignment_solution",{
	library(ape)
	data(woodmouse)
	alignment <- GetAlignment_solution()
	expect_equal(dim(alignment)[2], dim(woodmouse)[2])
})
