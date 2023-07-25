#Create plot 3

library(dplyr)
library(graphics)


#set work directory 
setwd("C:/Users/jinqu/Rcourse/Exploratory Data Analysis/week1/")

# Read a txt file, named "household_power_consumption.txt"
consump3 <- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")%>%
                subset(Date %in% c("1/2/2007","2/2/2007"))%>%
                mutate(consump0,datetime=strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
                SubMet_1 =as.numeric(Sub_metering_1) ,
                SubMet_2 =as.numeric(Sub_metering_2) ,
                SubMet_3 =as.numeric(Sub_metering_3))

summary(consump3)

png("plot3.png", width=480, height=480)

with(consump3, plot(datetime, SubMet_1, type="l",col="black" , ylab="Energy Sub metering", xlab=""))
with(consump3,lines(datetime, SubMet_2, type="l", col="red"))
with(consump3, lines(datetime, SubMet_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))

dev.off()




