library(shiny)
library(ggplot2)
library(dplyr)
library(stringr)
library(rsconnect)

# read data
european_df <- read.csv("European_Ski_Resorts.csv")
ski_df <- read.csv("Ski_resort.csv")
# clean data set
ski_df <- select(ski_df, Type, Date_of_purchase, Acquisition_mode, Selling_price, Total_price)
european_df <- select(european_df, Resort, Country, DayPassPriceAdult, TotalSlope)