## Plot3 

#read the dataset
data <- (read.table("R datasets/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"))

#formating date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subseting for the first two days of February
day1 <- data[data$Date == "2007-02-01", ]
day2 <- data[data$Date == "2007-02-02", ]
hpower <- rbind(day1, day2)

#formating time
hpower$Time <- strptime(hpower$Time, format="%H:%M:%S")
hpower[1:1440,"Time"] <- format(hpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
hpower[1441:2880,"Time"] <- format(hpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Creating the plot
png(file = "plot3.png", width = 480, height = 480)
plot(hpower$Time, hpower$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpower$Time, hpower$Sub_metering_2, type = "l", col="red")
lines(hpower$Time, hpower$Sub_metering_3, type = "l", col="blue")
legend("topright", lty =1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
