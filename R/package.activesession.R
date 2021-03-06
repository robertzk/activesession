#' Activesession
#'
#' Activesession provides a heterogeneous-backend key-value store syntax for R.
#' This is a fancy way to say a list-like structure in which portions of the structure
#' are loaded from a backend, such as the disk, a database, or a cloud storage service.
#' This allows arbitrarily large memory objects to be used within the R console, as
#' the local pieces that do not fit into memory can be purged on a least-recently-used
#' basis. This is similar to the concept of views used by distributed version control
#' systems.
#'
#'
#' @name activesession-package
#' @docType package
#' @author Robert Krzyzanowski <\url{http://syberia.io}>
#' @import R6 crayon
NULL
