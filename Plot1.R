
d = read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".",na.strings="?")
d1<-subset(d2,Date>=DateLimit[1])
d2<-subset(d1,Date<=DateLimit[2])
d2$Date<-as.Date(d2$Date,format="%d/%m/%Y")
remove(d1)

hist(d2$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency",xlim=c(0,6),ylim=c(0,1200))
dev.copy(png,file="plot1.png")
dev.off()