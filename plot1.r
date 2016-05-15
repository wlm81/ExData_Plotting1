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

# Create graph
par(mfcol=c(1,1))
hist(energydata$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Copy graph to PNG file
dev.copy(png, 
     file="plot1.png", 
     height=480, width=480)
dev.off()