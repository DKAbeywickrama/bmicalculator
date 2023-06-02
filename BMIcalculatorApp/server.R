library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("BMI Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("weight", "Weight (kg):", value = 70),
      numericInput("height", "Height (cm):", value = 170),
      actionButton("calculate", "Calculate BMI")
    ),
    mainPanel(
      h4("BMI Result:"),
      verbatimTextOutput("bmiValue"),
      h4("BMI Category:"),
      verbatimTextOutput("bmiCategory")
    )
  )
)

# Define Server
server <- function(input, output) {
  
  # Calculate BMI
  observeEvent(input$calculate, {
    weight <- input$weight
    height <- input$height / 100  # Convert height to meters
    
    bmi <- weight / (height^2)
    
    output$bmiValue <- renderText({
      sprintf("%.2f", bmi)
    })
    
    output$bmiCategory <- renderText({
      if (bmi < 18.5) {
        "Underweight"
      } else if (bmi < 25) {
        "Normal Weight"
      } else if (bmi < 30) {
        "Overweight"
      } else {
        "Obese"
      }
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)
