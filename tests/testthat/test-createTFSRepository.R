context("Create & Delete")

tfs<-"https://stephlocke.visualstudio.com"
authcreds<- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")
parentproj   <- "tfsr3"
rand1<-as.character(random::randomStrings(n=1, len=6))

test_that("createTFSRepository works as expected" , {
  newrepo      <- rand1
  createdrepo  <- createTFSRepository(tfs,authcreds,parentproj,newrepo)
  
  expect_equal(class(httr::parse_url(createdrepo)),"url")
})

test_that("createTFSRepository doesn't work with multiple repos" , {
  newrepo      <- as.character(random::randomStrings(n=2, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
})

test_that("createTFSRepository with a non-project parent directory doesn't work" , {
  parentproj   <- rand1
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
})

test_that("createTFSRepository non-existent parent directory doesn't work" , {
  parentproj   <- "APItest2"
  newrepo      <- as.character(random::randomStrings(n=1, len=6))
  
  expect_error( createTFSRepository(tfs,authcreds,parentproj,newrepo))
})

test_that("deleteTFSRepository works as expected" , {
  newrepo      <- rand1
  res  <- deleteTFSRepository(tfs,authcreds,newrepo)
  
  expect_equal(res,"Success!")
})