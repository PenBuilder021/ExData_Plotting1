##Exploratory Data Analysis Project 1 - Plot 2

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

#Create plot
globalActivePower <- as.numeric(subsetData$Global_active_power)
plot(datetime, globalActivePower, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Create png and save as "plot2.png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
