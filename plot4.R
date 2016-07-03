##Exploratory Data Analysis Project 1 - Plot 4

#Get the full dataset
fullData <- read.csv("./Wk1Data/household_power_consumption.txt", header = TRUE,
                     sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset the data so only "2/1/2007" & "2/2/2007" are included.
dateData <- as.Date(fullData$Date, format = "%d/%m/%Y")
subsetData <- fullData[dateData == "2007-02-01" | dateData == "2007-02-02", ]

rm(fullData)

#Convert Dates
datetime <- paste(subsetData$Date, subsetData$Time, sep = " ")
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Create plots
par(mfrow = c(2,2)) #sets a 2x2 grid for graphics to be displayed

#Top-left
globalActivePower <- as.numeric(subsetData$Global_active_power)
plot(datetime, globalActivePower, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Top-right
plot(datetime, subsetData$Voltage, type = "l",
     xlab = "datetime", ylab = "Volatage")

#Bottom-left
with(subsetData, {
  plot(datetime, Sub_metering_1, type = "l",
       xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd =2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Bottom-right
plot(datetime, subsetData$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

#Create png and save as "plot4.png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()