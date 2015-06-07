#Getting the data and subsetting it
library(dplyr)
library(lubridate)
data<-read.table("Course Project/household_power_consumption.txt",sep = ";",header = T,na.strings = c("?",""))
reqData<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
rm(data)

#Changing the Date and Time columns in POSIX format. 
reqData$Date<-strptime(reqData$Date,format="%d/%m/%Y")
datetime<-as.POSIXct(paste(reqData$Date,reqData$Time))

#Plotting Graph
plot(reqData$Global_active_power~datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()