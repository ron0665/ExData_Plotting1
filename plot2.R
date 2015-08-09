## Getting full dataset
data_full <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data, plot(Datetime,Global_active_power, 
    type = "l", ylab="Global Active Power (kilowatts)",xlab=""))

##Copy plot2 to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()