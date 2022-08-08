library(dplyr)
library(ggplot2)

data_df <- read.csv("Ski_resort.csv")
num_row <- nrow(data_df)

package_df <- filter(data_df, Acquisition_mode == "Package")
package_diff <- (sum(package_df$Total_price) - sum(package_df$Selling_price)) / num_package
onsite_df <- filter(data_df, Acquisition_mode == "On_site")
onsite_diff <- (sum(onsite_df$Total_price) - sum(onsite_df$Selling_price)) / num_onsite
online_df <- filter(data_df, Acquisition_mode == "Online")
online_diff <- (sum(online_df$Total_price) - sum(online_df$Selling_price)) / num_online
redheroic_df <- filter(data_df, Acquisition_mode == "Red HEROIC")
redheroic_diff <- (sum(redheroic_df$Total_price) - sum(redheroic_df$Selling_price)) / num_redheroic

data_plot <- c(package_diff, onsite_diff, online_diff, redheroic_diff)
barplot(data_plot, main = "Mean Difference between Total Price and Selling Price of Each Acquisition Mode", xlab = "Acquisition Mode", 
        ylab = "Difference", names.arg = c("Package", "On_site", "Online", "Red HEROIC"))

# I include this chart to the mean difference between total price and selling price for each acquisition mode strategy 
# so as to know how does price discrimination works in our example for leading consumers' realization.

# The observation of the chart indicates that the online ticket and onsite tickets are the most expensive ones in terms of price
#changes on total price market, leading to our conclusion that it is much cost-effective for skaters to buy tickets through package
#or through events.
