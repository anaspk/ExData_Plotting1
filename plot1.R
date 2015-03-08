download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl", destfile="household_power_consumption.zip")

unzip("household_power_consumption.zip")
pcdata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

pcdata <- pcdata[pcdata$Date == "1/2/2007" | pcdata$Date == "2/2/2007",]

pcdata$Date <- as.Date(pcdata$Date, format = "%d/%m/%Y")
pcdata$Time <- strptime(pcdata$Time, format="%H:%M:%S")

png(file="plot1.png")
hist(pcdata$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
