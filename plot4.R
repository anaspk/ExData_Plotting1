download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl", destfile="household_power_consumption.zip")

unzip("household_power_consumption.zip")
pcdata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

pcdata <- pcdata[pcdata$Date == "1/2/2007" | pcdata$Date == "2/2/2007",]

pcdata$Time <- paste(pcdata$Date, pcdata$Time)
pcdata$Date <- as.Date(pcdata$Date, format = "%d/%m/%Y")
pcdata$Time <- strptime(pcdata$Time, format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png")

par(mfcol=c(2,2))

plot(pcdata$Time, pcdata$Global_active_power, type="l", ylab="Global Active Power", xlab="", main="")

plot(pcdata$Time, pcdata$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="", main="")
points(pcdata$Time, pcdata$Sub_metering_2, col="red", type="l")
points(pcdata$Time, pcdata$Sub_metering_3, col="blue", type="l")
legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), seg.len=2, lwd=1, bty="n")

plot(pcdata$Time, pcdata$Voltage, type="l", ylab="Voltage", xlab="datetime", main="")

plot(pcdata$Time, pcdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", main="")

dev.off()
