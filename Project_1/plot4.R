house <- read.csv("~/R/EDA/Project_1/household_power_consumption.txt",
                  sep=";", na.strings="?")
library(lubridate)
house$Date <- dmy(house$Date)
library(dplyr)
house7 <- filter(house, Date >= "2007-02-01" & Date < "2007-02-03")
x <- paste(house7$Date, house7$Time)
house7$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
par(mar = c(2, 2, 0, 0), cex = 0.7, cex.axis = 0.7, mfcol = c(2, 2), pin = c(2.1, 2),
    oma = c(0, 0, 0, 0))

# 1st plot (top left)

plot(house7$Time, house7$Global_active_power, type = "l", ylab = NA,
     xlab = NA)
mtext(side = 2, "Global Active Power", line = 2, cex = 0.7)

# 2nd plot (bottom left)

plot(house7$Time, house7$Sub_metering_1, type = "l", xlab = NA, ylab = NA)
lines(house7$Time, house7$Sub_metering_2, col = "red")
lines(house7$Time, house7$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n", cex = 0.8)
mtext(side = 2, "Energy sub metering", line = 2, cex = 0.7)

# 3rd plot (top right)

plot(house7$Time, house7$Voltage, type = "l", ylab = NA, xlab = NA)
mtext(side = 1, "datetime", line = 2, cex = 0.7)
mtext(side = 2, "Voltage", line = 2, cex = 0.7)

# 4th plot (bottom right)

plot(house7$Time, house7$Global_reactive_power, type = "l", ylab = NA, xlab = NA)
mtext(side = 1, "datetime", line = 2, cex = 0.7)
mtext(side = 2, "Global_reactive_power", line = 2, cex = 0.7)