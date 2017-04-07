Activesession [![Build Status](https://travis-ci.org/robertzk/activesession.svg?branch=master)](https://travis-ci.org/robertzk/activesession) [![Coverage Status](https://coveralls.io/repos/robertzk/activesession/badge.svg?branch=master)](https://coveralls.io/r/robertzk/activesession)
===========

Activesession provides a heterogeneous-backend key-value store syntax for R.
This is a fancy way to say a list-like structure in which portions of the structure
are loaded from a backend, such as the disk, a database, or a cloud storage service.
This allows arbitrarily large memory objects to be used within the R console, as
the local pieces that do not fit into memory can be purged on a least-recently-used
basis. This is similar to the concept of views used by distributed version control
systems.

Example
-------

```r
library(activesession)
library(s3mpi) # devtools::install_github("robertzk/s3mpi")
library(cacher) # devtools::install_github("kirillseva/cacher")
options(s3mpi.path = "s3://somebucket/some/path/prefix/")
session <- activesession(paths = list(
  "from/disk" = activesession_backend("file", path = "/tmp/disk"),
  "from/s3mpi" = activesession_backend("s3mpi", path = "/from/s3/")
  "cacher" = activesession_backend("cacher", limit = "20MB")
  # Default paths load from in-memory
))

session$foo <- 1 # 1 is stored in-memory.
# The list below gets saved to an LRU cache using the cacher package.
session$cacher$bar <- list(a = 1, b = 2)
# The lm model below gets saved to an S3 key in AWS.
# Equivalent to: s3mpi::s3store(lm(Sepal.Length ~ Sepal.Width, data = iris))
session$from$s3mpi$my_model <- stats::lm(Sepal.Length ~ Sepal.Width, data = iris)

# Objects get saved during assignment. If we open up a new R session
# and initialize the session as above, we'll see that the model
# object was saved to S3.
class(session$from$s3mpi$my_model) # "lm"
# On the other hand, the in-memory data was lost.
session$foo # NULL
```
