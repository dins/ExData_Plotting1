setwd("~/coursera/exploratory-data-analysis/ExData_Plotting1")

filePath <- "~/coursera/exploratory-data-analysis/ExData_Plotting1/household_power_consumption.txt"

library(data.table)
library(dplyr)
library(lubridate)

dt <- fread(filePath, sep = ";", na.strings=c("?"))
selectedDays <- dplyr::filter(dt, Date == "2/2/2007" | Date == "1/2/2007") %>% 
  dplyr::mutate(DateTime = dmy_hms(paste(Date, Time)))
png("plot2.png")
plot(selectedDays$DateTime,selectedDays$Global_active_power, type = "n", xlab = "", ylab = "Global active power (kilowatts)")
lines(selectedDays$DateTime,selectedDays$Global_active_power)
dev.off()


