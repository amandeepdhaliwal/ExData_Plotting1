
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

# create plot 1
png("plot1.png", width = 480, height = 480)
hist(data_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()