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

# Plot graph
par(mfcol=c(1,1))
plot(energydata$Timestamp, 
     energydata$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Copy graph to PNG file
dev.copy(png, 
     file="plot2.png", 
     height=500, 
     width=500)
dev.off()