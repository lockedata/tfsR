context("createTFSRepository")

tfs<-"https://stefflocke.visualstudio.com"
 authcreds<-httr::authenticate("tfsexample","UsedForExampl3s")

test_that("Works as expected" , {
  parentproj   <- "GitRepoContainer"
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  createdrepo  <- createTFSRepository(tfs,authcreds,parentproj,newrepo)
  
  expect_equal(class(httr::parse_url(createdrepo)),"url")
})

test_that("Non-project parent directory doesn't work" , {
  parentproj   <- "APItest"
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
  
})


test_that("Non-existent parent directory doesn't work" , {
  parentproj   <- "APItest2"
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
  
})