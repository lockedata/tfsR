library(data.table)
context("getTFSProjects")

tfs<-"https://stephlocke.visualstudio.com"
authcreds<- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")

test_that("Defaults work as expected" , {
  tfsprojects<-getTFSProjects(tfs,authcreds)
  conditionalnumberofcols<-9 + ("defaultBranch" %in% colnames(tfsprojects))
  expect_equal(ncol(tfsprojects),conditionalnumberofcols)
  expect_equal(sum(tfsprojects[,sapply(.SD,is.character)]),conditionalnumberofcols)
  expect_true(nrow(tfsprojects)>0)
})

test_that("Additional parameters work as expected" , {
  tfsprojects<-getTFSProjects(tfs,authcreds,Flatten=FALSE)
  expect_equal(class(tfsprojects),"list")
  expect_equal(class(tfsprojects$value),"list")
  expect_equal(class(tfsprojects$value[[1]]$project),"list")
  
})

test_that("Errors when passed a vector of URLS",{
  tfs<-c("https://stephlocke.visualstudio.com",
         "https://stephlocke.visualstudio.com")
  expect_error(getTFSProjects(tfs,authcreds))
})