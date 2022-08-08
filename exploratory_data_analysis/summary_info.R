# The purpose of this analysis was to calculate number of people who
# purchased resort tickets from different acquisition mode, 
# purchased resort tickets at different time,
# purchased different types of tickets,
# and purchased tickets have different amount of days.
# Also, we calculate the mean difference between total price and selling
# price of each acquisition mode.

library(ggplot2)
library(dplyr)
library(stringr)

# Read the dataset and calculate basic information.
data_df <- read.csv("Ski_resort.csv")
num_row <- nrow(data_df)
num_col <- ncol(data_df)

# Calculate number of people buying resort tickets from each acquisition mode and their proportion.
num_mode <- length(unique(data_df$Acquisition_mode))
num_package <- nrow(filter(data_df, str_detect(data_df$Acquisition_mode, fixed("package", ignore_case=TRUE))))
num_onsite <- nrow(filter(data_df, str_detect(data_df$Acquisition_mode, fixed("on_site", ignore_case=TRUE))))
num_online <- nrow(filter(data_df, str_detect(data_df$Acquisition_mode, fixed("online", ignore_case=TRUE))))
num_redheroic <- nrow(filter(data_df, str_detect(data_df$Acquisition_mode, fixed("red heroic", ignore_case=TRUE))))
package_prop <- num_package / num_row
onsite_prop <- num_onsite / num_row
online_prop <- num_online / num_row
redheroic_prop <- num_redheroic / num_row

# Calculate number of people bought tickets in different season and their proportion.
time_df <- select(data_df, Bought_in)
unique_time <- unique(time_df)
num_regular <- nrow(filter(time_df, Bought_in == "Regular_season"))
num_outside <- nrow(filter(time_df, Bought_in == "Outside_season"))
regular_prop <- num_regular / num_row
outside_prop <- num_outside / num_row

# Calculate number of people buying each type of resort tickets and their proportion.
type_df <- select(data_df, "Type")
different_type <- unique(type_df)
num_season <- nrow(filter(type_df, Type == "Season"))
num_daily <- nrow(filter(type_df, Type == "Daily"))
num_red <- nrow(filter(type_df, Type == "Red HEROIC"))
season_prop <- num_season / num_row
daily_prop <- num_daily / num_row
red_prop <- num_red / num_row

# Calculate number of people having different amount of days.
amount_days <- select(data_df, "Amount_of_days")
unique_days <- unique(amount_days)
unlimited_days <- nrow(filter(amount_days, Amount_of_days == "Unlimited"))
nine_days <- nrow(filter(amount_days, Amount_of_days == "9"))
eight_days <- nrow(filter(amount_days, Amount_of_days == "8"))
seven_days <- nrow(filter(amount_days, Amount_of_days == "7"))
six_days <- nrow(filter(amount_days, Amount_of_days == "6"))
five_days <- nrow(filter(amount_days, Amount_of_days == "5"))
four_days <- nrow(filter(amount_days, Amount_of_days == "4"))
three_days <- nrow(filter(amount_days, Amount_of_days == "3"))
two_days <- nrow(filter(amount_days, Amount_of_days == "2"))
one_day <- nrow(filter(amount_days, Amount_of_days == "1"))

# Calculate the mean difference between total price and selling price of each acquisition mode.
package_df <- filter(data_df, Acquisition_mode == "Package")
package_diff <- (sum(package_df$Total_price) - sum(package_df$Selling_price)) / num_package
onsite_df <- filter(data_df, Acquisition_mode == "On_site")
onsite_diff <- (sum(onsite_df$Total_price) - sum(onsite_df$Selling_price)) / num_onsite
online_df <- filter(data_df, Acquisition_mode == "Online")
online_diff <- (sum(online_df$Total_price) - sum(online_df$Selling_price)) / num_online
redheroic_df <- filter(data_df, Acquisition_mode == "Red HEROIC")
redheroic_diff <- (sum(redheroic_df$Total_price) - sum(redheroic_df$Selling_price)) / num_redheroic

summary_info <- list(num_observations = num_row,
                     num_features = num_col,
                     types_of_bought_time = unique_time,
                     types_of_tickets = different_type,
                     different_amounts_of_days = unique_days,
                     package_price_difference = package_diff,
                     onsite_price_difference = onsite_diff,
                     online_price_difference = online_diff,
                     redheroic_price_difference = redheroic_diff)
