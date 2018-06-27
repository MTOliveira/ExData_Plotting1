## Plot 1

data <- read.table("R datasets/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
date.format <- as.Date(strptime(data$Date, "%d/%m/%Y"))
hpower <- cbind(data, date.format)
day1 <- hpower[hpower$date.format == "2007-02-01", ]
day2 <- hpower[hpower$date.format == "2007-02-02", ]
hpower.subset <- rbind(day1, day2)
hist(hpower.subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = ("Global Active Power"))
title(main="Global Active Power")
