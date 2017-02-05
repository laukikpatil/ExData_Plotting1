##Read the data
raw_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Subset the data for the 2 days to be analysed
day<-subset(raw_data,raw_data$Date %in% c("1/2/2007","2/2/2007"), select = c(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3))

#Delete the raw data
rm(raw_data)

#Plot the histyogram on screen
with(day, hist(as.numeric(Global_active_power), col="Red", xlab="Global Active Power(kilowatts)", main="Global Active Power"))

#Copy the histogram to png file
dev.copy(png, file="plot1.png")

#Turn off the file device
dev.off()