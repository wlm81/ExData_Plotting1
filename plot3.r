# Set working directory
setwd("D:/rWork/Explorartory Analysis/Week1 Assignment/ExData_Plotting1")

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
energydata$Sub_metering_1 <- as.numeric(energydata$Sub_metering_1)
energydata$Sub_metering_2 <- as.numeric(energydata$Sub_metering_2)
energydata$Sub_metering_3 <- as.numeric(energydata$Sub_metering_3)

# Create first plot of data
par(mfcol=c(1,1))
plot(energydata$Timestamp, 
     energydata$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")

# Add second plot to graph
lines(energydata$Timestamp, 
      energydata$Sub_metering_2,
      type="l",
      col="red")

# Add third plot to graph
lines(energydata$Timestamp, 
      energydata$Sub_metering_3,
      type="l",
      col="blue")

# Key to plot
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), 
       cex=0.8,
       lty = 1)

# Copy graph to PNG file
dev.copy(png, 
     file="plot3.png", 
     height=500, 
     width=500)
dev.off()