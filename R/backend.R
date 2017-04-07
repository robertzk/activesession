# TODO: Explain how to create custom backends by inheriting from
# activesession_backend_R6.

#' Retrieve an activesession backend.
#'
#' @param name character. Name of the activesession backend. Currently,
#'   supported values are \code{c("r", "file", "s3mpi", "cacher")}, but the
#'   latter two require additional packages.
#' @export
#' @return An \code{activesession_backend} R6 object.
activesession_backend <- function(name = c("r", "file", "s3mpi", "cacher"), ...) {
  name <- match.arg(name) 

  backends[[name]]$new(...)
}

#' An activesession backend R6 class template that 
activesession_backend_R6 <- R6::R6Class("activesession_backend",
  portable = TRUE,
  public = list(
    read = function(object, ...) {
      .NotYetImplemented()
    },
    write = function(object, ...) {
      .NotYetImplemented()
    },
    print = function(...) {
      cat(crayon::white$bold("Abstract activesession backend.\n"))
    }
  )
)  

backends <- list( 
  r = R6::R6Class("activesession_backend_r",
    inherit = activesession_backend_R6,
    portable = TRUE,
    private = list(
      env = NULL
    ),
    public = list(
      initialize = function(env = new.env(parent = emptyenv()), ...) {
        private$env <- env
      },
      read  = function(key, ...) {
        private$env[[key]] 
      },
      write = function(object, key, ...) {
        private$env[[key]] <- object
      },
      print = function(...) {
        cat(crayon::white$bold("In-memory activesession backend.\n"))
      }
    )
  )
)

