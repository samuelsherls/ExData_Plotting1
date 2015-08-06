dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

febdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

activepowerdata <- as.numeric(febdata$Global_active_power)
submeter1 <- as.numeric(febdata$Sub_metering_1)
submeter2 <- as.numeric(febdata$Sub_metering_2)
submeter3 <- as.numeric(febdata$Sub_metering_3)

datetime <-  strptime(paste(febdata$Date, febdata$Time, sep = " " ),"%d/%m/%Y %H:%M:%S")

png("plot3.png", width= 480, height = 480)

plot(datetime,submeter1,type = "S", ylab = "Energy Submetering", xlab ="")
lines(datetime, submeter2, type ="S", col="red")
lines(datetime, submeter3, type ="S", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()