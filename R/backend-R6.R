#' An activesession backend R6 class template.
activesession_backend_R6 <- R6::R6Class("activesession_backend",
  portable = TRUE,
  public = list(
    read = function(object, ...) {
      .NotYetImplemented()
    },
    write = function(object, key, ...) {
      .NotYetImplemented()
    },
    print = function(...) {
      cat(crayon::white$bold("Abstract activesession backend.\n"))
    }
  )
)  

