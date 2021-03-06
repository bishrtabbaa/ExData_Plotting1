source('main.R')
mydownload()
mypowerdata <- myread()
print('Plotting Plot3...')
png(file='plot3.png',width=480,height=480,bg="transparent")
plot(mypowerdata$DateTime, mypowerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(mypowerdata$DateTime, mypowerdata$Sub_metering_2, type="l",col="red")
lines(mypowerdata$DateTime, mypowerdata$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.col=c("black","red","blue"))
dev.off()