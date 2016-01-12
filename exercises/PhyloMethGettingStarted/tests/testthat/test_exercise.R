test_that("GetHowManyTrees_exercise",{
	expect_equal(GetHowManyTrees_exercise(), 34459425)
})

test_that("GetAlignment_exercise",{
	library(ape)
	data(woodmouse)
	alignment <- GetAlignment_exercise()
	expect_equal(dim(alignment)[2], dim(woodmouse)[2])
})
