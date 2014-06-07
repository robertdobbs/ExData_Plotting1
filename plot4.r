# load data
consumption.all <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
consumption.plot <- subset(x = consumption.all, subset = Date == "1/2/2007" | Date == "2/2/2007")

# write image file #4
png(filename = "plot4.png")
par(mfrow=c(2,2))

# 1

plot(x = consumption.plot[, 3], type = "l", xlab = "", xaxt = "n", ylab = "Global Active Power (kilowatts)", lwd = 0.1)
observations.count <- nrow(consumption.plot)
axis(side = 1, at = c(0, observations.count / 2, observations.count), labels = c ("Thu", "Fri", "Sat"))

# 2

plot(x = consumption.plot[, 5], type = "l", ylab = "Voltage", xaxt = "n", xlab = "datetime", lwd = 0.1)
axis(side = 1, at = c(0, observations.count / 2, observations.count), labels = c ("Thu", "Fri", "Sat"))

# 3

plot(x = consumption.plot[, 7], type = "l", xlab = "", xaxt = "n", ylab = "Energy sub metering", lwd = 0.1)
lines(x = consumption.plot[, 8], col = "red", lwd = 0.1)
lines(x = consumption.plot[, 9], col = "blue", lwd = 0.1)
axis(side = 1, at = c(0, observations.count / 2, observations.count), labels = c ("Thu", "Fri", "Sat"))
legend(x = "topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# 4

plot(x = consumption.plot[, 4], type = "l", xlab = "datetime", xaxt = "n", ylab = "Global_reactive_power", lwd = 0.1)
axis(side = 1, at = c(0, observations.count / 2, observations.count), labels = c ("Thu", "Fri", "Sat"))

dev.off()