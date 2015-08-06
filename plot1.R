dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

febdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

activepowerdata <- as.numeric(febdata$Global_active_power)

png("plot1.png", width= 480, height = 480)
hist(activepowerdata, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
