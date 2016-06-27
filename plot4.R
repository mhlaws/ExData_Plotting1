data <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
d <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# 1
d$datetime <- strptime(paste(d$Date, d$Time),"%d/%m/%Y %T")
d$gap <-as.numeric(as.character(d$Global_active_power))
plot(d$datetime, d$gap, type='l', ylab = 'Global Active Power', xlab = '')

# 2
d$volt <-as.numeric(as.character(d$Voltage))
plot(d$datetime, d$volt, type='l', ylab = 'Voltage', xlab = 'datetime')

# 3
d$sub1 <-as.numeric(as.character(d$Sub_metering_1))
d$sub2 <-as.numeric(as.character(d$Sub_metering_2))
d$sub3 <-as.numeric(as.character(d$Sub_metering_3))


plot(d$datetime, d$sub1, type='l', ylab = 'Energy sub metering', xlab = '')
lines(d$datetime, d$sub2, type='l', ylab = 'Energy sub metering', xlab = '', col = 'red')
lines(d$datetime, d$sub3, type='l', ylab = 'Energy sub metering', xlab = '', col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red', 'blue'), lty = 1)

# 4
d$grp <-as.numeric(as.character(d$Global_reactive_power))
plot(d$datetime, d$grp, type='l', ylab = 'Global_reactive_power', xlab = 'datetime')
dev.off()
