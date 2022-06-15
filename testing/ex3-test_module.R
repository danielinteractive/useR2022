library(testthat)

test_that("my module works", {
  library(shinytest)
  app <- ShinyDriver$new(
    "module/", 
    loadTimeout = 1e5, 
    phantomTimeout = 1e5,
    debug = "all"
  )
  app$getDebugLog()
  
  # Here we use the namespace that is used in the app for the module.
  ns <- NS("hist1")
  app$setValue(ns("bins"), 20)
  
  # For interactive development of the test often helpful:
  app$takeScreenshot()
  app$getAllValues()$input
  # Here we see the namespace being used!
  
  # We can also take screenshots of specific elements e.g. the plot.
  app$takeScreenshot("histplot.png", ns("hist"))
  # But note that comparing these via testthat::expect_snapshot_file
  # can be tricky - as different computers will produce slightly different
  # graphs.
  
  app$stop()
})

recordTest("module/")
