# PLOT 4

##Read data set from working directory

DT <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                 colClasses = c(rep("factor", 2), rep("numeric", 7)))

##Create sub data set with only rows for two specific dates

subDT <- subset(DT, DT$Date == "1/2/2007" | DT$Date == "2/2/2007")

## Create new variable contain date and time at one

subDT$datime <- with(subDT,  strptime(paste(Date, Time), format = "%d/%m/%Y %T"))

## Make a plots and save it as png file

png("plot4.png", width = 480, height = 480)

  ### define parameter for numbers of plots in graphic device
par(mfrow = c(2,2))

with(subDT, {
  ### 1st plot
  plot(datime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  ### 2nd plot
  plot(datime, Voltage, type = "l", xlab = "datatime", ylab = "Voltage")
  
  ### 3rd plot
  {
  plot(datime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )
  lines(datime, Sub_metering_1)
  lines(datime, Sub_metering_2, col = "red")
  lines(datime, Sub_metering_3, col = "blue")
  # , lty = 1, box.lwd = "n", cex = 1, y.intersp = 0.5, yjust = 0
  legend("topright", legend = colnames(subDT[7:9]), col = c("black", "red", "blue"), lwd = 2,  bty = "n")
  }
  
  4th plot
  plot(datime, Global_reactive_power, type = "l", xlab = "datatime")
})

dev.off()
