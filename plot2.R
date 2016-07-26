# Read and create subset
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(dataSubset$Date,dataSubset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(dataSubset$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, typ = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off