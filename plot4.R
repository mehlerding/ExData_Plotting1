library(lubridate)
data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- dmy(data$Date)
data <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))
dateandtime <- ymd_hms(paste(data$Date, data$Time))
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#plot2
plot(dateandtime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#new Voltage plot
plot(dateandtime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#plot3
plot(dateandtime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(dateandtime, data$Sub_metering_2, col = "red")
lines(dateandtime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 3, col = c("black", "red", "blue") ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
#new reactive power plot
plot(dateandtime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

