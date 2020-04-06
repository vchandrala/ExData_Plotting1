library(dplyr)
# Read the data
power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
# Subset the required data
subset <- power_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
# Plot the graph with leged
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, type = "l", col = "Red")
lines(Sub_metering_3 ~ datetime, type = "l", col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Save the file as png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

