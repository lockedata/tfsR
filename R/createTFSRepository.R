#' [DEPRECATED] Setup a git repository in an existing TFS (Git) Project
#'
#' This produces a repository and returns the URL that can 
#' be used for pushing/pulling
#'
#' @param URL           URL for root TFS e.g. http://stephlocke.visualstudio.com
#' @param Credentials  \code{TFSAuth} object
#' @param ParentProject Name of parent project to store repository in
#' @param NewRepo       Name for new repository
#' @param ...           Additional arguments to httr::POST
#' @param URLSub        Modify this if you need to reference somewhere other than DefaultCollection
#' 
#' @return RepoURL    String containing location of repository
#'
#' @keywords tfs repository list
#'
#' @export

createTFSRepository<-function(URL,Credentials,ParentProject,NewRepo,...,URLSub="DefaultCollection"){
 
  return("deprecated")
  
}