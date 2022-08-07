library(dplyr)

data_df <- read.csv("Ski_resort.csv")
num_row <- nrow(data_df)

type_df <- select(data_df, "Type")
different_type <- unique(type_df)
num_season <- nrow(filter(type_df, Type == "Season"))
num_daily <- nrow(filter(type_df, Type == "Daily"))
num_red <- nrow(filter(type_df, Type == "Red HEROIC"))

data_plot <- c(num_season, num_daily, num_red)
barplot(data_plot, main = "Number of Each Type", xlab = "Types", ylab = "Number", names.arg = c("Season", "Daily", "Red HEROIC"))
