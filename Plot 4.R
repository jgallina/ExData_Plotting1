# Load data
source('scripts/load-power-data.R')

# Open png device
png(filename='./data/plot4.png')

## Make plots
par(mfrow=c(2,2))

# Top left
plot(filtered_data$date.time, filtered_data$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(filtered_data$date.time, filtered_data$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(filtered_data$date.time, filtered_data$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(filtered_data$date.time, filtered_data$Sub_metering_2, col='red')
lines(filtered_data$date.time, filtered_data$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Bottom right
plot(filtered_data$date.time, filtered_data$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off device
dev.off()