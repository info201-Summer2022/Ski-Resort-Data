acquisition_mode_time <- fluidPage(
  titlePanel("Acquisition Mode Stats in one time range"), # title
  # sidebar layout
  sidebarLayout(
    sidebarPanel(
      dateRangeInput(
        inputId = "date",
        label = "Please select a date range",
        start = "2017-04-05",
        end = "2019-04-01",
        min = "2017-04-05",
        max = "2019-04-01"
      )
    ),
    mainPanel(
      h3("Pie Chart"),
      plotOutput(outputId = "pie"),
      p(""),
      p("The pie chart shows acquisition mode percentage in one time range."),
      p("You can select any time range from 2017-04-05 to 2019-04-01.")
    )
  )
)

selling_totalPrice <- fluidPage(
  titlePanel("Relationship between ticket type, selling, and total price"), # title
  # sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "select",
        label = "Please select one ticket type",
        choices = list("Season" = 1, "Red HEROIC" = 2, "Daily" = 3),
        selected = 1,
        multiple = FALSE
      )
    ),
    mainPanel(
      h3("Scatter plot with linear regression line"),
      plotOutput(outputId = "linear_regression"),
      p(""),
      p("You can select ticket type from 'Season', 'Red HEROIC', and 'Daily', and see the relationship between selling price and total price.")
    )
  )
)

eu_ski_resort <- fluidPage(
  titlePanel("European Ski Resort Selector"), # title
  # sidebar layout
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "price",
        label = "Day Pass Price of an Adult",
        min = 0,
        max = 81,
        value = 81
      ),
      sliderInput(
        inputId = "slope",
        label = "Total slope number",
        min = 0,
        max = 600,
        value = 150
      )
    ),
    mainPanel(
      h3("Scatter Plot and Selector(brush)"),
      plotOutput(outputId = "euScatter", brush = "plot_brush"),
      tableOutput(outputId = "euResort"),
      p(""),
      p("* Each plot is a ski resort."),
      p("You can select the resort you would like to explore. The detailed information of the ski resort(s) will be shown above.")
    )
  )
)

Summary <- tabPanel(
  titlePanel("Summary Information"),
  mainPanel(
    h1("Takeaways from the Project"),
    br(),
    h3("Chart 1：Pie Chart for Acquisition Mode"),
    p('Takeaway: It is the most popular way for skiers to buytickets from the Internet which indicates 
    that for new skiers, it is best for them to buy tickets online since there are clear instructions 
      and information about the activity.'),
    br(),
    p('In the future, the operatorss should improve consumer experience by distributing information
      in a fairer way since many people of the society are faced with hard situations to buy tickets online,
      which causes discrimination.'),
    br(),
    plotOutput(outputId = "piechart"),
    br(),
    h3("Chart 2: Scatter Plot for Ticket Type, Selling & Total Price"),
    p('There is no price discount for all types of tickets, and skiers do not have to
      choose tickets to buy while only considering the price strategy.'),
    br(),
    p('Within the context, the operators of ski resorts should carry out some proper discounts
      which can stimulate the economy of ski industry, and subsequently stirs up enthuaism of people for
      the skiing sport, having more people participated in this exciting activity'),
    plotOutput(outputId = "scatterplot"),
    br(),
    h3("Chart 3: Selector for European Ski Resort Country-Wise Result"),
    br(),
    p('People have been predicting that ski resorts with higher slope would be more expensive than
      the ones with lower slope in Europe, but they are actually not. There might be more contributors
      to the price differences'),
    br(),
    p('We have to collect more data about other aspects for ski resorts around the Europe like ski
      setting, geographic location in the city, reputation, and etc, and then we can finally summarize
      the contributors to the price of the ski resorts'),
    plotOutput(outputId = "scatter"),
    plotOutput(outputId = "result")
  )
)






ui <- navbarPage(
  "Ski Resort Research",
  tags$head(
    # CSS style
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
      .col-sm-8 > h1 {
        font-weight: bold;
        color:white;
      }
      .col-sm-8 > p{
        color: grey;
      }
      .table-condensed {
        color: black;
      }
      .shiny-table.spacing-s>thead>tr {
        color: white;
      }
      .table.shiny-table>tbody{
        color: white;
      }
      "))
  ),
  tabPanel("Acquisition Mode", acquisition_mode_time),
  tabPanel("Selling price and Total price", selling_totalPrice),
  tabPanel("European Ski Resort", eu_ski_resort),
  tabPanel("Summary and Finalization", Summary)
)
