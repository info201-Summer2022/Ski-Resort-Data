server <- function(input, output){
  # acquisition mode
  output$pie <- renderPlot({
    filter_df <- filter(ski_df, input$date[1] <= Date_of_purchase, Date_of_purchase <= input$date[2])
    num_mode <- length(unique(filter_df$Acquisition_mode))
    num_package <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("package", ignore_case=TRUE))))
    num_onsite <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("on_site", ignore_case=TRUE))))
    num_online <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("online", ignore_case=TRUE))))
    num_redheroic <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("red heroic", ignore_case=TRUE))))
    
    list <- c(num_package, num_onsite, num_online, num_redheroic)
    piepercent <- round(100*(list/nrow(filter_df)),1)
    percentage <- paste(piepercent, "%")
    pie(piepercent, labels = percentage, main = "Acquisition mode of ski tickets", cex = 0.8, radius = 1, col = rainbow(4))
    legend("topright", c("package", "onsite", "online", "Red Heroic"), cex = 1, fill = rainbow(4))
  })
  
  output$piechart <- renderPlot({
    filter_df <- filter(ski_df, input$date[1] <= Date_of_purchase, Date_of_purchase <= input$date[2])
    num_mode <- length(unique(filter_df$Acquisition_mode))
    num_package <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("package", ignore_case=TRUE))))
    num_onsite <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("on_site", ignore_case=TRUE))))
    num_online <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("online", ignore_case=TRUE))))
    num_redheroic <- nrow(filter(filter_df, str_detect(filter_df$Acquisition_mode, fixed("red heroic", ignore_case=TRUE))))
    
    list <- c(num_package, num_onsite, num_online, num_redheroic)
    piepercent <- round(100*(list/nrow(filter_df)),1)
    percentage <- paste(piepercent, "%")
    pie(piepercent, labels = percentage, main = "Acquisition mode of ski tickets", cex = 0.8, radius = 1, col = rainbow(4))
    legend("topright", c("package", "onsite", "online", "Red Heroic"), cex = 1, fill = rainbow(4))
  })
  
  # linear regression
  output$linear_regression <- renderPlot({
    if(input$select == 1){
      type_selected = "Season"
    } else if(input$select == 2){
      type_selected = "Red HEROIC"
    } else {
      type_selected = "Daily"
    }
    filter_df <- filter(ski_df, Type == type_selected)
    ggplot(filter_df, aes(x = Selling_price, y = Total_price)) + geom_point() + xlab("Selling price") + ylab("Total Price") + labs(title = "Relationship between Selling price and Total pice") + geom_smooth(method=lm, color = "blue", se = FALSE) + theme_ipsum() + theme(axis.title = element_text(size = 10), plot.title = element_text(size = 13, hjust = 0.5))  
  })
  
  output$scatterplot <- renderPlot({
    if(input$select == 1){
      type_selected = "Red HEROIC"
    } else if(input$select == 2){
      type_selected = "season"
    } else {
      type_selected = "Daily"
    }
    filter_df <- filter(ski_df, Type == type_selected)
    ggplot(filter_df, aes(x = Selling_price, y = Total_price)) + geom_point() + xlab("Selling price") + ylab("Total Price") + 
      labs(title = "Relationship between Selling price and Total pice") + geom_smooth(method=lm, color = "blue", se = FALSE) +
      theme_ipsum() + theme(axis.title = element_text(size = 10), plot.title = element_text(size = 13, hjust = 0.5))  
  })
  
  # European ski resort selector
  output$euScatter <- renderPlot({
    filter_df <- filter(european_df, DayPassPriceAdult <= input$price, TotalSlope <= input$slope)
    ggplot(data = filter_df, aes(x = DayPassPriceAdult, y = TotalSlope)) + geom_point(aes(col=Country))
  })
  output$euResort <- renderTable({
    brushedPoints(european_df, input$plot_brush, xvar = "DayPassPriceAdult", yvar = "TotalSlope")
  })
  
  output$scatter <- renderPlot({
    filter_df <- filter(european_df, DayPassPriceAdult <= input$price, TotalSlope <= input$slope)
    ggplot(data = filter_df, aes(x = DayPassPriceAdult, y = TotalSlope)) + geom_point(aes(col=Country))
  })
  output$resort <- renderTable({
    brushedPoints(european_df, input$plot_brush, xvar = "DayPassPriceAdult", yvar = "TotalSlope")
  })
}

