#picture 2
#read the data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", skip = 66637, nrows = 2880)

#set names
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# transform the datetime
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"] , "2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"] , "2007-02-02 %H:%M:%S")

# create graph
plot(data$Time,as.numeric(as.character(data$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

# Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()