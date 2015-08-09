#download the electricity data from this link:
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#and save to here: ./coursera/EDA

#load data
setwd("./coursera/EDA")
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

#initialise the folder for working
setwd("./ExData_Plotting1/MJ_assignment")

#reformat the date column as proper date
str(data)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

#subset the data
explore<-data[data$Date < "2007-02-03" & data$Date >= "2007-02-01", ]

explore$myDate<-as.POSIXlt(paste(explore$Date, explore$Time, sep=" "))

#plot 1
dev.copy(png,'plot1.png')
hist(explore$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

#plot 2
dev.copy(png,'plot2.png')
plot(explore$myDate, explore$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()

#plot 3
dev.copy(png,'plot3.png')
plot(explore$myDate,  explore$Sub_metering_1,type = "l", ylab = "Energy Sub Meeting",xlab="")
lines(explore$myDate, explore$Sub_metering_2,type = "l", col="red")
lines(explore$myDate, explore$Sub_metering_3,type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1,col=c("black","red","blue"))
dev.off()

#plot 4

dev.copy(png,'plot4.png')
par(mfrow=c(2,2))
plot(explore$myDate, explore$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)", xlab = "")
plot(explore$myDate, explore$Voltage ,type = "l",ylab="Voltage", xlab = "datetime")
plot(explore$myDate,  explore$Sub_metering_1,type = "l", ylab = "Energy Sub Meeting",xlab="")
lines(explore$myDate, explore$Sub_metering_2,type = "l", col="red")
lines(explore$myDate, explore$Sub_metering_3,type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1,col=c("black","red","blue"))
plot(explore$myDate, explore$Global_reactive_power,type = "l",ylab="Global_reactive_power", xlab = "datetime")
par(mfrow=c(1,1))
dev.off()