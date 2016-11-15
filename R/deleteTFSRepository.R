#' [DEPRECATED] Delete a git repository in an existing TFS (Git) Project
#'
#' This attempts to delete a repository and returns whether the operation was successful
#'
#' @param URL           URL for root TFS e.g. http://stephlocke.visualstudio.com
#' @param Credentials  \code{TFSAuth} object
#' @param Repo          Name of repository to be deleted
#' @param ...           Additional arguments to httr::DELETE
#' @param URLSub        Modify this if you need to reference somewhere other than DefaultCollection
#' 
#' @return Result    String containing delete status
#'
#' @keywords tfs repository list
#'
#' @export

deleteTFSRepository<-function(URL,Credentials,Repo,...,URLSub="DefaultCollection"){
  
  return("deprecated")
  
}