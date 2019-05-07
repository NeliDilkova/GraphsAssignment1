######
# Code for reading in and reducing the electric power consumption datas
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
## Task 4: two plots next to wach other
Global_reactive_power <- as.numeric(as.character(electric.sub$Global_reactive_power))   
Voltage_num <- as.numeric(as.character(electric.sub$Voltage))     

png(file = "C:/Users/nidilk/Desktop/Neli Dilkova/Programing/Coursera Exploratory Data Analysis 2019/plot4.png", 
    width = 480, height = 480)     
par(mfrow = c(2,2))     
plot(x = electric.sub$Time, y = Global_active_power,  ylab = "Global Active Power (kilowatts)")
plot(x = electric.sub$Time, y = Voltage_num,  ylab = "Voltage", xlab = "datetime")
plot(x = electric.sub$Time, y = Sub_metering_1_num, type = "l", ylab = "Energy sub metering", lwd = 0.2)
lines(x = Sub_metering_2_num, type = "l", col = "blue")
lines(x = Sub_metering_3_num, type = "l", col = "red")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), inset = .02, lwd = 0.2, box.lty=0)
plot(x = electric.sub$Time, y = Global_reactive_power,  ylab = "Global Reactive Power", xlab = "datetime")
dev.off()
   
     
     