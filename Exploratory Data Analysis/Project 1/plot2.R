# Reading and extracting the required data
data <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), (Date == "1/2/2007" | Date == "2/2/2007"));

# Creating the plot
plot(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"), data$Global_active_power, type= "l", ylab= "Global Active Power (kilowatts)", xlab="");

# Saving the plot in a file
dev.copy(png, file="plot2.png", width=480, height= 480);
dev.off();