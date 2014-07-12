# Reading and extracting the required data
data <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), (Date == "1/2/2007" | Date == "2/2/2007"));

# Creating the histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red" );

# Saving the histogram in a file
dev.copy(png, file="plot1.png", width=480, height= 480);
dev.off();