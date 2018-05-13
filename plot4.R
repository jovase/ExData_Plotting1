
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
epowerc <- read.csv(unz(temp, "household_power_consumption.txt"),sep=";", header=T )
unlink(temp)

print (class(epowerc$Date))

epowerc$Date <- as.Date(epowerc$Date , "%d/%m/%Y")

epowercFF <- subset(epowerc, Date >= "2007-02-01" & Date < "2007-02-03")

str(epowercFF)

epowercFF$Global_active_power <- as.numeric(as.character(epowercFF$Global_active_power))
epowercFF$Dt <- as.POSIXct(paste(epowercFF$Date, epowercFF$Time), format="%Y-%m-%d %H:%M:%S")
epowercFF$Sub_metering_1 <- as.numeric(as.character(epowercFF$Sub_metering_1))
epowercFF$Sub_metering_2 <- as.numeric(as.character(epowercFF$Sub_metering_2))
epowercFF$Sub_metering_3 <- as.numeric(as.character(epowercFF$Sub_metering_3))

epowercFF$Global_reactive_power <- as.numeric(as.character(epowercFF$Global_reactive_power))
epowercFF$Voltage <- as.numeric(as.character(epowercFF$Voltage))

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))
plot(epowercFF$Dt,epowercFF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(epowercFF$Dt,epowercFF$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(epowercFF$Dt,epowercFF$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(epowercFF$Dt,epowercFF$Sub_metering_2, type="l", col="red")
lines(epowercFF$Dt,epowercFF$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=c(1,1,1),bty = "n")
plot(epowercFF$Dt,epowercFF$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
