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
png("plot3.png", height=480, width=480)
plot(filtered_df$DateTime,
     filtered_df$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="l",
     col="black")
lines(filtered_df$DateTime,
      filtered_df$Sub_metering_2,
      type="l",
      col="red")
lines(filtered_df$DateTime,
      filtered_df$Sub_metering_3,
      type="l",
      col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=1:3,
       lwd=2)
dev.off()