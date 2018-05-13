
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
epowerc <- read.csv(unz(temp, "household_power_consumption.txt"),sep=";", header=T )
unlink(temp)

print (class(epowerc$Date))

epowerc$Date <- as.Date(epowerc$Date , "%d/%m/%Y")

epowercFF <- subset(epowerc, Date >= "2007-02-01" & Date < "2007-02-03")

str(epowercFF)

epowercFF$Global_active_power <- as.numeric(as.character(epowercFF$Global_active_power))


png("plot1.png", width = 480, height = 480)
hist(epowercFF$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()