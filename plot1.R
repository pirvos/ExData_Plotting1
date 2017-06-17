## CEDSC4_P1
## Script to construct plot1 

## INPUT: file hosehold_power_consumtion.txt, from UC Irvine ML
## The script used the data for the two days: Feb, 1-2, 2007
## OUTPUT: file plot1.png
## Output contains the following exploratory graph out of the data set:  
##   Histogram for the frequency of different measurements of 
##   Golobal Active Power in 12 intervals in range 0..6.
##

## Read data and preprocess
hpc <- read.csv("household_power_consumption.txt", sep = ";", 
                header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$Global_active_power <- as.numeric(hpc3$Global_active_power)

## Plot 1
png(filename = "plot1.png")     ## open the device
hist(hpc3$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()  ## close the device
