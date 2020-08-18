library(lubridate)

file_url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, "electric.zip")
unzip("electric.zip")
estimate_size<-2075259*9*8/(1024*1024)
hpc<-read.table("household_power_consumption.txt", sep=";", header = TRUE)
hpc$Date<-dmy(hpc$Date)
hpc$Time<-hms(hpc$Time)
date_select<-interval(ymd("2007-02-01"),ymd("2007-02-02"))
hpc3<-subset(hpc,Date %within% date_select)
png(file="plot1.png")
hist(as.numeric(hpc3$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()