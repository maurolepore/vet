has_non_ascii <- function(x) {
  out <- tryCatch(
    testthat::expect_silent(tools::showNonASCIIfile(x)),
    error = function(e) TRUE
  )
  if (!isTRUE(out)) FALSE else TRUE
}

#' Find files that contain non ascii characters.
#'
#' @param path A path to a directory, e.g. "R".
#'
#' @return Character.
#' @export
#'
#' @examples
#' path <- glue::glue("{usethis::proj_get()}/R")
#' find_non_ascii(path)
#' @noRd
find_non_ascii <- function(path) {
  x <- fs::dir_ls(path)
  out <- purrr::map_lgl(x, has_non_ascii)
  names(out)[out]
}

#' Find paths to fgeo_core() packages.
#'
#' @return
#' @export
#'
#' @examples
#' fgeo_dirs()
#' @noRd
fgeo_dirs <- function() {
  parent <- fs::path_dir(usethis::proj_get())
  purrr::map_chr(fgeo::fgeo_core(), ~glue::glue(parent, "/", .x))
}

#' Find files with non_ascii characters inside fgeo_core() packages.
#'
#' @param dir A folder in a package.
#'
#' @return
#' @export
#'
#' @examples
#' fgeo_non_ascii()
#' fgeo_non_ascii("tests/testthat")
fgeo_non_ascii <- function(dir = "R") {
  r_folders <- purrr::map_chr(fgeo_dirs(), ~glue::glue(.x, "/{dir}"))
  set_names(purrr::map(r_folders, find_non_ascii), fgeo::fgeo_core())
}
