library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Blood Pressure Reading"),
    sidebarPanel(
      
      numericInput('systolic', 'Systolic (mm Hg)', 119, min = 50, max = 200, step = 5),
      numericInput('diastolic', 'Diastolic (mm Hg)', 79, min = 30, max = 150, step = 5),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Blood Pressure Category'),
      h4('Your Systolic Blood Pressure is'),
      verbatimTextOutput("systolic"),
      h4('Your Diastolic Blood Pressure is'),
      verbatimTextOutput("diastolic"),      
      h4('Your blood pressure category is '),
      tags$style(type='text/css', '#prediction {background-color: rgba(255,255,0,0.40); color: black;}'), 
      verbatimTextOutput("prediction")
    )
  )
)