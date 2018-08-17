#' Test an check multiple packages.
#'
#' Vectorized versions of [devtools::test()] and [devtools::check()] designed
#' to work with multiple packages stored under a single parent directory.
#'
#' @param pkgs Character string of the names of packages to vet.
#' @param .f A symbol; either devtools::test or devtools::check.
#' @param parent The absolute path to the parent directory of all packages.
#'   You can omit this if your working directory is one of the packages under
#'   the `parent` directory.
#'
#' @seealso [devtools::test()] and [devtools::check()].
#'
#' @return Invisible.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' pkgs <- c("fgeo.tool", "fgeo.abundance")
#' test_pkgs(pkgs)
#' check_pkgs(pkgs)
#' }
vet <- function(pkgs, .f, parent = fs::path_dir(usethis::proj_get())) {
  check <- identical(.f, devtools::check)
  vet_dir <- if (check) "/{.x}" else "/{.x}/tests/testthat"
  vet_dirs <- purrr::map_chr(pkgs, ~glue::glue(parent, vet_dir))
  purrr::walk(vet_dirs, .f)
}

#' @rdname vet
#' @export
test_pkgs <- function(pkgs, parent = fs::path_dir(usethis::proj_get())) {
  vet(pkgs, devtools::test, parent)
}

#' @rdname vet
#' @export
check_pkgs <- function(pkgs, parent = fs::path_dir(usethis::proj_get())) {
  vet(pkgs, devtools::check, parent)
}

