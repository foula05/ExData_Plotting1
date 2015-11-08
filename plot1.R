# load, transform data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$dtm = paste(household_power_consumption$Date, household_power_consumption$Time, sep = " ")
d1 <- transform(household_power_consumption, dtm = strptime(dtm, format = "%d/%m/%Y %H:%M:%S"))
dt <- subset(d1, dtm >= as.POSIXlt("2007-02-01 00:00:00") & dtm <= as.POSIXlt("2007-02-02 23:59:00"))

# produce plot
png(file = "plot1.png")

hist(c(dt$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

dev.off()