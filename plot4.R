# Read and create subset
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(dataSubset$Date,dataSubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dataSubset$Global_active_power)
globalReactivePower <- as.numeric(dataSubset$Global_reactive_power)
subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
subMetering3 <- as.numeric(dataSubset$Sub_metering_3)
voltage <- as.numeric(dataSubset$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, globalActivePower, typ = "l", xlab= "",ylab = "Global Active Power", cex = 0.2)
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "voltage")
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"), bty = "o")

plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off