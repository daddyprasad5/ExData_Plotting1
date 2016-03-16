data<-read.table("household_power_consumption.txt",na.strings = "?", header=TRUE,sep=";")
newdata <- data[with(data, Date=="1/2/2007" | Date =="2/2/2007"),]
dateTimes <- paste(as.character(newdata$Date),as.character(newdata$Time))
newDateTimes <- strptime(dateTimes, "%e/%m/%Y %H:%M:%S")
newdata$DateTime<-newDateTimes

png(
        "plot1.png",
        width     = 480,
        height    = 480,
        units     = "px"
)
hist(newdata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()