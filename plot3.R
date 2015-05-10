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
png("plot3.png")
with(PowerConsumptionData, plot(Sub_metering_1, type="n", 
                                ylab="Energy sub metering",
                                xlab="", xaxt="n"))
with(PowerConsumptionData, lines(Sub_metering_1))
with(PowerConsumptionData, lines(Sub_metering_2, col="red"))
with(PowerConsumptionData, lines(Sub_metering_3, col="blue"))
axis(1, c(0,1440,2880), labels = c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1)
dev.off()