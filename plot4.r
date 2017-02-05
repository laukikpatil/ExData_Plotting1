##Read the data
raw_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset the data for the 2 days to be analysed
day<-subset(raw_data,raw_data$Date %in% c("1/2/2007","2/2/2007"), select = c(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3))

#Delete the raw data
rm(raw_data)

#Extract date and time to generate datetime object
dt_time<-paste(day$Date, day$Time)

#Set canvas as 2 by 2 matrix
par(mfrow=c(2,2))

#Plot the graphs
plot(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Global_active_power)/1000, type="l", xlab="",ylab="Global Active Power")
plot(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Voltage), type="l", xlab="",ylab="Voltage")
plot(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Sub_metering_1), type="l", xlab="",ylab="Energy sub metering")
lines(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Sub_metering_2), col="Red")
lines(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Sub_metering_3), col="Blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
plot(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Global_reactive_power), type="l", xlab="",ylab="Global Reactive power")

#Copy the plot to file device
dev.copy(png, file="plot4.png")

#Close file device
dev.off()

#Reset the canvas
par(mfrow=c(1,1))