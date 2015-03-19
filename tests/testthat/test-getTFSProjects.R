library(data.table)
context("getTFSProjects")

tfs<-"https://stefflocke.visualstudio.com"
 authcreds<-httr::authenticate("tfsexample","UsedForExampl3s")

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