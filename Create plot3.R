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
## Task 3: line charts with the 3 kinds of sub-metering. Remove NAs.

any(is.na(electric.sub$Sub_metering_1))
levels(electric.sub$Sub_metering_1)
which(as.numeric(electric.sub$Sub_metering_1) == 1) ## no ? in this data subset for this variable

summary(as.numeric(paste(electric.sub$Sub_metering_1)))
Sub_metering_1_num <- as.numeric(paste(electric.sub$Sub_metering_1))
Sub_metering_2_num <- as.numeric(paste(electric.sub$Sub_metering_2))
Sub_metering_3_num <- as.numeric(paste(electric.sub$Sub_metering_3))

png(file = "C:/Users/nidilk/Desktop/Neli Dilkova/Programing/Coursera Exploratory Data Analysis 2019/plot3.png", 
    width = 480, height = 480)
plot(x = electric.sub$Time, y = Sub_metering_1_num, type = "l", ylab = "Energy sub metering", lwd = 0.2)
     lines(x = Sub_metering_2_num, type = "l", col = "blue")
     lines(x = Sub_metering_3_num, type = "l", col = "red")
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), inset = .02, lwd = 0.2)
dev.off()


     
     