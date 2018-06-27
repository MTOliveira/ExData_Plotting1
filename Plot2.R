## Plot2

#reading the dataset
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
png(file = "plot2.png", width = 480, height = 480)
plot(hpower$Time, as.numeric(as.character(hpower$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

