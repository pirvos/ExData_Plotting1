hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$DateTime <- strptime(paste(hpc3$Date, hpc3$Time), "%d/%m/%Y %T")
hpc3$Sub_metering_1 <- as.numeric(hpc3$Sub_metering_1)
hpc3$Sub_metering_2 <- as.numeric(hpc3$Sub_metering_2)
hpc3$Sub_metering_3 <- as.numeric(hpc3$Sub_metering_3)

## Plot 1
png(filename = "plot1.png")
hist(hpc3$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()


## Plot 2
png(filename = "plot2.png")
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",
     ylab = "Global Active Ppwer (kilowatts)", xlab = "")
dev.off()

## Plot 3
png(filename = "plot3.png")
plot(hpc3$DateTime, hpc3$Sub_metering_1, 
     ylab="Engergy sub metering", xlab= "", type = "n")
points(hpc3$DateTime, hpc3$Sub_metering_1, type="l")
points(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")
points(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")
legend("topright", pch = "_", 
       col=c("black", "blue", "red"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       lwd=2)
dev.off()

## Plot 4
png(filename = "plot4.png")
par(mfrow=c(2,2), mar=c(5, 6, 2, 2))
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",ylab = "Global Active Ppwer (kilowatts)", xlab = "")
plot(hpc3$DateTime, hpc3$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
plot(hpc3$DateTime, hpc3$Sub_metering_1, ylab="Engergy sub metering", xlab= "", type = "n")
points(hpc3$DateTime, hpc3$Sub_metering_1, type="l")
points(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")
points(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")
legend("topright", pch = "_", col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2)
plot(hpc3$DateTime, hpc3$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
