library(ggplot2)
library(dplyr)
library(stringr)

data <- read.csv("ski_resort.csv")

num_mode <- length(unique(data$Acquisition_mode))
num_package <- nrow(filter(data, str_detect(data$Acquisition_mode, fixed("package", ignore_case=TRUE))))
num_onsite <- nrow(filter(data, str_detect(data$Acquisition_mode, fixed("on_site", ignore_case=TRUE))))
num_online <- nrow(filter(data, str_detect(data$Acquisition_mode, fixed("online", ignore_case=TRUE))))
num_redheroic <- nrow(filter(data, str_detect(data$Acquisition_mode, fixed("red heroic", ignore_case=TRUE))))

list <- c(num_package, num_onsite, num_online, num_redheroic)
piepercent <- round(100*(list/nrow(data)),1)
percentage <- paste(piepercent, "%")
pie(piepercent, labels = percentage, main = "Acquisition mode of ski tickets", cex = 0.8, radius = 1, col = rainbow(4))
legend("topright", c("package", "onsite", "online", "Red Heroic"), cex = 0.5, fill = rainbow(4))