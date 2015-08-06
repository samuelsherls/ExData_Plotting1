dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

febdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

activepowerdata <- as.numeric(febdata$Global_active_power)
datetime <-  strptime(paste(febdata$Date, febdata$Time, sep = " " ),"%d/%m/%Y %H:%M:%S")

png("plot2.png", width= 480, height = 480)
plot(datetime,activepowerdata,type = "S", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()