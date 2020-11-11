path <- file.path(getwd(), 'household_power_consumption.txt')
DT <- data.table::fread(path, na.strings = '?')

DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

## Plot 3

plot(x = DT[, dateTime], y = DT[, Sub_metering_1], type="l", xlab="", ylab="Energy Sub Metering")

lines(DT$dateTime, DT$Sub_metering_2, col='red')

lines(DT$dateTime, DT$Sub_metering_3, col='blue')

dev.off()
