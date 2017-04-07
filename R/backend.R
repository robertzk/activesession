#' Retrieve an activesession backend.
#'
#' @param name character. Name of the activesession backend. Currently,
#'   supported values are \code{c("r", "file", "s3mpi", "cacher")}, but the
#'   latter two require additional packages.
#' @export
#' @return An \code{activesession_backend} R6 object.
activesession_backend <- function(name = c("r", "file", "s3mpi", "cacher"), ...) {
  name <- match.arg(name) 


}

#' An activesession backend R6 class template that 
activesession_backend_R6 <- R6::R6Class("activesession_backend")

backends <- list( 
  # r = 
)

