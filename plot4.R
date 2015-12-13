## Get all data
fileName <- "household_power_consumption.txt"
data_all <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subset the date
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## Creating plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2)) 
plot(data$Global_active_power~data$DateTime, type = "l",
     ylab = "Global Active Power", xlab = "")
plot(data$Voltage~data$DateTime, type = "l",
     ylab = "Voltage", xlab = "datetime")
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering",
     xlab = "", col = "black", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(data$Global_reactive_power~data$DateTime, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()