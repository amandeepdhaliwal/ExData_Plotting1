
setwd("~/GitHub/ExData_Plotting1")

# read in household consumption data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# handle date and time formats
data$Date <- as.Date(data$Date, "%d/%m/%Y")

date_plus_times <- paste(data$Date, data$Time)
data$Time <- strptime(date_plus_times, format = "%Y-%m-%d %H:%M:%S")

# check structure
#str(data)

# subset data
temp1 <- subset(data, Date >= "2007-02-01")
data_subset <- subset(temp1, Date <= "2007-02-02")

# create plot 4
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
plot(data_subset$Time, data_subset$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data_subset$Time, data_subset$Global_active_power)

plot(data_subset$Time, data_subset$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
lines(data_subset$Time, data_subset$Voltage)

plot(data_subset$Time, data_subset$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data_subset$Time, data_subset$Sub_metering_1)
lines(data_subset$Time, data_subset$Sub_metering_2, col = "red")
lines(data_subset$Time, data_subset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

plot(data_subset$Time, data_subset$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(data_subset$Time, data_subset$Global_reactive_power)

dev.off()