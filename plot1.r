# load data
consumption.all <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
consumption.plot <- subset(x = consumption.all, subset = Date == "1/2/2007" | Date == "2/2/2007")

# write image file #1
png(filename = "plot1.png")
hist(x = consumption.plot[, 3], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "orangered")
dev.off()