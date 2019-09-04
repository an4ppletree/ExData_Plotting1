plot1 <- read.table(file = "household_power_consumption.txt",
                    header = TRUE, sep = ";", na.strings = "?")

plot1a <- plot1

plot1a$Date <- as.Date(plot1$Date, format = "%d/%m/%Y")

par(mfrow = c(1,1))

plot1b <- subset(plot1a, Date >= "2007-02-01" & Date <= "2007-02-02")

hist(plot1b$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Gloabl Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, "plot1.png", width = 480, height = 480)

dev.off()

