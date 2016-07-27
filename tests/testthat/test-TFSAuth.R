library(data.table)
context("TFSAuth")

tfs<-"https://stephlocke.visualstudio.com"
authcreds<- TFSAuth(pwd="fz43enydh7vi2o6jqir2gmftohh7ooz2lizqvy6jxtw4ltrpwola")

authcreds1<- TFSAuth(user = "tfsRtesting", 
                     pwd= "tfsRtesting0.1.3",
                     type = "basic")

test_that("Auth Key Works" , {
  tfsprojects<-getTFSProjects(tfs,authcreds)
  conditionalnumberofcols<-9 + ("defaultBranch" %in% colnames(tfsprojects))
  expect_equal(ncol(tfsprojects),conditionalnumberofcols)
  expect_equal(sum(tfsprojects[,sapply(.SD,is.character)]),conditionalnumberofcols)
  expect_true(nrow(tfsprojects)>0)
})

test_that("Basic Authentication Works" , {
  tfsprojects<-getTFSProjects(tfs,authcreds1)
  conditionalnumberofcols<-9 + ("defaultBranch" %in% colnames(tfsprojects))
  expect_equal(ncol(tfsprojects),conditionalnumberofcols)
  expect_equal(sum(tfsprojects[,sapply(.SD,is.character)]),conditionalnumberofcols)
  expect_true(nrow(tfsprojects)>0)
  
})
