source("./rate_factory.R")

ui_rate <- function(x) {
    UseMethod("ui_rate")
}
ui_rate.NumericRate <- function(x) {
    function(id) {
        ns <- shiny::NS(id)
        shiny::sliderInput(
            inputId = ns("value"),
            label = "Pick rate",
            value = 5,
            min = 0,
            max = 10
        )
    }
}
ui_rate.FactorRate <- function(x) {
    function(id) {
        ns <- shiny::NS(id)
        shiny::radioButtons(
            inputId = ns("value"),
            label = "Pick rate",
            choices = c("great", "awesome", "brilliant")
        )
    }
}
srv_rate <- function(id) {
    shiny::moduleServer(
        id,
        function(input, output, session) {
            shiny::reactive(input$value)
        }
    )
}
