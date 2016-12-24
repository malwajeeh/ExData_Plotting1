# Read Entire File

EPC <- read.table("household_power_consumption.txt",
                  header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE,
                  colClasses=c("character","character","double","double","double","double","double","double","numeric"))

# Subset Data where Date between 1/2/2007 and 2/2/2007

EPC_Feb <- EPC[(EPC$Date=="1/2/2007" | EPC$Date=="2/2/2007" ), ]


# Delete  EPC Table To Imporve Memory Performance

rm(EPC)

# create New Column DateTime



EPC_Feb$DateTime<- strptime(paste(EPC_Feb$Date, EPC_Feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# delete Date and Time Columns 
EPC_Feb$Date<- NULL

EPC_Feb$Time <- NULL


########   create Plot4   ####################

png(file="Plot4.png")
par(mfrow = c(2, 2),mar=c(4,4,3,1))

 #### Draw the first Plot #########
plot(EPC_Feb$DateTime,EPC_Feb$Global_active_power,
     ylab = "Global Active Power", xlab = "",type="l")


#### Draw the Second Plot #########
with(EPC_Feb,plot(DateTime,Voltage,
     ylab = "Voltage", xlab = "datetime",type="l"))

#### Draw the third Plot #########
par(mfrow = c(2, 2),mar=c(4,4,3,1))
with(data=EPC_Feb,plot(DateTime,Sub_metering_1,type = "n",xlab = "",ylab = ""))
with (data =EPC_Feb,points(DateTime,Sub_metering_1,col="black",type="l"))
with (data =EPC_Feb,points(DateTime,Sub_metering_2,col="red",type="l"))
with (data =EPC_Feb,points(DateTime,Sub_metering_3,col="blue",type="l"))
title(xlab = "", ylab = "Energy Sub Metering")
legend("topright",col=c("black","red","blue"),
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),cex=0.75, bty="n", xjust=1,lwd=2)

#### Draw the fourth Plot #########
with(EPC_Feb,plot(DateTime,Global_reactive_power,
                  , xlab = "datetime",type="l"))

dev.off()
