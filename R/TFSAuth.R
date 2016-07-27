#' Use alternate authentication credentials or personal access
#' tokens to connect to your TFS instance.
#'
#' @param user Username (no need to populate if using public access token)
#' @param pwd Password or public access token
#' @param type Authentication type, passed into `httr::authenticate`
#'
#' @return auth headers
#' @export
#'
#' @examples
#' authcreds <- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")
#' authcreds <- TFSAuth(user="tfsRtesting", pwd="tfsRtesting0.1.3", type="basic")
TFSAuth<-function(user ="", pwd, type = NULL){
  if (!is.null(type))
  {
    httr::authenticate(user, password = pwd, type)
  } else httr::authenticate(user, password = pwd)
}