fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./Week 1/Dataset.zip")
unzip(zipfile = "./Week 1/Dataset.zip",exdir="./Week 1")

data<-read.table("./Week 1/household_power_consumption.txt", sep=";", header=TRUE)

data<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")

data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2))

plot(data$Time,as.numeric(as.character(data$Global_active_power)),type="l",xlab="",ylab="Global Active Power") 
plot(data$Time,as.numeric(as.character(data$Voltage)),type="l",xlab="datetime",ylab="Voltage") 

plot(data$Time,as.numeric(as.character(data$Sub_metering_1)),type="n",xlab="",ylab="Energy Submettering")
lines(data$Time,as.numeric(as.character(data$Sub_metering_1)),col="black")
lines(data$Time,as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(data$Time,as.numeric(as.character(data$Sub_metering_3)),col="blue")

legend("topright", lty=1, col = c("black","red", "blue"), legend=c("Sub_mettering_1","Sub_mettering_2", "Sub_mettering_3"))

plot(data$Time,as.numeric(as.character(data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power") 