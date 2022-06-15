source("./rate_modules.R")
source("./rate_collector_modules.R")

shiny_app_immutable <- function(x) {
    list(
        ui = shiny::fluidPage(
            ui_rate_collector(x)("aaa"),
            shiny::verbatimTextOutput("summary"),
            shiny::verbatimTextOutput("str")
        ),
        server = function(input, output, session) {
            r_rc <- shiny::reactiveVal(x)
            srv_rate_collector(x)("aaa", r_rc)
            output$summary <- shiny::renderPrint(summary(r_rc()))
            output$str <- shiny::renderPrint(str(r_rc()))
        }
    )
}
shiny_app_mutable <- function(x) {
    list(
        ui = shiny::fluidPage(
            ui_rate_collector(x)("aaa"),
            shiny::verbatimTextOutput("summary"),
            shiny::verbatimTextOutput("str")
        ),
        server = function(input, output, session) {
            srv_rate_collector(x)("aaa", x)
            output$summary <- shiny::renderPrint(summary(x))
            output$str <- shiny::renderPrint(str(x))
        }
    )
}
shiny_app <- function(x) {
    UseMethod("shiny_app")
}
shiny_app.RateCollectorS3 <- function(x) {
    shiny_app_immutable(x)
}
shiny_app.RateCollectorS4 <- function(x) {
    shiny_app_immutable(x)
}
shiny_app.RateCollectorR6 <- function(x) {
    shiny_app_mutable(x)
}
