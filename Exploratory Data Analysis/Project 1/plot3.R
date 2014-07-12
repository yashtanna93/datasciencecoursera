# Reading and extracting the required data
data <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), (Date == "1/2/2007" | Date == "2/2/2007"));

# Creating the plot
time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S");
plot( time, data$Sub_metering_1, pch='.', ylab="Energy sub metering", xlab="", col=c("black", "red", "blue"));
lines(time, data$Sub_metering_1, col="black");
lines(time, data$Sub_metering_2, col="red");
lines(time, data$Sub_metering_3, col="blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"));

# Saving the plot in a file
dev.copy(png, file="plot3.png", width=480, height= 480);
dev.off();