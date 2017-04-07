#' Create a new activesession object.
#'
#' An active-session object is an R list-like representation of what
#' may potentially be distributed amongst several backends such as
#' disk, a database, cloud storage like S3, etc.
#'
#' The activesession abstraction turns syntax like \code{session$foo$bar}
#' into statements like \code{s3mpi::s3read("foo/bar")} and 
#' assignments like \code{session$foo$bar <- iris} into the equivalent
#' \code{s3mpi::s3store(iris, "foo/bar")}.
#'
#' The primary advantage of using activesession over writing directly using
#' \code{saveRDS}, \code{s3mpi::s3store}, etc. is that the storage backend
#' becomes implicit. In addition, activesessions allow for in-memory
#' representation of arbitrarily large objects regardless of how much
#' memory they consume. The session takes care of removing inactive
#' and recently inaccessed keys from memory so that only the latest ones
#' are visible.
#'
#' This makes workflows such as the following possible.
#'
#' \enumerate{
#'   \item Iterate over an index, say 1 to 100.
#'   \item Perform validation on a model object and a train/test set
#'     by reading directly from the activesession.
#'   \item Let the session worry about loading and unloading objects
#'     from memory.
#' }
#'
#' @name activesession_R6
#' @format NULL
#' @export
#' @docType class
activesession <- R6::R6Class("activesession", 
  private = list(
    paths   = list(),
    baseenv = NULL
  ),
  active = list(
    baseenv_ = function(value) { private$baseenv }
  ),
  public = list(
    initialize = function(paths = list()) {
      validate_paths(paths)
      private$paths   <- paths
      private$baseenv <- new.env(parent = emptyenv())
    }
  )
)

#' Read from an activesession.
#' 
#' @param object activesession. The activesession object.
#' @param el character. The accessed key.
#' @export
`$.activesession` <- function(object, el)  {
  get(el, envir = get("baseenv_", envir = object)) 
}

#' Write to an activesession.
#' 
#' @param object activesession. The activesession object.
#' @param el character. The written key.
#' @param value ANY. The value to assign.
#' @export
`$<-.activesession` <- function(object, el, value)  {
  assign(el, value, envir = get("baseenv_", envir = object)) 
  object
}

validate_paths <- function(paths) {
  if (!is.list(paths)) {
    stop(sQuote("paths"), " argument must be a list.")
  }
}

