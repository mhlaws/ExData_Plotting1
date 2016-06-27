data <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE)
d <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

d$gap <-as.numeric(as.character(d$Global_active_power))

png("plot1.png", width = 480, height = 480)
hist(d$gap, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()
