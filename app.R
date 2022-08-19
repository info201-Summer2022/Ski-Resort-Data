library(shiny)
library(ggplot2)
library(dplyr)

# set up the UI
page_one <- fluidPage(
  titlePanel("Page One"), # title
  
  # sidebar layout
    sidebarLayout(
      sidebarPanel(
        sliderInput(
          inputId = "page_1",
          label = "Variable",
          min = 0,
          max = 25,
          value = 25
        )
      ),
      mainPanel(
        h3("Primary Content"),
        p("plot"),
        tags$div(class = 'font_1')
      )
    )
)

page_two <- fluidPage(
  titlePanel("Page 2"), # title
  
  # sidebar layout
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "page_2",
        label = "Variable",
        min = 0,
        max = 25,
        value = 25
      )
    ),
    mainPanel(
      h3("Primary Content"),
      p("plot")
    )
  )
)

ui <- navbarPage(
  "Ski Resort Research",
  tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Rubik+Iso&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Cookie&display=swap');
      body {
        background-color: black;
      }
      .navbar-brand {
        font-family: 'Rubik Iso';
      }
      .navbar-nav > li:active {
        font-weight: bold;
      }
      .container-fluid > h2 {
        color: white;
        font-family: 'Yusei Magic', sans-serif;
      }
      .col-sm-8 > h3 {
        font-family: 'Cookie';
        color:white;
      }
      .col-sm-8 > p{
        color: blue;
      }
      "))
  ),
  tabPanel("page One", page_one),
  tabPanel("page two", page_two)
)

# server logic
server <- function(input, output){
  
}

shinyApp(ui = ui, server = server)