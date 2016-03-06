## Fig 4.

#png(width=480,height=480,filename="plot4.png")

par(mfrow=c(2,2))

with(tdf,plot(DateTime,Global_active_power,type="n",main="",ylab="",xlab=""))
with(tdf,lines(DateTime,Global_active_power))
title(ylab="Global Active Power")

with(tdf,plot(DateTime,Voltage,type="n",main="",ylab="Voltage",xlab="datetime"))
with(tdf,lines(DateTime,Voltage))
title(ylab="Voltage")


with(tdf,plot(DateTime,Sub_metering_1,type="n",main="",ylab="",xlab=""))
with(tdf,lines(DateTime,Sub_metering_1, col="black"))
with(tdf,lines(DateTime,Sub_metering_2, col="red"))
with(tdf,lines(DateTime,Sub_metering_3, col="blue"))
title(ylab="Energey sub metering")
legend("topright", lty=1, cex=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(tdf,plot(DateTime,Global_reactive_power,type="n",main="",xlab="datetime"))
with(tdf,lines(DateTime,Global_reactive_power))

dev.copy(device=png, "plot4.png",unit="px",width=480,height=480)
dev.off()
