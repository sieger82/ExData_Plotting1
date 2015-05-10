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
png("plot2.png")
with(PowerConsumptionData, plot(Global_active_power, type="n", 
                                ylab="Global Active Power (kilowatts)",
                                xlab="", xaxt="n"))
with(PowerConsumptionData, lines(Global_active_power))
axis(1, c(0,1440,2880), labels = c("Thu","Fri","Sat"))
dev.off()