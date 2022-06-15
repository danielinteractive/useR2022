app <- ShinyDriver$new("../../")
app$snapshotInit("mytest")

app$setInputs(`hist1-bins` = 2)
app$setInputs(`hist1-bins` = 20)
app$snapshot()
