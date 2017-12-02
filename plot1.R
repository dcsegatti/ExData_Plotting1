###graph 1

datafile <- "household_power_consumption.txt"
data <- read.table (datafile, header = TRUE, sep = ";", na.strings = "?", 
                    colClasses = c('character', 'character', 'numeric', 'numeric',
                                   'numeric','numeric','numeric','numeric','numeric'))


dataSubset <- data[data$Date %in% c("1/2/2007" , "2/2/2007"),]

strptime(dataSubset$Date, format = "%d/%m/%Y")
strptime(dataSubset$Time, format = "%H:%M:%S")
datetime <- paste(dataSubset$Date, dataSubset$Time, sep = " ")

png("plot1.png", width = 480, height = 480)

hist(dataSubset$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")
dev.off()