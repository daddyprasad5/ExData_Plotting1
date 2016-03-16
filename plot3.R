data<-read.table("household_power_consumption.txt",na.strings = "?", header=TRUE,sep=";")
newdata <- data[with(data, Date=="1/2/2007" | Date =="2/2/2007"),]
dateTimes <- paste(as.character(newdata$Date),as.character(newdata$Time))
newDateTimes <- strptime(dateTimes, "%e/%m/%Y %H:%M:%S")
newdata$DateTime<-newDateTimes


png(
        "plot3.png",
        width     = 480,
        height    = 480,
        units     = "px"
)
plot(
        newdata$DateTime,newdata$Sub_metering_1, type = "n", 
        xlab = "", ylab = "Energy sub metering"
)
lines(newdata$DateTime,newdata$Sub_metering_1,type="l", col="black")
lines(newdata$DateTime,newdata$Sub_metering_2,type="l", col="red")
lines(newdata$DateTime,newdata$Sub_metering_3,type="l", col="blue")
legend(
        "topright",legend=c("Sub_metering_1","Sub_metering_2", 
        "Sub_metering_3"), col=c("black","red","blue"), lty=1, lwd=1
)
dev.off()