source('main.R')
mydownload()
mypowerdata <- myread()
print('Plotting Plot1...')
png(file='plot1.png',width=480,height=480,bg="transparent")
hist(mypowerdata$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()