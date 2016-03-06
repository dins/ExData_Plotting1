setwd("~/coursera/exploratory-data-analysis/ExData_Plotting1")

filePath <- "~/coursera/exploratory-data-analysis/ExData_Plotting1/household_power_consumption.txt"

library(data.table)
library(dplyr)
library(lubridate)

dt <- fread(filePath, sep = ";", na.strings=c("?"))
selectedDays <- dplyr::filter(dt, Date == "2/2/2007" | Date == "1/2/2007") %>% 
  dplyr::mutate(DateTime = dmy_hms(paste(Date, Time)))

png("plot4.png")
par(mfrow=c(2,2))

plot(selectedDays$DateTime,selectedDays$Global_active_power, type = "n", xlab = "", ylab = "Global active power")
lines(selectedDays$DateTime,selectedDays$Global_active_power)

plot(selectedDays$DateTime,selectedDays$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(selectedDays$DateTime,selectedDays$Voltage)

plot(selectedDays$DateTime,selectedDays$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(selectedDays$DateTime,selectedDays$Sub_metering_1)
lines(selectedDays$DateTime,selectedDays$Sub_metering_2, col = "red")
lines(selectedDays$DateTime,selectedDays$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd=2,
       bty = "n")

plot(selectedDays$DateTime,selectedDays$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(selectedDays$DateTime,selectedDays$Global_reactive_power)

dev.off()