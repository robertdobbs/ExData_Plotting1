# load data 
consumption.all <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
consumption.plot <- subset(x = consumption.all, subset = Date == "1/2/2007" | Date == "2/2/2007")

# write image file #2
png(filename = "plot2.png")
plot(x = consumption.plot[, 3], type = "l", xlab = "", xaxt = "n", ylab = "Global Active Power (kilowatts)")
observations.count <- nrow(consumption.plot)
axis(side = 1, at = c(0, observations.count / 2, observations.count), labels = c ("Thu", "Fri", "Sat"))
dev.off()