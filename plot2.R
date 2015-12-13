## Get all data
fileName <- "household_power_consumption.txt"
data_all <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subset the date
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## Creating plot2.png
png("plot2.png", width =480, height = 480)
plot(data$Global_active_power~data$DateTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
