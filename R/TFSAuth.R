#' Use alternate authentication credentials or personal access
#' tokens to connect to your TFS instance.
#'
#' @param user Username (no need to populate if using public access token)
#' @param pwd Password or public access token
#'
#' @return auth headers
#' @export
#'
#' @examples
#' authcreds <- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")
TFSAuth<-function(user ="", pwd){
  httr::authenticate(user, password = pwd)
}