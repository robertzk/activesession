context("activesession backends")

describe("activesession_backend", {
  test_that("it errors when an invalid session name is passed", {
    expect_error(activesession_backend(NULL))
    expect_error(activesession_backend(1))
    expect_error(activesession_backend(list()))
    expect_error(activesession_backend(identity))
    expect_error(activesession_backend(new.env()))
  })
})


