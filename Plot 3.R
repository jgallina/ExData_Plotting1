# Load data
source('scripts/load-power-data.R')

# Open png device
png(filename='./data/plot3.png')

# Make plot
plot(filtered_data$date.time, filtered_data$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(filtered_data$date.time, filtered_data$Sub_metering_2, col='red')
lines(filtered_data$date.time, filtered_data$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()