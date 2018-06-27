## Plot 4 
data <- (read.table("R datasets/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
day1 <- data[data$Date == "2007-02-01", ]
day2 <- data[data$Date == "2007-02-02", ]
hpower <- rbind(day1, day2)
hpower$Time <- strptime(hpower$Time, format="%H:%M:%S")
hpower[1:1440,"Time"] <- format(hpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hpower[1441:2880,"Time"] <- format(hpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#setting the grid structure
par(mfrow = c(2,2))
#plot1
plot(hpower$Time, as.numeric(as.character(hpower$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
#plot2
plot(hpower$Time, as.numeric(as.character(hpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
#plot3
plot(hpower$Time, hpower$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpower$Time, hpower$Sub_metering_2, type = "l", col="red")
lines(hpower$Time, hpower$Sub_metering_3, type = "l", col="blue")
legend("topright", lty =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
#plot4
plot(hpower$Time, as.numeric(as.character(hpower$Global_reactive_power)), type="l",xlab="datetime",ylab="Global_reactive_power")