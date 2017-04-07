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


#' @include backend-R6.R backend-r.R backend-file.R
NULL

backends <- list( 
  r    = backend_r,
  file = backend_file
)

