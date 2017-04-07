#' Create a new activesession object.
#'
#' An active-session object is an R list-like representation of what
#' may potentially be distributed amongst several backends such as
#' disk, a database, cloud storage like S3, etc.
#'
#' The activesession abstracts turns syntax like \code{session$foo$bar}
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
#' @docType class
activesession <- R6::R6Class("activesession", 
  public = list(
    initialize = function(paths) {
    }
  )
)

