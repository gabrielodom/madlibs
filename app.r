library(shiny)

# Define UI for application that generates a Mad Libs story
ui <- fluidPage(
  titlePanel("Fun Mad Libs"),

  sidebarLayout(
    sidebarPanel(
      textInput("noun1", "Enter a noun:", "cat"),
      textInput("adjective1", "Enter an adjective:", "fluffy"),
      textInput("verb1", "Enter a verb (past tense):", "jumped"),
      textInput("noun2", "Enter another noun:", "ball"),
      textInput("adjective2", "Enter another adjective:", "colorful"),
      actionButton("submit", "Create Story")
    ),
    mainPanel(
      textOutput("story")
    )
  )
)

# Define server logic to generate the Mad Libs story
server <- function(input, output) {

  # Reactive expression to generate the story when the button is pressed
  story <- eventReactive(input$submit, {

    # attempting a logging message:
    cat("This is a message\n")
    # When I run the app locally, this message is printed in the Console.
    cat("This is a message\n", file = stderr())
    # I've just moved these logs into the story() function definition. Now it
    # prints both copies of the message whenever I click "Create Story". When I
    # include this code after the paste(), I see nothing (not even the story)
    # in the applet.
    # UPDATE: I just had to do a hard refresh of the browser.

    paste("Once upon a time, there was a", input$adjective1,
          input$noun1, "who loved to", input$verb1, ".",
          "One day, the", input$adjective1, input$noun1,
          "found a", input$adjective2, input$noun2,
          "and they lived happily ever after.")

    cat("test message 2\n")

  })

  # Output the story
  output$story <- renderText({
    story()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
