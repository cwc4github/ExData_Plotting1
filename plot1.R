## Get all data
fileName <- "household_power_consumption.txt"
data_all <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subset the date
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

## Creating plot1.png
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.off()
