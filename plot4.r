 ##################################################
    
  setwd('D://R directory')
  dir()
  All_data=read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?',nrows=2075259,check.names=F, stringsAsFactors=F,comment.char='')
  names(All_data) ; str(All_data)
  All_data$Date = as.Date(All_data$Date, format="%d/%m/%Y")
  head(All_data)
  subset_all_data=subset(All_data, Date=='2007-2-1'| Date=='2007-2-2')
  
  head(subset_all_data) ; tail(subset_all_data)
        
         #Converting dates 
  date_time=paste(as.Date(subset_all_data$Date),subset_all_data$Time)
  head(subset_all_data)
  subset_all_data$date_time=as.POSIXct(date_time)
  head(subset_all_data)

    #plot 4 
      
   par(mfrow=c(2,2))
 plot(subset_all_data$Global_active_power~subset_all_data$date_time,type='l', ylab='Global Active Power (Kilowatts)',xlab='')
  plot(subset_all_data$Voltage~subset_all_data$date_time,type='l', ylab='Voltage',xlab='datetime')
  
  plot(subset_all_data$Sub_metering_1~subset_all_data$date_time,type='l',col='black',ylab='Energy sub meetering', xlab='')
  lines(subset_all_data$Sub_metering_2~subset_all_data$date_time,col='red')
  lines(subset_all_data$Sub_metering_3~subset_all_data$date_time,col='blue')
  legend('topright',lty=c(1,1,1),col=c('black','red','blue'), 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=0.8)
 plot(subset_all_data$Global_reactive_power~subset_all_data$date_time,type='l', ylab='Global reactive Power',xlab='datetime')
 dev.off()
 dev.copy(png, file='plot4.png',height=480,width=480)
dev.off()
