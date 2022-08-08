library(dplyr)
library(ggplot2)

bought_in_df <- read.csv("Ski_resort.csv")

ggplot(bought_in_df, aes(x=Selling_price, y=Total_price)) + 
  geom_point(colour = 4) + 
  labs(title = "Comparison between Selling Price and Total Price")

# I include this chart to show how would the selling price compare with total price so that the audiences would have an understanding on the relationship
# between what strategies the sellers would want to apply when they boost up the ticket price in total. 
# It reveals the fact that the sellers would not give up interests they could get for an exchange of higher skier population buying tickets, which means
# it is hard to see huge bump-ups for a particular strategy of tickets when the total ticket prices go up or go down.
