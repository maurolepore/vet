context("vet")

test_that("tests work with fgeo", {
  expect_message(vet::test_pkgs(fgeo::fgeo_core()))
})
