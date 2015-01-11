## This script creates plot1 for Project 1 - Exploratory Data Analysis

## First reading the data - Missing data are marked as ? in the source data

my_data <- read.csv("household_power_consumption.txt", sep = ";", 
                    header=T, na.strings="?", stringsAsFactors = F)

## we only need data for First two days of Feb 2007

## Leaving original data as is in my_data, will change the format only i

from_date <- as.Date("2007/02/01")
to_date <- as.Date("2007/02/02")

plot_data <- subset(my_data, (as.Date(my_data$Date,"%d/%m/%Y") >= from_date & 
                                  as.Date(my_data$Date, "%d/%m/%Y") <= to_date))

## Date  need to be formatted doing only for the selected data

plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")

## Creating a new column which has Datetime in POSIX format

plot_data$Date_Time <- as.POSIXct(paste(plot_data$Date, plot_data$Time))

## Creating Plot 1 - Histogram

hist(plot_data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Creating a png file of the plot

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## End

 
