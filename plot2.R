plot1 <- read.table(file = "household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?")

plot1a <- plot1

plot1a$Date <- as.Date(plot1$Date, format = "%d/%m/%Y")

plot1b <- subset(plot1a, Date >= "2007-02-01" & Date <= "2007-02-02")


datetime <- as.POSIXct(paste(plot1b$Date, plot1b$Time),
                       format = "%Y-%m-%d %H:%M:%S" )

par(mfrow = c(1,1))

with(plot1b, plot(Global_active_power ~ datetime, type = "l",
                  xlab = "" , ylab = "Global Active Power (kilowatts)"))

dev.copy(png, "plot2.png", width = 480, height = 480)

dev.off()
