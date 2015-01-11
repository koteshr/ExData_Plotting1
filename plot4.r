## This script creates plot 4 for Project 1 - Exploratory Data Analysis

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

## Creating Plot 4
## setting up having 4 graphs 2x2
## Directly printing to png device

png(filename="plot4.png")

par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,0))

with(plot_data, {
  plot(Global_active_power~Date_Time, type="l",
       xlab = "", ylab="Global Active Power (kilowatts)")
  plot(Voltage~Date_Time, type="l",
       xlab = "", ylab="Voltage (volt)")
  plot(Sub_metering_1~Date_Time, type="l",
       xlab= "", ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Date_Time,col='Red')
  lines(Sub_metering_3~Date_Time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         , yjust=1)
  plot(Global_reactive_power~Date_Time, type="l",
       xlab="", ylab="Global Rective Power (kilowatts)")
})


dev.off()

## End
