#' [DEPRECATED] Use alternate authentication credentials or personal access
#' tokens to connect to your TFS instance.
#'
#' @param user Username (no need to populate if using public access token)
#' @param pwd Password or public access token
#' @param type Authentication type, passed into `httr::authenticate`
#'
#' @return auth headers
#' @export
TFSAuth<-function(user ="", pwd, type = NULL){
  return("deprecated")
  }