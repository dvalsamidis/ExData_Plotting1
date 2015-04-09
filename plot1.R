
##read data
x<- read.table("household_power_consumption.txt", sep=';',header=TRUE)

##subset the data to show only the two dates
y<-x[x$Date=='1/2/2007' | x$Date=='2/2/2007',]

## transform the data to numeric
y[,3]<-as.numeric(as.character(y[,3]))

##Adjust the environment
par(mfcol=c(1,1))

## Create histogram with specific title and x label
hist(y$Global_active_power,main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red" )

##Copy to a png file
dev.copy(png, file="plot1.png")

##close png device
dev.off()

