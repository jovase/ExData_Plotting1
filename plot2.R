
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

png("plot2.png", width = 480, height = 480)
plot(epowercFF$Dt,epowercFF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
