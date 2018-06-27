##Plot 1

#reading the dataset
data <- read.table("R datasets/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#formating date
date.format <- as.Date(strptime(data$Date, "%d/%m/%Y"))
hpower <- cbind(data, date.format)

#subseting for the first two days of February
day1 <- hpower[hpower$date.format == "2007-02-01", ]
day2 <- hpower[hpower$date.format == "2007-02-02", ]
hpower.subset <- rbind(day1, day2)

#Creating the plot
png(file = "plot1.png", width = 480, height = 480)
hist(hpower.subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = ("Global Active Power"))
title(main="Global Active Power")
dev.off()
