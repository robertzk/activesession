context("activesession backends")
library(testthatsomemore)

describe("activesession_backend", {
  describe("failure conditions", {         
    test_that("it errors when an invalid session name is passed", {
      expect_error(activesession_backend(1))
      expect_error(activesession_backend(list()))
      expect_error(activesession_backend(identity))
      expect_error(activesession_backend(new.env()))
    })
  })

  describe("r backend", {
    test_that("it can initialize an r backend", {
      assert(activesession_backend("r"))
    })

    test_that("it can store an object", {
      assert(activesession_backend("r")$write(list(a = 1, b = 2), "foo"))
    })

    test_that("it can read an object", {
      session <- activesession_backend("r")       
      session$write(list(a = 1, b = 2), "foo")
      expect_equal(session$read("foo"), list(a = 1, b = 2))
    })
  })
})


