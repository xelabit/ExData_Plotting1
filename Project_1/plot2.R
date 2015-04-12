house <- read.csv("~/R/EDA/Project_1/household_power_consumption.txt",
                  sep=";", na.strings="?")
library(lubridate)
house$Date <- dmy(house$Date)
library(dplyr)
house7 <- filter(house, Date >= "2007-02-01" & Date < "2007-02-03")
x <- paste(house7$Date, house7$Time)
house7$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
par(mar = c(5, 0, 1, 0), cex = 0.9)
plot(house7$Time, house7$Global_active_power, type = "l", ylab = "Global Active Power (kilowats)",
     xlab = "")