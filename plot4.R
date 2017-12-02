###graph 4

dataFile <- "household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMet1 <- as.numeric(dataSubset$Sub_metering_1)
subMet2 <- as.numeric(dataSubset$Sub_metering_2)
subMet3 <- as.numeric(dataSubset$Sub_metering_3)

volt <- as.numeric(dataSubset$Voltage)
globalReactPower <- as.numeric(dataSubset$Global_reactive_power)
globalActPower <- as.numeric(dataSubset$Global_active_power)




png("plot4.png" , height = 480 , width = 480 )
### plot 4 graphs in one window
par(mfrow = c(2,2))

#1
plot(datetime, globalActPower, type="l", xlab="", ylab="Global Active Power")

#2 top row
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

#3 bottom row (left)
plot(datetime,subMet1, type = "l" , xlab = "", ylab = "Energy sub metering")
lines(datetime, subMet2, type = "l", col = "red")
lines(datetime, subMet3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3") , 
       col = c("black", "red", "blue") , lty = 1, lwd = 2)


#4 bottom row (right)
plot(datetime, globalReactPower, type = "l" , xlab = "datetime" , ylab = "Global_reactive_power")


dev.off()





