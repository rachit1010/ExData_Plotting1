#Getting the data and subsetting it
library(dplyr)
library(lubridate)
data<-read.table("Course Project/household_power_consumption.txt",sep = ";",header = T,na.strings = c("?",""))
reqData<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
rm(data)

#Changing the Date column to POSIX format.
reqData$Date<-strptime(reqData$Date,format="%d/%m/%Y")

#Plotting Graph
with(reqData,hist(reqData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()