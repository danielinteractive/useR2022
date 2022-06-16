source("./app.R")

# app with numeric rates
do.call(shiny::shinyApp, shiny_app(new_numeric_rate_collector(type = "S3")))
do.call(shiny::shinyApp, shiny_app(new_numeric_rate_collector(type = "S4")))
do.call(shiny::shinyApp, shiny_app(new_numeric_rate_collector(type = "R6")))

# app with factor rates
do.call(shiny::shinyApp, shiny_app(new_factor_rate_collector(type = "S3")))
do.call(shiny::shinyApp, shiny_app(new_factor_rate_collector(type = "S4")))
do.call(shiny::shinyApp, shiny_app(new_factor_rate_collector(type = "R6")))