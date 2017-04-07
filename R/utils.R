`%||%` <- function(x, y) if (is.null(x)) y else x

#' Determine whether the given path is a valid directory.
#'
#' @param path character. The path to check.
#' @return \code{TRUE} or \code{FALSE} according as \code{path} is a valid
#'   existent directory.
is.directory <- function(path) {
  is.character(path) && length(path) == 1 && !is.na(path) &&
    file.exists(path) && file.info(path)$isdir
}

