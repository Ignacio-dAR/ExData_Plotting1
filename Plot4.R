d = read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".",na.strings="?")
d1<-subset(d2,Date>=DateLimit[1])
d2<-subset(d1,Date<=DateLimit[2])
d2$Date<-as.Date(d2$Date,format="%d/%m/%Y")
remove(d1)

par(mfcol=c(2,2))
par(mar=c(6,6,2,2))

##Upper left plot
plot(d2$Global_active_power, main="", type="l", xlab="", axes=FALSE, ylab="")
box(col="black")
axis(side=1,col="black",at=c(0,1440,2880),labels=c("Thru","Fri","Sat"), cex.axis=0.7)
axis(2, col="black", at=c(0,2,4,6), cex.axis=0.7)
mtext("Global Active Power", side=2, line=3, col="black", cex=0.6)

##Lower Left Plot
plot(d2$Sub_metering_1, main="", type="l", xlab="", axes=FALSE, ylab="")
lines(d2$Sub_metering_2,col="red")
lines(d2$Sub_metering_3, col="blue")
box(col="black")
axis(side=1,col="black",at=c(0,1440,2880),labels=c("Thru","Fri","Sat"), cex.axis=0.7)
axis(2, col="black", at=c(0,10,20,30), cex.axis=0.7)
mtext("Energy sub metering", side=2, line=3, col="black", cex=0.6)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6, pch="-",pt.cex=2,col=c("black","red","blue"))

##Upper Right Plot
plot(d2$Voltage, main="", type="l", xlab="", axes=FALSE, ylab="")
box(col="black")
axis(side=1,col="black",at=c(0,1440,2880),labels=c("Thru","Fri","Sat"), cex.axis=0.7)
axis(side=2, col="black", at=c(234,236,238,240,242,244,246), cex.axis=0.7)
mtext("datetime", side=1, line=3, col="black", cex=0.6)
mtext("Voltage", side=2, line=3, col="black", cex=0.6)


##Lower Right Plot
plot(d2$Global_reactive_power, main="", type="l", xlab="", axes=FALSE, ylab="")
box(col="black")
axis(side=1,col="black",at=c(0,1440,2880),labels=c("Thru","Fri","Sat"), cex.axis=0.7)
axis(side=2, col="black", at=c(0,0.1,0.2,0.3,0.4,0.5), cex.axis=0.7)
mtext("datetime", side=1, line=3, col="black", cex=0.6)
mtext("Global_reactive_power ", side=2, line=3, col="black", cex=0.6)

dev.copy(png,file="plot4.png")
dev.off()