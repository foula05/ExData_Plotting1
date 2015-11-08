# load, transform data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$dtm = paste(household_power_consumption$Date, household_power_consumption$Time, sep = " ")
d1 <- transform(household_power_consumption, dtm = strptime(dtm, format = "%d/%m/%Y %H:%M:%S"))
dt <- subset(d1, dtm >= as.POSIXlt("2007-02-01 00:00:00") & dtm <= as.POSIXlt("2007-02-02 23:59:00"))

# produce plot
png(file = "plot3.png")

with(dt, plot(dtm, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))

lines(dt$dtm, dt$Sub_metering_2, type = "l", col = "red")

lines(dt$dtm, dt$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), col=c("black", "red","blue"))

dev.off()