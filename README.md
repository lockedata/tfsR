
<!-- README.md is generated from README.Rmd. Please edit that file -->
tfsR
====

[![Build Status](https://travis-ci.org/stephlocke/tfsR.png?branch=dev)](https://travis-ci.org/stephlocke/tfsR)[![Coverage Status](https://coveralls.io/repos/stephlocke/tfsR/badge.svg)](https://coveralls.io/r/stephlocke/tfsR)

This package allows you to work with Visual Studio Team Services (VSTS) and Team Foundation Server (TFS). The original version(s) of the package were solely aimed creating git repositories but with the ability to create Projects and more, \[@velincw\](<https://github.com/vergilcw>) to be a little bit more ambitious! This will be a complete rebuild, with some aliases provided for backwards compatability.

The package will probably stop where it used to - at git source control functionality as git2r and other packages handle this.

Install tfsR
------------

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("stephlocke/tfsR", build_vignettes = TRUE)
```
