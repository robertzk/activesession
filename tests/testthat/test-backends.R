context("activesession backends")

describe("activesession_backend", {
  test_that("it errors when no backend name is passed", {
    expect_error(activesession_backend())
  })
})


