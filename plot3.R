plot1 <- read.table(file = "household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?")

plot1a <- plot1

plot1a$Date <- as.Date(plot1$Date, format = "%d/%m/%Y")

plot1b <- subset(plot1a, Date >= "2007-02-01" & Date <= "2007-02-02")


datetime <- as.POSIXct(paste(plot1b$Date, plot1b$Time), format =
                           "%Y-%m-%d %H:%M:%S" )

# write directly to png device rather than dev.copy()
# because my windows 10 box or setup doesn't like this plots
# plot legend for 480x480 file

png(filename  = "plot3.png", width = 480, height = 480)

par(mfrow = c(1,1))

with(plot1b, { plot(Sub_metering_1 ~ datetime, type = "l",
                    ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ datetime, type = "l" , col ="red")
    lines(Sub_metering_3 ~ datetime, type = "l" , col ="blue")
})


legend("topright", col = c("black","red","blue") ,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)



dev.off()




