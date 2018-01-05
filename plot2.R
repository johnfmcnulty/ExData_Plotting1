## Read CSV file provided

power.consumption <- read.csv("household_power_consumption.txt", header = TRUE, 
                              na.strings = c("?"), stringsAsFactors = FALSE, sep = ";")

## Filter to only include dates indicated on assignment.

power.consumption <- filter(power.consumption, Date == "1/2/2007" | Date == "2/2/2007")


## Convert all columns except Date and Time to numeric format.

power.consumption[, -1:-2] <- lapply(power.consumption[,-1:-2], function(x) as.numeric(x))

## Consolidate Date and Time to new variable Datetime 
## And convert to POSIXct using Lubridate.

power.consumption <- unite(power.consumption, Datetime, Date, Time)

power.consumption$Datetime <- dmy_hms(power.consumption$Datetime)

## Create PNG File

png(filename = "plot2.png", width = 480, height = 480)

##  Create line graph.

with(power.consumption, 
     plot(Datetime, Global_active_power, type = "l", 
          ylab = "Global Active Power (kilowatts)", xlab =""))

dev.off()
