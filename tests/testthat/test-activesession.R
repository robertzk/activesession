context("activesession object")

describe("activesession object", {
  describe("failure conditions", {
    test_that("it requires paths to be specified", {
      expect_error(activesession$new(), "Must provide")              
    })
  })
})

