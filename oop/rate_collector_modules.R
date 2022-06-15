source("./rate_collector_factory.R")

ui_rate_collector <- function(x) {
    UseMethod("ui_rate_collector")
}
ui_rate_collector.NumericRateCollector <- function(x) {
    function(id) {
        ns <- shiny::NS(id)

        dummy_rate <- new_rate(0)

        shiny::tagList(
            ui_rate(dummy_rate)(ns("rate")),
            shiny::actionButton(ns("submit"), "Submit!")
        )
    }
}
ui_rate_collector.FactorRateCollector <- function(x) {
    function(id) {
        ns <- shiny::NS(id)

        dummy_rate <- new_rate("a")

        shiny::tagList(
            ui_rate(dummy_rate)(ns("rate")),
            shiny::actionButton(ns("submit"), "Submit!")
        )
    }
}


srv_rate_collector_immutable <- function(x, f) {
    function(id, r_x) {
        shiny::moduleServer(
            id,
            function(input, output, session) {
                r_rate_val <- srv_rate("rate")

                shiny::observeEvent(
                    input$submit,
                    r_x(add_rate(r_x(), f(r_rate_val())))
                )
            }
        )
    }
}
srv_rate_collector_mutable <- function(x, f) {
    function(id, r_x) {
        shiny::moduleServer(
            id,
            function(input, output, session) {
                r_rate_val <- srv_rate("rate")

                shiny::observeEvent(
                    input$submit,
                    add_rate(r_x, f(r_rate_val()))
                )
            }
        )
    }
}
srv_rate_collector <- function(x) {
    UseMethod("srv_rate_collector")
}
srv_rate_collector.RateCollectorS3 <- function(x) {
    srv_rate_collector_immutable(x, new_rate_s3)
}
srv_rate_collector.RateCollectorS4 <- function(x) {
    srv_rate_collector_immutable(x, new_rate_s4)
}
srv_rate_collector.RateCollectorR6 <- function(x) {
    srv_rate_collector_mutable(x, new_rate_r6)
}