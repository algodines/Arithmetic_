library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "number1",
                   label = "Number 1",
                   value = 0),
      numericInput(inputId = "number2",
                   label = "Number 2",
                   value = 0),

      # add + mult. buttons
      actionButton("add", "Add"),
      actionButton("multiply", "Multiply")
    ),
    mainPanel(
      h2("The sum of the two numbers is:"),
      textOutput("sum")
    )
  )
)

server <- function(input, output) {

  # added this - result store for add
  result <- reactiveVal(0)

  # added these - ovserve events
  observeEvent(input$add, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    result(x1 + x2)
  })

  observeEvent(input$multiply, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    result(x1 * x2)
  })

  # added this - modifies output to show the results
  output$sum <- renderText({
    result()
  })
}

shinyApp(ui = ui, server = server)
