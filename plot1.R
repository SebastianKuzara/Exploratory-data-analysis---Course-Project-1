# PLOT 1

##Read data set from working directory

DT <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
                 colClasses = c(rep("factor", 2), rep("numeric", 7)))

##Create sub data set with only rows for two specific dates

subDT <- subset(DT, DT$Date == "1/2/2007" | DT$Date == "2/2/2007")

## Create new variable contain date and time at one

subDT$datime <- with(subDT,  strptime(paste(Date, Time), format = "%d/%m/%Y %T"))

## Make histogram and save it as .png file 

png("plot1.png", width = 480, height = 480)
hist(subDT$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")
dev.off()
