##Exploratory Data Analysis Project 1 - Plot 1

#Get the full dataset
fullData <- read.csv("./Wk1Data/household_power_consumption.txt", header = TRUE,
                     sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset the data so only "2/1/2007" & "2/2/2007" are included.
dateData <- as.Date(fullData$Date, format = "%d/%m/%Y")
subsetData <- fullData[dateData == "2007-02-01" | dateData == "2007-02-02", ]

rm(fullData)

#Convert Dates
datetime <- paste(subsetData$Date, subsetData$Time, sep = " ")
subsetData$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Create histogram (use as.numeric on global_Active_Power)
globalActivePower <- as.numeric(subsetData$Global_active_power)
hist(globalActivePower, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

#Create png and save as "plot1.png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
