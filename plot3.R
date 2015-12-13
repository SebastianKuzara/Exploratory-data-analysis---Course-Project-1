# PLOT 3

##Read data set from working directory

DT <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                 colClasses = c(rep("factor", 2), rep("numeric", 7)))

##Create sub data set with only rows for two specific dates

subDT <- subset(DT, DT$Date == "1/2/2007" | DT$Date == "2/2/2007")

## Create new variable contain date and time at one

subDT$datime <- with(subDT,  strptime(paste(Date, Time), format = "%d/%m/%Y %T"))

## Make a plot and save it as png file

png("plot3.png", width = 480, height = 480)
with(subDT,{ 
     plot(datime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )
     lines(datime, Sub_metering_1)
     lines(datime, Sub_metering_2, col = "red")
     lines(datime, Sub_metering_3, col = "blue")
     legend("topright", legend = colnames(subDT[7:9]), col = c("black", "red", "blue"), lty = 1)
  })
dev.off()
