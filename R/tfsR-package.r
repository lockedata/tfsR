#' tfsR
#' If you have/want to work with R using git repositories in TFS (either on-premises or via Visual Studio Online), this 
#' package saves you having to have Visual Studio installed on your machine.
#' 
#' ## Setup
#' 
#' You must have a username (often an email address or AD account) and password for connecting. That's basically it!
#' 
#' ## Structure / Methodology
#' 
#' The active components use a Team Project containing many git repositories - this means any backlogs etc that you might 
#' wish to use need to be implemented for the entire project. As such, if you want different backlogs and so forth, you 
#' will need to create projects via the GUI since no API command exists for the creation of projects.
#'
#' @name tfsR
#' @docType package
#' @import httr data.table jsonlite

NULL
