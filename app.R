install.packages('shiny')
library('shiny')

# Define UI
ui <- fluidPage(
  h1("Let's do a survey!"),
  p("Answer the following questions:"),
  textInput(
    inputId = "major",
    label = "What is your major?"
  ),
  radioButtons(
    inputId = "year",
    label = "What is your year?",
    choices = list(
      "Freshman" = "Freshman",
      "Sophomore" = "Sophomore",
      "Junior" = "Junior",
      "Senior" = "Senior"
    ),
    selected = ""
  ),
  sliderInput(
      inputId = "rating",
      h3("How would you rate UW?"),
      min = 0,
      max = 10,
      value = 5
  ),
  h1("Your answers:"),
  textOutput(outputId = "tvMajor"),
  textOutput(outputId = "tvYear"),
  textOutput(outputId = "tvRating")
)

# Define server logic
server <- function (input, output) {
  output$tvMajor <- renderText({
    paste("Your major is ", input$major)
  })

  output$tvYear <- renderText({
    paste("Your are a ", input$year)
  })

  output$tvRating <- renderText({
    paste("You rate UW ", input$rating, "/10")
  })
}

# Run the app
shinyApp(ui = ui, server = server)