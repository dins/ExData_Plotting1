setwd("~/coursera/exploratory-data-analysis/ExData_Plotting1")

filePath <- "~/coursera/exploratory-data-analysis/ExData_Plotting1/household_power_consumption.txt"

library(data.table)
library(dplyr)

dt <- fread(filePath, sep = ";", na.strings=c("?"))
selectedDays <- dplyr::filter(dt, Date == "2/2/2007" | Date == "1/2/2007")
png("plot1.png")
hist(selectedDays$Global_active_power, 
     col = "red", 
     xlab = "Global active power (kilowatts)", 
     main = "Global active power")
dev.off()
