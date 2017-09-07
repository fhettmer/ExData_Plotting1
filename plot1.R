fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./Week 1/Dataset.zip")
unzip(zipfile = "./Week 1/Dataset.zip",exdir="./Week 1")

data<-read.table("./Week 1/household_power_consumption.txt",sep=";", header = TRUE)

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

png(file="plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(data$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
