# Load data
source('Load Data.R')

# Open png device
png(filename='./data/plot1.png')

# Make plot
hist(filtered_data$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()