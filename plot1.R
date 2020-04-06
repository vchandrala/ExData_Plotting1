library(dplyr)
# Read the data
power_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
# Subset the required data
subset <- power_data %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
# Histogram
hist(subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power \\(kilowatt\\)",
     ylab = "Frequency", col = "Red")
# Save the file as png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
