## CEDSC4_P1
## Script to construct plot3 

## INPUT: file hosehold_power_consumtion.txt, from UC Irvine ML
## The script used the data for the two days: Feb, 1-2, 2007
## OUTPUT: file plot3.png
## Output contains the following exploratory graph out of the data set: 
##       Energy sub metering per time

##Read data and preprocess
hpc <- read.csv("household_power_consumption.txt", sep = ";", 
                header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$DateTime <- strptime(paste(hpc3$Date, hpc3$Time), "%d/%m/%Y %T")
hpc3$Sub_metering_1 <- as.numeric(hpc3$Sub_metering_1)
hpc3$Sub_metering_2 <- as.numeric(hpc3$Sub_metering_2)
hpc3$Sub_metering_3 <- as.numeric(hpc3$Sub_metering_3)

## Plot 3
png(filename = "plot3.png")  ## open the device
plot(hpc3$DateTime, hpc3$Sub_metering_1, 
     ylab="Engergy sub metering", xlab= "", type = "n")
points(hpc3$DateTime, hpc3$Sub_metering_1, type="l")
points(hpc3$DateTime, hpc3$Sub_metering_2, type="l", col="red")
points(hpc3$DateTime, hpc3$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=2, 
       col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))

dev.off()    ## close the device
