
##read data
x<- read.table("household_power_consumption.txt", sep=';',na.string='?',header=TRUE)

##subset the data to show only the two dates
y<-x[x$Date=='1/2/2007' | x$Date=='2/2/2007',]



## create a new column combining date and time
a <- cbind(y,"DateTime" = strptime(paste(y$Date, y$Time), "%d/%m/%Y %H:%M:%S"))

##Adjust the environment
par(mfcol=c(1,1))

## Create an empty plot and name the y label
plot(a$DateTime, a$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")

## Then add a line
lines(a$DateTime, a$Global_active_power)

##Copy to a png file
dev.copy(png, file="plot2.png")

##close png device
dev.off()

