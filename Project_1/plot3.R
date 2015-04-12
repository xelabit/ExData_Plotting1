house <- read.csv("~/R/EDA/Project_1/household_power_consumption.txt",
                  sep=";", na.strings="?")
library(lubridate)
house$Date <- dmy(house$Date)
library(dplyr)
house7 <- filter(house, Date >= "2007-02-01" & Date < "2007-02-03")
x <- paste(house7$Date, house7$Time)
house7$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
par(mar = c(5, 0, 1, 0), cex = 0.9)
plot(house7$Time, house7$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(house7$Time, house7$Sub_metering_2, col = "red")
lines(house7$Time, house7$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))