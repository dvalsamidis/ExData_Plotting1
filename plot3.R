
##read data
x<- read.table("household_power_consumption.txt", sep=';',na.string='?',header=TRUE)

##subset the data to show only the two dates
y<-x[x$Date=='1/2/2007' | x$Date=='2/2/2007',]



## create a new column combining date and time
a <- cbind(y,"DateTime" = strptime(paste(y$Date, y$Time), "%d/%m/%Y %H:%M:%S"))

##Adjust the environment
par(mfcol=c(1,1))

## Create an empty plot and name the y label
plot(a$DateTime, a$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")

## Add the first line for the Sub metering 1
lines(a$DateTime, a$Sub_metering_1)

## Add the first line for the Sub metering 2
lines(a$DateTime, a$Sub_metering_2, col="red")

## Add the first line for the Sub metering 3
lines(a$DateTime, a$Sub_metering_3, col="blue")

## Add Legend
legend("topright",lwd = 1,col= c("black", "red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


##Copy to a png file
dev.copy(png, file="plot3.png")

##close png device
dev.off()

