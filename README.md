# tfsR
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/lockedata/tfsR.png?branch=master)](https://travis-ci.org/lockedata/tfsR)[![Coverage Status](https://coveralls.io/repos/lockedata/tfsR/badge.svg)](https://coveralls.io/r/lockedata/tfsR)

If you have/want to work with R using git repositories in TFS (either on-premises or via Visual Studio Online), this package saves you having to have Visual Studio (installed on your machine or online), and allows you directly manage git repositories within TFS.

The package leaves existing git source control functionality to other packages/ facilities.

## Install tfsR
```{r}
if (!require(devtools))
  install.packages("devtools")
devtools::install_github("lockedata/tfsR",
                         build_vignettes = TRUE)
```

## Setup

You must have a username (often an email address or AD account) and password for connecting. That's basically it!

NB - you can now use public acces tokens.

## Limitations

- The active components use a Team Project containing many git repositories - this means any backlogs etc that you might wish to use need to be implemented for the entire project. As such, if you want different backlogs and so forth, you will need to create projects via the GUI since no API command exists for the creation of projects.
- This only works currently with *basic authentication*, OAuth2.0 may follow
- `getTFSProjects` will only handle a single TFS URL at a time (`httr` restriction)
- `createTFSRepository` and `deleteTFSRepository` will only handle a single repository at a time, to maintain consistency
