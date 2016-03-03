## Fig1 Drawing excercise

#  png(width=480,height=480,filename="plot1.png")
  with(tdf,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (killowatts)"))
  dev.copy(device=png, "plot1.png",unit="px",width=480,height=480)
  dev.off()

  