ui <- fluidPage(
  textInput("name", label = "What's your name"),
  textOutput("greeting"),
  actionButton("reset", label = "Reset")
)
server <- function(input, output, session) {
  output$greeting <- renderText({
    req(input$name)
    paste("Hi", input$name)
  })
  observeEvent(input$reset, {
    updateTextInput(session, "name", value = "")
  })
}
shinyApp(ui, server)