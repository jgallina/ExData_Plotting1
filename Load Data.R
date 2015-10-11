#Clear workspace to free up available RAM 
rm(list = ls())

#The libraries we will use to clean the data are called "data.table" and "dplr" and "lubridate"
#Check if these packages are installed, if not, install required packages 
list.of.packages <- c("dplyr", "data.table","lubridate")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages)}
#Load the packages 
library(dplyr)
library(data.table)
library(lubridate)

        
#Create in working directory a folder "data" to store files in 
if(!file.exists("./data/filtered_data.rds")) {
        
        #Create in working directory a folder "data" to store files in 
        if(!file.exists("data")) {
                dir.create("data")
        }
        
        #Download the files into the data folder that we've just created. 
        # download.file >> Method = "curl" required when working with mac and https. 
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile= "./data/rawdata.zip", method = "curl")
        list.files("./data")
        dateDownloaded <- date()
        dateDownloaded
        unzip("./data/rawdata.zip", exdir= "./data") 
        
        #read data into R working memory
        data <- read.table('./data/household_power_consumption.txt', header = TRUE, sep= ';', na.strings = '?', 
                           colClasses=c(rep('character',2),rep('numeric',7)))
        
        #view the structure of the data 
        str(data)
      
        # Convert dates and times
        data$Date <- dmy(data$Date)
        data$Time <- hms(data$Time)
        
        # Combine date and time
        data$date.time <- data$Date + data$Time
        
        # Filer data frame to required data range (this could also be done with subset function) 
        start <- ymd('2007-02-01')
        end <- ymd('2007-02-02')
        filtered_data <- subset(data, year(Date) == 2007 & month(Date)==2 & (day(Date)==1 | day(Date)== 2))
        #filtered_data <- filter(data, year(Date) == 2007, month(Date)==2, day(Date)==1 | day(Date)== 2)
            
        # Save file
        saveRDS(filtered_data, file='./data/filtered_data.rds')
        } else {  filtered_data <- readRDS('./data/filtered_data.rds')
}
