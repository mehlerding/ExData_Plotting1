library(lubridate)
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- dmy(data$Date)
data <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()
