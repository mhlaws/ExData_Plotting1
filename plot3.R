data <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
d <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

d$datetime <- strptime(paste(d$Date, d$Time),"%d/%m/%Y %T")
d$sub1 <-as.numeric(as.character(d$Sub_metering_1))
d$sub2 <-as.numeric(as.character(d$Sub_metering_2))
d$sub3 <-as.numeric(as.character(d$Sub_metering_3))

png("plot3.png", width = 480, height = 480)
plot(d$datetime, d$sub1, type='l', ylab = 'Energy sub metering', xlab = '')
lines(d$datetime, d$sub2, type='l', ylab = 'Energy sub metering', xlab = '', col = 'red')
lines(d$datetime, d$sub3, type='l', ylab = 'Energy sub metering', xlab = '', col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red', 'blue'), lty = 1)
dev.off()
