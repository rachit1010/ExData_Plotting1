#Getting the data and subsetting it
library(dplyr)
library(lubridate)
data<-read.table("Course Project/household_power_consumption.txt",sep = ";",header = T,na.strings = c("?",""))
reqData<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")
rm(data)

#Changing the Date and Time columns in POSIX format. 
reqData$Date<-strptime(reqData$Date,format="%d/%m/%Y")
datetime<-as.POSIXct(paste(reqData$Date,reqData$Time))

#Getting submetering parameters as separate subsets
subMtr1 <- as.numeric(reqData$Sub_metering_1)
subMtr2 <- as.numeric(reqData$Sub_metering_2)
subMtr3 <- as.numeric(reqData$Sub_metering_3)

#Plotting
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
#1
plot(reqData$Global_active_power~datetime,type="l",ylab="Global Active Power", xlab="")
#2
plot(datetime,reqData$Voltage,xlab="datetime",ylab="voltage",type="l")
#3
plot(datetime, subMtr1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMtr2, type="l", col="red")
lines(datetime, subMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#4
plot(datetime,reqData$Global_reactive_power,ylab="Global_Reactive_Power",type="l")
dev.off()
