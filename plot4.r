# Download the Electric Power Consumption dataset from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Extract the data file to the working directory and set the working directory if needed

# Set working directory
setwd("D:/rWork/Exploratory Analysis/Week1 Assignment/ExData_Plotting1")

# Read the data from file
con<-file("household_power_consumption.txt")
open(con)
energydata <- read.table(con,
     skip=66637,
     nrow=2880,
     stringsAsFactors=FALSE,
     sep=";",
     dec=".",
     na.strings = "?",
     col.names = c("Date",
                   "Time",
                   "Global_active_power",
                   "Global_reactive_power",
                   "Voltage",
                   "Global_intensity",
                   "Sub_metering_1",
                   "Sub_metering_2",
                   "Sub_metering_3")) # Lines 66638 to 69517 for dates 2007-02-01 and 2007-02-02
close(con)

# Converting date and time format on timestamp
energydata$Timestamp <- strptime(paste(energydata$Date, energydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Change variable type
energydata$Global_active_power <- as.numeric(energydata$Global_active_power)
energydata$Voltage <- as.numeric(energydata$Voltage)
energydata$Sub_metering_1 <- as.numeric(energydata$Sub_metering_1)
energydata$Sub_metering_2 <- as.numeric(energydata$Sub_metering_2)
energydata$Sub_metering_3 <- as.numeric(energydata$Sub_metering_3)

# Create first plot of data
par(mfcol=c(2,2), mar=c(4,4,1,1), oma=c(0,0,0,0))

# Plot graph
plot(energydata$Timestamp, 
     energydata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Add second graph
plot(energydata$Timestamp, 
     energydata$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(energydata$Timestamp, 
      energydata$Sub_metering_2,
      type="l",
      col="red")
lines(energydata$Timestamp, 
      energydata$Sub_metering_3,
      type="l",
      col="blue")

# Key to plot
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), 
       cex=.8,
       bty="n",
       lty = 1)

# Add third graph
plot(energydata$Timestamp, 
     energydata$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# Add fourth graph
plot(energydata$Timestamp, 
     energydata$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


# Copy graph to PNG file
dev.copy(png, 
     file="plot4.png", 
     height=500, 
     width=500)
dev.off()
