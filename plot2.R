## Load data and transform in dataframe
data <- read.table("household_power_consumption.txt", sep = ";", skip = 1, na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data1 <- data.frame(data)

## Convert Date and Time variables, and add a new variable to the dataframe
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
DateTime <- paste(data1$Date, data1$Time)
data1 <- data.frame(data1, DateTime)
data1$DateTime <- strptime(data1$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Plot the graph
plot(subset(data1, Date >= "2007-02-01" & Date <= "2007-02-02")$DateTime, subset(data1, Date >= "2007-02-01" & Date <= "2007-02-02")$Global_active_power, type = "l", ylab ="Global Active Power (kilowatts)", xlab = "" )

## Save in PNG file
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()