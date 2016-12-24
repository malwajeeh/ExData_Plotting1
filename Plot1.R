# Read Entire File

EPC <- read.table("household_power_consumption.txt",
                  header=TRUE,sep=";",na.strings = "?",stringsAsFactors = FALSE,
                  colClasses=c("character","character","double","double","double","double","double","double","numeric"))

# Subset Data where Date between 1/2/2007 and 2/2/2007

EPC_Feb <- EPC[(EPC$Date=="1/2/2007" | EPC$Date=="2/2/2007" ), ]


# Delete  EPC Table To Imporve Memory Performance

rm(EPC)

# create New Column DateTime

EPC_Feb$DateTime <- paste(EPC_Feb$Date,EPC_Feb$Time)

# Change the Date Format

EPC_Feb$DateTime<- as.POSIXlt(EPC_Feb$DateTime,format="%d/%m/%Y %H:%M:%S")

# delete Date and Time Columns 
EPC_Feb$Date<- NULL

EPC_Feb$Time <- NULL

########   Draw Plot1  ####################

png(file="plot 1.R",width = 480, height = 480)

hist(EPC_Feb$Global_active_power,xlab="Global Active Power (Kilowatts)",
     ylab="Frequency",col="red",main="Golobal Active Power")

dev.off()


