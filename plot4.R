dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

febdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

voltagedata <- as.numeric(febdata$Voltage)
activepowerdata <- as.numeric(febdata$Global_active_power)

voltagedata <- as.numeric(febdata$Voltage)
reactivepowerdata <- as.numeric(febdata$Global_reactive_power)

submeter1 <- as.numeric(febdata$Sub_metering_1)
submeter2 <- as.numeric(febdata$Sub_metering_2)
submeter3 <- as.numeric(febdata$Sub_metering_3)


datetime <-  strptime(paste(febdata$Date, febdata$Time, sep = " " ),"%d/%m/%Y %H:%M:%S")


png("plot4.png", width= 480, height = 480)

par(mfrow = c(2,2))

plot(datetime,activepowerdata,type = "S", xlab = "", ylab = "Global Active Power (kilowatts)", cex=0.2)
plot(datetime, voltagedata, type="S",xlab = "datetime", ylab ="Voltage")

plot(datetime,submeter1,type = "S", ylab = "Energy Submetering", xlab ="")
lines(datetime, submeter2, type ="S", col="red")
lines(datetime, submeter3, type ="S", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, reactivepowerdata, type ="S", xlab ="datetime", ylab="Global_reactive_power")


dev.off()