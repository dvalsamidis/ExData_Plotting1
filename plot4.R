
##read data
x<- read.table("household_power_consumption.txt", sep=';',header=TRUE)

##subset the data to show only the two dates
y<-x[x$Date=='1/2/2007' | x$Date=='2/2/2007',]

## transform the data to numeric
y[,3]<-as.numeric(as.character(y[,3]))
y[,4]<-as.numeric(as.character(y[,4]))
y[,5]<-as.numeric(as.character(y[,5]))
y[,7]<-as.numeric(as.character(y[,7]))
y[,8]<-as.numeric(as.character(y[,8]))
y[,9]<-as.numeric(as.character(y[,9]))

## create a new column combining date and time
a <- cbind(y,"datetime" = strptime(paste(y$Date, y$Time), "%d/%m/%Y %H:%M:%S"))

##Adjust the environment
par(mfcol=c(2,2), cex=0.7, mar=c(4,4,2,2))


##First Graph
## Create an empty plot and name the y label
plot(a$datetime, a$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")

## Then add a line
lines(a$datetime, a$Global_active_power)



## Second Graph
## Create an empty plot and name the y label
plot(a$datetime, a$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")

## Add the first line for the Sub metering 1
lines(a$datetime, a$Sub_metering_1)

## Add the first line for the Sub metering 2
lines(a$datetime, a$Sub_metering_2, col="red")

## Add the first line for the Sub metering 3
lines(a$datetime, a$Sub_metering_3, col="blue")

## Add Legend
legend("topright",lwd = 1,col= c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Third Graph
## Create an empty plot and name the y label
plot(a$datetime, a$Voltage, type="n", ylab="Voltage", xlab="datetime")

## Then add a line
lines(a$datetime, a$Voltage)

##Fourth Graph
## Create an empty plot and name the y label
plot(a$datetime, a$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")

## Then add a line
lines(a$datetime, a$Global_reactive_power)

##Copy to a png file
dev.copy(png, file="plot4.png")

##close png device
dev.off()

