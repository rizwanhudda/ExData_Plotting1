# code for reading the raw data and creating
# a filtered data frame that can be directly
# plotted
df <- read.csv("household_power_consumption.txt",
               head = TRUE,
               sep = ";",
               stringsAsFactors=FALSE)
filtered_df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
filtered_df[filtered_df == "?"] <- NA
numeric_cols <- c("Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
filtered_df$Global_active_power <- as.numeric(filtered_df$Global_active_power)
filtered_df$Global_reactive_power <- as.numeric(filtered_df$Global_reactive_power)
filtered_df$Voltage <- as.numeric(filtered_df$Voltage)
filtered_df$Global_intensity <- as.numeric(filtered_df$Global_intensity)
filtered_df$Sub_metering_1 <- as.numeric(filtered_df$Sub_metering_1)
filtered_df$Sub_metering_2 <- as.numeric(filtered_df$Sub_metering_2)
filtered_df$Sub_metering_3 <- as.numeric(filtered_df$Sub_metering_3)
filtered_df$DateTime <- as.POSIXct(paste(filtered_df$Date,filtered_df$Time), format="%d/%m/%Y %H:%M:%S")
#### above part of code will be common across all plot files ##
hist(filtered_df$Global_active_power, 
     xlab="Global Active Power (killowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")
dev.copy(png, "plot1.png")
dev.off()