context("vet")

test_that("tests work with fgeo", {
  skip_if_not_installed("fgeo")
  expect_message(vet::test_pkgs(fgeo::fgeo_core()))
})
