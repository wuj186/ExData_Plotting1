
#Create plot 2

library(dplyr)
library(graphics)


#set work directory 
setwd("C:/Users/jinqu/Rcourse/Exploratory Data Analysis/week1")

# Read a txt file, named "household_power_consumption.txt"

consump2 <- read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")%>%
            subset(Date %in% c("1/2/2007","2/2/2007")) %>%
            mutate(datetime=strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))


summary(consump2)

png("plot2.png", width=480, height=480)

with( consump2,plot( datetime, as.numeric(Global_active_power),type="l", xlab="",  ylab="Global Active Power (kilowatts)"))

dev.off()




