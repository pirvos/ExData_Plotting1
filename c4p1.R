hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$DateTime <- strptime(paste(hpc3$Date, hpc3$Time), "%d/%m/%Y %T")
hpc3$Sub_metering_1 <- as.numeric(hpc3$Sub_metering_1)
hpc3$Sub_metering_2 <- as.numeric(hpc3$Sub_metering_2)
hpc3$Sub_metering_3 <- as.numeric(hpc3$Sub_metering_3)

## Still need to create the appropriate file devide on each 
## case; for the moment, just exploring...
## Need to adjust the y axis as well as include the 
## correct titles, labels, etc. 
hist(hpc3$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")


## First draft for plot 2
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",
     ylab = "Global Active Ppwer (kilowatts)", xlab = "")

## to begin with for plot 3
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

## to begin plot4
par(mfrow=c(2,2), mar=c(5, 6, 2, 2))
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",ylab = "Global Active Ppwer (kilowatts)", xlab = "")
plot(hpc3$DateTime, hpc3$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
plot(hpc3$DateTime, hpc3$Sub_metering_1, ylab="Engergy sub metering", xlab= "", type = "n")
points(hpc3$DateTime, hpc3$Sub_metering_1, type="l")
points(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")
points(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")
legend("topright", pch = "_", col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2)
plot(hpc3$DateTime, hpc3$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
