library(dplyr)
# Read the data
power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
# Subsetthe required data
subset <- power_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
subset <- subset %>% mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S")))
# Plot the graph
plot(Global_active_power ~ datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
# Save the file as png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
