## This script creates plot 3 for Project 1 - Exploratory Data Analysis

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

## Creating Plot 3

with(plot_data, {
  plot(Sub_metering_1~Date_Time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_Time,col='Red')
  lines(Sub_metering_3~Date_Time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Creating a png file of the plot

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## End
