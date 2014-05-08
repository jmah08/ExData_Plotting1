readData <- function() {
	power <- read.table("household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", header=T, na.strings="?")
	power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %T")
	power <- subset(power, as.Date(DateTime)=="2007-02-01" | as.Date(DateTime) == "2007-02-02")
}

plot3 <- function() {
	power <- readData()
	png("plot3.png")	
		plot(power$DateTime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
		points(power$DateTime, power$Sub_metering_2, type="l", col="red")
		points(power$DateTime, power$Sub_metering_3, type="l", col="blue")
		legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)	
	dev.off()
	message("All Done. plot3.png is saved to your working directory. Enjoy!")
}


