#' [DEPRECATED] Get existing TFS (Git) Projects
#'
#' Find out what Projects & repositories exist on TFS.
#' This will help you isolate the GUIDs etc needed to add 
#' new Git repositories.
#'
#' @param URL          URL for root TFS e.g. http://stephlocke.visualstudio.com
#' @param Credentials  \code{TFSAuth} object
#' @param ...          Additional arguments to httr::GET
#' @param Flatten      If Flatten=FALSE, the results will be returned in the native list format
#' @param URLSub       Modify this if you need to reference somewhere other than DefaultCollection
#' 
#' @return projects    Data.table (unless Flatten=FALSE, in which case a list) with each project, GUID, & type
#'
#' @keywords tfs repository list
#'
#' @seealso \code{\link{createTFSRepository}}
#' 
#' @export

getTFSProjects<-function(URL,Credentials,..., Flatten=TRUE,URLSub="DefaultCollection"){
  
  return("deprecated")
 
}