#' Retrieve an activesession backend.
#'
#' @param name character. Name of the activesession backend. Currently,
#'   supported values are \code{c("r", "file", "s3mpi", "cacher")}, but the
#'   latter two require additional packages.
#' @return An \code{activesession_backend} R6 object.
activesession_backend <- function(name, ...) {
  
}

