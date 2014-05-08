readData <- function() {
	power <- read.table("household_power_consumption.txt", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep=";", header=T, na.strings="?")
	power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %T")
	power <- subset(power, as.Date(DateTime)=="2007-02-01" | as.Date(DateTime) == "2007-02-02")
}

plot1 <- function() {
	power <- readData()
	png("plot1.png")	
	hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
	message("All Done. plot1.png is saved to your working directory. Enjoy!")
}


