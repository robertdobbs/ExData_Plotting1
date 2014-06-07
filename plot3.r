# load data
consumption.all <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
consumption.plot <- subset(x = consumption.all, subset = Date == "1/2/2007" | Date == "2/2/2007")

# write image file #3
png(filename = "plot3.png")
plot(x = consumption.plot[, 7], type = "l", xlab = "", xaxt = "n", ylab = "Energy sub metering")
lines(x = consumption.plot[, 8], col = "red")
lines(x = consumption.plot[, 9], col = "blue")
observations.count <- nrow(consumption.plot)
axis(side = 1, at = c(0, observations.count / 2, observations.count), labels = c ("Thu", "Fri", "Sat"))
legend(x = "topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()