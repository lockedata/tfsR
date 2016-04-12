#' Setup a git repository in an existing TFS (Git) Project
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
#' 
#' @examples
#' tfs        <- "https://stephlocke.visualstudio.com"
#' authcreds  <- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")
#' parentproj <- "tfsr3"
#' newrepo    <- as.character(random::randomStrings(n=1, len=6))
#' 
#' createdrepo  <- createTFSRepository(tfs,authcreds,parentproj,newrepo)
#' deleted<-deleteTFSRepository(tfs,authcreds,newrepo)
#' @export

createTFSRepository<-function(URL,Credentials,ParentProject,NewRepo,...,URLSub="DefaultCollection"){
  if (length(NewRepo)>1) stop("Sorry, you can only put one repository in at a time")
  
  # Construct API URL
  TFSURL         <- paste(URL,URLSub,
                          "_apis/git/repositories?api-version=1.0", sep="/")
  
  # Get guid of parent project
  availableprojs   <- getTFSProjects(URL,Credentials,..., URLSub=URLSub )
  parentguid       <- availableprojs[name==ParentProject&type=="Project",project.id]
  
  # Validation of parent GUID
  if(length(parentguid)==0) stop("Sorry, we couldn't find that Project at a top-level. 
                                 Please run `getTFSProjects` to see whats available.
                                 Remember - R is case sensitive!")
  
  if(length(parentguid)>1) stop("Sorry, we found more than one possible parent project.
                                At the moment, we're not setup to distinguish between them.
                                Please run `getTFSProjects` to see whats happening")
  
  # Create JSON request  
  newgitrepo  <- toJSON(list(name=NewRepo,project=list(id=parentguid)), auto_unbox=TRUE)
  
  # Push new repo to API
  req            <- httr::POST(TFSURL,Credentials,body=newgitrepo, 
                               encode="json", httr::content_type_json())
  
  # Process JSON response
  contents       <- httr::content(req,as="text", encoding = "utf-8")
  projects       <- jsonlite::fromJSON(contents, simplifyDataFrame = TRUE)
  
  return(projects$remoteUrl)
  
}