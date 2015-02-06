d = read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".",na.strings="?")
d1<-subset(d2,Date>=DateLimit[1])
d2<-subset(d1,Date<=DateLimit[2])
d2$Date<-as.Date(d2$Date,format="%d/%m/%Y")
remove(d1)

plot(d2$Global_active_power, main="", type="l", xlab="", axes=FALSE, ylab="")
box(col="black")
axis(side=1,col="black",at=c(0,1440,2880),labels=c("Thru","Fri","Sat"), cex.axis=0.8)
axis(2, col="black", at=c(0,2,4,6), cex.axis=0.8)
mtext("Global Active Power (Kilowatts)", side=2, line=3, col="black", cex=0.8)

dev.copy(png,file="plot2.png")
dev.off()