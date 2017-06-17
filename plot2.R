## CEDSC4_P1
## Script to construct plot2 

## INPUT: file hosehold_power_consumtion.txt, from UC Irvine ML
## The script used the data for the two days: Feb, 1-2, 2007
## OUTPUT: file plot4.png
## Output contains the following exploratory graphs out of the data set: 
##   Global Active Power per time

## Read data and preprocess
hpc <- read.csv("household_power_consumption.txt", sep = ";", 
                header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$DateTime <- strptime(paste(hpc3$Date, hpc3$Time), "%d/%m/%Y %T")
hpc3$Global_active_power <- as.numeric(hpc3$Global_active_power)

## Plot 2
png(filename = "plot2.png")  ## open the device
plot(hpc3$DateTime, hpc3$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()  ## close the device
