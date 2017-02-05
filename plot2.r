##Read the data
raw_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset the data for the 2 days to be analysed
day<-subset(raw_data,raw_data$Date %in% c("1/2/2007","2/2/2007"), select = c(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3))

#Delete the raw data
rm(raw_data)

#Extract date and time to generate datetime object
dt_time<-paste(day$Date, day$Time)

#Create plot
plot(strptime(dt_time, "%d/%m/%Y %H:%M:%S"),  as.numeric(day$Global_active_power)/1000, type="l", xlab="",ylab="Global Active Power(kilowatts)")

#Copy plot to file device
dev.copy(png, file="plot2.png")

#Close file device
dev.off()