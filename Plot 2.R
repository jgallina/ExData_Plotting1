# Load data
source('scripts/load-power-data.R')

# Open png device
png(filename='./data/plot2.png')

# Make plot
plot(filtered_data$Global_active_power, main='Global Active Power', 
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()