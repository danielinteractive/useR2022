library(shinytest)
packageVersion("shinytest")

# Basic operation.
app <- ShinyDriver$new("basic/")
app$setInputs(name = "Daniel")
app$getValue("greeting")
app$click("reset")
app$getValue("greeting")
app$takeScreenshot()

# Can use then together with testthat.
library(testthat)
# Even better is to make sure to wait long enough.
app$setInputs(name = "Daniel")
value1 <- app$waitForValue("greeting", iotype = "output")
expect_identical(value1, "Hi Daniel")
app$setInputs(name = "Ben")
# Make sure that greeting has been changed from old value before we take it.
value2 <- app$waitForValue("greeting", ignore = list(value1), iotype = "output")
expect_identical(value2, "Hi Ben")
app$click("reset")
# Same idea here.
value3 <- app$waitForValue("greeting", ignore = list(value2), iotype = "output")
expect_identical(value3, "")
# Oops - it is not! Why?
value3
# So we can instead e.g. expect this:
expect_identical(value3$message, "")
app$takeScreenshot()
app$getAllValues()

# For Help:
?ShinyDriver
