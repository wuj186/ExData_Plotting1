#Create plot 1


library(dplyr)
library(graphics)


#set work directory 
setwd("C:/Users/jinqu/Rcourse/Exploratory Data Analysis/week1/")

# Read a txt file, named "household_power_consumption.txt"
consump1 <- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")  %>%
             subset(Date %in% c("1/2/2007","2/2/2007"))

summary(consump1)

png("plot1.png", width=480, height=480)

hist( as.numeric(consump1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")

dev.off()




