house <- read.csv("~/R/EDA/Project_1/household_power_consumption.txt",
                                        sep=";", na.strings="?")
library(lubridate)
house$Date <- dmy(house$Date)
library(dplyr)
house7 <- filter(house, Date >= "2007-02-01" & Date < "2007-02-03")
par(mar = c(5, 0, 1, 0), cex = 0.9)
hist(house7$Global_active_power, main = "Global Active Power", col = "red", ylab
     = "Frequency", xlab = "Global Active Power (kilowatts)")