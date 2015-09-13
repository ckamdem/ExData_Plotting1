## Load data and transform in dataframe
data <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data1 <- data.frame(data)

## Convert Date and Time variables
library(chron)
data1$Time <- chron(times = data1$Time)
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

## Plot the histogram
hist(subset(data1, Date >= "2007-02-01" & Date <= "2007-02-02")$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)" )

## Save in PNG file
dev.copy(png, "/media/ck/Multimedia/Coursera_DAtaScience/Project1ExpData/plot1.png", width = 480, height = 480)
dev.off()