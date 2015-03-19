#' Get existing TFS (Git) Projects
#'
#' Find out what Projects & repositories exist on TFS.
#' This will help you isolate the GUIDs etc needed to add 
#' new Git repositories.
#'
#' @param URL          URL for root TFS e.g. http://stefflocke.visualstudio.com
#' @param Credentials  `httr::authenticate("username","password")` object
#' @param ...          Additional arguments to httr::GET
#' @param Flatten      If Flatten=FALSE, the results will be returned in the native list format
#' @param URLsub       Modify this if you need to reference somewhere other than DefaultCollection
#' 
#' @return projects    Data.table (unless Flatten=FALSE, in which case a list) with each project, GUID, & type
#'
#' @keywords foo bar
#'
#' @seealso \code{\link{bar}}
#' 
#' @examples
#' # simple example
#' tfs<-"https://stefflocke.visualstudio.com"
#' authcreds<-httr::authenticate("stephstemp@@grr.la","UsedForExamples")
#' tfsprojects<-getTFSProjects(tfs,authcreds) 
#'
#' @export

getTFSProjects<-function(URL,Credentials,..., Flatten=TRUE,URLSub="DefaultCollection"){
  # Construct API URL
  TFSURL         <- paste(URL,URLSub,
                 "_apis/git/repositories?api-version=1.0", sep="/")
  
  # Get JSON of git repos
  req            <- httr::GET(TFSURL,Credentials)
  
  # Process JSON
  contents       <- httr::content(req,as="text")
  projects       <- jsonlite::fromJSON(contents, simplifyDataFrame = Flatten)
  
  # Makes structure flatter, and also adds a nice helper column for identifying
  # cases where there repos are made inside projects since these cannot be used
  # in the repo setup as existing project GUIDs
  if(Flatten){
  projects       <- data.table::data.table(
    jsonlite::flatten(projects$value))[
      ,type:=ifelse(name==project.name,"Project","Sub-Project")]
  }
  
  return(projects)
  
}