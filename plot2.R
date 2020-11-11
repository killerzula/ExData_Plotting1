path <- file.path(getwd(), 'household_power_consumption.txt')
DT <- data.table::fread(path, na.strings = '?')

DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
DT <- DT[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-02")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = DT[, dateTime]
     , y = DT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()