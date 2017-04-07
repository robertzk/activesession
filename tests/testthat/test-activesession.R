context("activesession object")

describe("activesession object", {
  describe("failure conditions", {
    test_that("it requires paths to be a list", {
      expect_error(activesession$new(1), "must be a list")              
      expect_error(activesession$new(NULL), "must be a list")              
      expect_error(activesession$new(new.env()), "must be a list")              
      expect_error(activesession$new(identity), "must be a list")              
    })
  })
})

