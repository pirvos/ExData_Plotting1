## CEDSC4_P1
## Script to construct plot4 

## INPUT: file hosehold_power_consumtion.txt, from UC Irvine ML
## The script used the data for the two days: Feb, 1-2, 2007
## OUTPUT: file plot4.png
## Output contains the following 4 exploratory graphs out of the data set: 
##   1. Global Active Power per time
##   2. Votage per time
##   3. Energy sub metering per time
##   4. Global Reactive Power per time
##

## Read data and preprocess
hpc <- read.csv("household_power_consumption.txt", sep = ";", 
                header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$DateTime <- strptime(paste(hpc3$Date, hpc3$Time), "%d/%m/%Y %T")
hpc3$Sub_metering_1 <- as.numeric(hpc3$Sub_metering_1)
hpc3$Sub_metering_2 <- as.numeric(hpc3$Sub_metering_2)
hpc3$Sub_metering_3 <- as.numeric(hpc3$Sub_metering_3)
hpc3$Global_active_power <- as.numeric(hpc3$Global_active_power)
hpc2$Global_reactive_power= as.numeric(hpc2$Global_reactive_power)

## Construct Plot 4
png(filename = "plot4.png")    ## open the device
par(mfrow=c(2,2), mar=c(5, 5, 2, 1))
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",
     ylab = "Global Active Ppwer (kilowatts)", xlab = "")
plot(hpc3$DateTime, hpc3$Voltage, type="l", ylab = "Voltage", 
     xlab = "datetime")
plot(hpc3$DateTime, hpc3$Sub_metering_1, ylab="Engergy sub metering", 
     xlab= "", type = "n")
points(hpc3$DateTime, hpc3$Sub_metering_1, type="l")
points(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")
points(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=2, bty="n",
       col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))
plot(hpc3$DateTime, hpc3$Global_reactive_power, type="l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()    ## close the device
