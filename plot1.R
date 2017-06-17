hpc <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
hpc3 <- filter(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
hpc3$Global_active_power <- as.numeric(hpc3$Global_active_power)

## Plot 1
png(filename = "plot1.png")
hist(hpc3$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
