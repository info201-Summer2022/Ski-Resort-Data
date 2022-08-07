library(ggplot2)
library(dplyr)
library(stringr)
library(data.table)

# read data and create data frame, need to change the working directory to github folder
data_df <- read.csv("data/Ski_resort.csv")
# select columns of interest
new_data_df <- select(data_df, Type, Hotel)
# group by
df_grp <- new_data_df %>% group_by(Type) %>% summarise(live_in_hotel = sum(Hotel != "False"),
                                                       not_live_in_hotel = sum(Hotel == "False"),
                                                       .groups = 'drop')
# add percentage column, to show the data more clearly
df_grp <- df_grp %>% mutate(hotel_percentage = (live_in_hotel / (live_in_hotel+not_live_in_hotel)*100))
df_grp[is.na(df_grp)] <- 0
# sort by live_in_hotel_percentage, from high to low
df_grp <- df_grp %>% arrange(-hotel_percentage)
# create table
table <- as.data.table(df_grp, TRUE)
print(table)

# This table included the information of skiers' ticket type and whether or not
# they live in the hotel.
# The reason why we include this table is that we want to see the relationship with
# ticket type and hotel preference, then do corresponding promotion strategy.