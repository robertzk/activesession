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

    test_that("it can store an object in a non-default environment", {
      env <- new.env()
      session <- activesession_backend("r", env = env)
      session$write(list(a = 1, b = 2), "foo")
      expect_equal(env$foo, list(a = 1, b = 2))
    })
  })

  describe("file backend", {
    describe("failure conditions", {         
      test_that("it cannot create a backend without a valid directory", {
        expect_error(activesession_backend("file"), "A file path is necessary")
        expect_error(activesession_backend("file", NULL), "character file path is necessary")
        expect_error(activesession_backend("file", 1), "character file path is necessary")
        expect_error(activesession_backend("file", list(a = 1)), "character file path is necessary")
        expect_error(activesession_backend("file", identity), "character file path is necessary")
        expect_error(activesession_backend("file", "/foo/bar/baz"), "not an existent directory")
      })
    })

    test_that("it can create a file activesession backend", {
      assert(activesession_backend("file", tempdir()))
    })

    test_that("it can write to a file", {
      dir <- tempdir()
      backend <- activesession_backend("file", dir) 
      backend$write(list(a = 1, b = 2), "test")
      expect_true(file.exists(file.path(dir, "test")))
    })

    test_that("it can read from a file", {
      dir <- tempdir()
      backend <- activesession_backend("file", dir) 
      backend$write(list(a = 1, b = 2), "test")
      expect_equal(list(a = 1, b = 2), backend$read("test"))
    })
  })
})


