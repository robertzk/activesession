#' @include backend-R6.R
backend_r <- R6::R6Class("activesession_backend_r",
  inherit = activesession_backend_R6,
  portable = TRUE,
  private = list(
    env = NULL
  ),
  public = list(
    initialize = function(env = new.env(parent = emptyenv())) {
      private$env <- env
    },
    read  = function(key) {
      private$env[[key]] 
    },
    write = function(object, key) {
      private$env[[key]] <- object
    },
    print = function(...) {
      cat(crayon::white$bold("In-memory activesession backend.\n"))
    }
  )
)

