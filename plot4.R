readData <- function() {
	power <- read.table("household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", header=T, na.strings="?")
	power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %T")
	power <- subset(power, as.Date(DateTime)=="2007-02-01" | as.Date(DateTime) == "2007-02-02")
}

plot4 <- function() {
	power <- readData()
	png("plot4.png")	
		par(mfrow = c(2, 2))
		## Plot 1
		plot(power$DateTime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
		## Plot 2
		plot(power$DateTime, power$Voltage, type="l", xlab="datetime", ylab="Voltage")
		## Plot 3
		plot(power$DateTime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
		points(power$DateTime, power$Sub_metering_2, type="l", col="red")
		points(power$DateTime, power$Sub_metering_3, type="l", col="blue")
		legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
		## Plot 4	
		plot(power$DateTime, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
	dev.off()
	message("All Done. plot4.png is saved to your working directory. Enjoy!")
}


