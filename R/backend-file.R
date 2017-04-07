#' @include backend-R6.R
NULL

# An activesession backend for writing to and from a file.
backend_file <- R6::R6Class("activesession_backend_file",
  inherit = activesession_backend_R6,
  portable = TRUE,
  private = list(
    path = character(0)
  ),
  public = list(
    initialize = function(path) {
      if (missing(path)) {
        stop("A file path is necessary to initialize an activesession file backend.")
      }
      if (!is.simple_string(path)) {
        stop("A character file path is necessary to initialize an activesession file backend.")
      }
      if (!is.directory(path)) {
        stop("Cannot initialize an activesession file backend with path ",
             sQuote(path), " because that path is not an existent directory.")
      }
      private$path <- path
    },
    read  = function(key) {
      readRDS(file.path(private$path, key))
    },
    write = function(object, key) {
      saveRDS(object, file.path(private$path, key))
    },
    print = function(...) {
      cat(crayon::white$bold("File activesession backend under path ",
                             crayon::yellow$bold(private$path), ".\n", sep = ""))
    }
  )
)

