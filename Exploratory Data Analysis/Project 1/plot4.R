# Reading and extracting the required data
sub <- subset(read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?"), (Date == "1/2/2007" | Date == "2/2/2007"));

# Changing the class of Date variable from character to Date: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

#Plotting and saving the plot
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # adding plots in col-wised manner.
plot(sub$DateTime, sub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") # Adding the first plot.
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) # The end of adding the second plot.
plot(sub$DateTime, sub$Voltage, type="l", xlab="datetime", ylab="Voltage")   # Adding the third plot.
plot(sub$DateTime, sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  # Adding the forth plot.
dev.off()