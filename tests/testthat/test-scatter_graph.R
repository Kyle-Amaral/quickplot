test_that("Testing to see if the scatter plot function is working", {
  expect_silent(scatter_graph(palmerpenguins::penguins, bill_length_mm, flipper_length_mm)) #no error messages are generated
})

test_that("Testing to see if an error occurs when it should", {
  expect_error(scatter_graph(palmerpenguins::penguins,island,bill_length_mm)) # an error message is generated because one of the parameters is not a numeric variable
  expect_error(scatter_graph(palmerpenguins::penguins, bill_length_mm)) # an error message is generated because a parameter is missing
})

test_that("Testing to see if my function's output is a ggplot", {
  expect_s3_class(scatter_graph(palmerpenguins::penguins, bill_length_mm, flipper_length_mm), "ggplot") # a ggplot output is produced
})
