#' Delete a git repository in an existing TFS (Git) Project
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
#' 
#' @examples
#' tfs        <- "https://stephlocke.visualstudio.com"
#' authcreds  <- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")
#' parentproj <- "tfsr3"
#' newrepo    <- as.character(random::randomStrings(n=1, len=6))
#' createdrepo  <- createTFSRepository(tfs,authcreds,parentproj,newrepo)
#' 
#' deleteTFSRepository(tfs,authcreds,newrepo)
#' @export

deleteTFSRepository<-function(URL,Credentials,Repo,...,URLSub="DefaultCollection"){
  if (length(Repo)>1) stop("Sorry, you can only delete one repository at a time")
  
  # Get guid of parent project
  availableprojs   <- getTFSProjects(URL,Credentials,..., URLSub=URLSub )
  repoguid       <- availableprojs[name==Repo,id]
  
  # Validation of parent GUID
  if(length(repoguid)==0) stop("Sorry, we couldn't find that repo to delete")
  
  if(length(repoguid)>1) stop("Sorry, we found more than one possible repo to delete.
                                At the moment, we're not setup to distinguish between them.
                                Please run `getTFSProjects` to see whats happening")
  
  # Construct API URL
  TFSURL         <- paste(URL,URLSub,
                          "_apis/git/repositories",paste0(repoguid,"?api-version=1.0"), sep="/")
  # Push new repo to API
  req            <- httr::DELETE(TFSURL,Credentials)
  
  # Process JSON response
  contents       <- httr::content(req,as="text", encoding = "utf-8")
  
  if(contents=="") contents<-"Success!"
  return(contents)
  
}