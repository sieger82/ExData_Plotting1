# read the data from file
PowerConsumptionData <- read.table("household_power_consumption.txt", 
                                   header = TRUE, sep = ";", na.strings = "?",
                                   comment.char = "")
# only keep data for 1st and 2nd February 2007
PowerConsumptionData <- subset(PowerConsumptionData, Date == "1/2/2007" | Date == "2/2/2007")
# convert dates and times
PowerConsumptionData$Date <- strptime(PowerConsumptionData$Date, "%d/%m/%Y")
PowerConsumptionData$Time <- strptime(PowerConsumptionData$Time, "%H:%M:%S")

# make the plot
png("plot1.png")
hist(PowerConsumptionData$Global_active_power, breaks=16, main="Global Active Power",
     col="red", xlab="Global Active Power (kilowatts)")
dev.off()