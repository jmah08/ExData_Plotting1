readData <- function() {
	power <- read.table("household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", header=T, na.strings="?")
	power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %T")
	power <- subset(power, as.Date(DateTime)=="2007-02-01" | as.Date(DateTime) == "2007-02-02")
}

plot2 <- function() {
	power <- readData()
	png("plot2.png")	
	plot(power$DateTime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off()
	message("All Done. plot2.png is saved to your working directory. Enjoy!")
}


