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



########   create Plot2   ####################
png(file="Plot 2.png",width = 480,height = 480)

plot(EPC_Feb$DateTime,EPC_Feb$Global_active_power,
     ylab = "Global Active Power (Kilowatts)", xlab = "",type="l")
dev.off()

