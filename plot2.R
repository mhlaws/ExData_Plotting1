data <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
d <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

d$datetime <- strptime(paste(d$Date, d$Time),"%d/%m/%Y %T")
d$gap <-as.numeric(as.character(d$Global_active_power))

png("plot2.png", width = 480, height = 480)
plot(d$datetime, d$gap, type='l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()
