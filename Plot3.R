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


########   create Plot3    ####################
png(file="Plot3.png",width=480,height = 480)
with(data=EPC_Feb,plot(DateTime,Sub_metering_1,type = "n",xlab = "",ylab = ""))
with (data =EPC_Feb,points(DateTime,Sub_metering_1,col="black",type="l"))
with (data =EPC_Feb,points(DateTime,Sub_metering_2,col="red",type="l"))
with (data =EPC_Feb,points(DateTime,Sub_metering_3,col="blue",type="l"))
title(xlab = "", ylab = "Energy Sub Metering")
legend("topright",col=c("black","red","blue"),legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lwd=1)
dev.off()
