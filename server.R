library(shiny)
diabetesRisk <- function(glucose) glucose / 200

bloodPressure <- function(systolic, diastolic){
  if(systolic<120 && diastolic<80){
    return("Normal")
  } else if((systolic>=120 && systolic<=139) || (diastolic>=80 && diastolic<=89)){
    return("Prehypertension")
  } else if((systolic>=140 && systolic<=159) || (diastolic>=90 && diastolic<=99)){
    return("High Blood Pressure (Hypertension) Stage 1")
  } else if((systolic>=160 && systolic<=180) || (diastolic>=100 && diastolic<=110)){
    return("High Blood Pressure (Hypertension) Stage 2")
  } else if((systolic>180) || (diastolic>110)){
    return("Hypertensive Crisis (Emergency care needed)")
  }
}

shinyServer(
  function(input, output) {
    output$prediction <- reactive({
    output$systolic <- renderPrint({input$systolic}) 
    output$diastolic <- renderPrint({input$diastolic})   
    
    output$prediction <- renderPrint({bloodPressure(input$systolic, input$diastolic)})

    
    
    
   })
    
  }
)