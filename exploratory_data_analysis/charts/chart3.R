library(dplyr)
library(ggplot2)

bought_in_df <- read.csv("Ski_resort.csv")

ggplot(bought_in_df, aes(x=Selling_price, y=Total_price)) + 
  geom_point(colour = 4) + 
  labs(title = "Comparison between Selling Price and Total Price")

