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

#' Checks if a string is a simple string.
#'
#' A simple string is (a) character, (b) length 1, and (c) not blank.
#'
#' @param string character. The object to test.
#' @return \code{TRUE} or \code{FALSE} according as the object is a
#'   non-NA non-blank string of length 1.
#' @export
is.simple_string <- function(string) {
  is.character(string) && length(string) == 1 && nzchar(string) && !is.na(string)
}

