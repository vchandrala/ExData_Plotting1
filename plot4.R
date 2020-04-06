library(dplyr)
# Read the data
power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
# Subset the required data
subset <- power_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
# Plot the graph 
par(mfrow = c(2, 2))
plot(Global_active_power ~ datetime, type = "l", xlab = "", ylab = "Global Active Power")
plot(Voltage ~ datetime, type = "l", ylab = "Voltage")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, type = "l", col = "Red")
lines(Sub_metering_3 ~ datetime, type = "l", col = "Blue")
legend("topright", lty = 1, cex = 0.6, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ datetime, type = "l", ylab = "Global_reactive_power")
# Save the file as png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
