library(shiny)
library(ggplot2)
library(dplyr)

# set up the UI
ui <- fluidPage(
  # insert CSS style, change font style, background color
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap');
      body {
        background-color: blue;
        color: white;
      }
      h2 {
        font-family: 'Homemade Apple', sans-serif; 
      }
      .shiny-input-container {
        color: #474747;
      }"))
  ),
  
  titlePanel("Ski resort research"),
  sidebarLayout(
    sidebarPanel(
      h3("Variable control panel"),
      sliderInput(
        inputId = "",
        label = "",
        min = ,
        max = ,
        value = 
      )
    ),
    mainPanel(
      plotOutput(outputId = "", brush = "")
    )
  )
)

# server logic
server <- function(input, output){
  
}

shinyApp(ui = ui, server = server)