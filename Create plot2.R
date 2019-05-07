######
# 
# Author: Neli Dilkova-Gnoyke
# April 17th 2019
#####

library(dplyr)

# read in original data
electric <- read.table("C:/Users/nidilk/Desktop/Neli Dilkova/Programing/Coursera Exploratory Data Analysis 2019/exdata_data_household_power_consumption/household_power_consumption.txt", header = T, 
                       sep = ";", dec = ".", na.strings = "NA")
# check if data was read in correctly
head(electric) # has the right dimensions. OK
summary(electric) #variables are factors

# check how to address missings
any(is.na(electric$Global_reactive_power)) # returns FALSE due to the factor coding. We need numeric values

# recode dates to date format
# electric$Date <- as.Date(electric$Date)
summary(electric$Date)

# reduce dataset to relevant dates before proceding.
electric.sub <- electric[c(which(electric$Date =="1/2/2007"), which(electric$Date =="2/2/2007")),]


#############
## Task 2: time series of global active power
png(file = "C:/Users/nidilk/Desktop/Neli Dilkova/Programing/Coursera Exploratory Data Analysis 2019/plot2.png", 
    width = 480, height = 480)
plot(x = electric.sub$Time, y = Global_active_power, type = "l", ylab = "Global active power (kilowatts)", lwd = 0.2)
dev.off()

