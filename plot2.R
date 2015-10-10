
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

# create plot 2
png("plot2.png", width = 480, height = 480)
plot(data_subset$Time, data_subset$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(data_subset$Time, data_subset$Global_active_power)
dev.off()