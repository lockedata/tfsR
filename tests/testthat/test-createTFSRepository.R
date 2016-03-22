context("createTFSRepository")

tfs<-"https://stephlocke.visualstudio.com"
authcreds<- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")
parentproj   <- "tfsr3"
rand1<-as.character(random::randomStrings(n=1, len=6))
test_that("Works as expected - single repo" , {
  newrepo      <- rand1
  
  createdrepo  <- createTFSRepository(tfs,authcreds,parentproj,newrepo)
  
  expect_equal(class(httr::parse_url(createdrepo)),"url")
})

test_that("Multiple repo's doesn't work" , {
  newrepo      <- as.character(random::randomStrings(n=2, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
  
})


test_that("Non-project parent directory doesn't work" , {
  parentproj   <- rand1
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
  
})


test_that("Non-existent parent directory doesn't work" , {
  parentproj   <- "APItest2"
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
  
})