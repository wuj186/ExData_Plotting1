


#Create plot 4

library(dplyr)
library(graphics)



#set work directory 
setwd("C:/Users/jinqu/Rcourse/Exploratory Data Analysis/week1")

# Read a txt file, named "household_power_consumption.txt"
consump4 <- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")%>%
        subset(Date %in% c("1/2/2007","2/2/2007"))%>%
        mutate(datetime=strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
               SubMet_1 =as.numeric(Sub_metering_1) ,
               SubMet_2 =as.numeric(Sub_metering_2) ,
               SubMet_3 =as.numeric(Sub_metering_3))

summary(consump4)

png("plot4.png", width=480, height=480)
par( mfrow = c(2, 2))      

with( consump4,plot( datetime, as.numeric(Global_active_power),type="l", xlab="",  ylab="Global Active Power "))
with( consump4,plot( datetime, as.numeric(Voltage),type="l", xlab="datetime",  ylab="Voltage"))
with(consump4, plot(datetime, SubMet_1, type="l",col="black" , ylab="Energy Sub metering", xlab=""))
with(consump4,lines(datetime, SubMet_2, type="l", col="red"))
with(consump4, lines(datetime, SubMet_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

with( consump4,plot( datetime, as.numeric(Global_reactive_power),type="l", xlab="datetime",  ylab="Global_reactive_power"))

dev.off()




