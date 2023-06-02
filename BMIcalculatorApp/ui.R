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