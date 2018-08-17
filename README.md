
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vet

[![Travis build
status](https://travis-ci.org/maurolepore/vet.svg?branch=master)](https://travis-ci.org/maurolepore/vet)

The goal of vet is to test and check at the same time multiple packages
in a single, local, parent directory.

**vet** helps develop a system composed of multiple packages, for
example, all the packages of
[**fgeo**](https://forestgeo.github.io/fgeo/) – where some packages may
depend on other packages of the same system, and changing one package
may brake others. In this scenario, it is useful to know quickly when,
where and why something brakes. Instead of opening, testing, and
checking each package individually, you can vet all packages on an R
session while you continue working on another session.

## Installation

``` r
devtools::install_github("maurolepore/vet")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(vet)

pkgs <- fgeo::fgeo_core()
test_pkgs(pkgs)
check_pkgs(pkgs)
```
