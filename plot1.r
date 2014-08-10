 ##################################################
 #Plot one

  setwd('D://R directory')
  dir()
  All_data=read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?',nrows=2075259,check.names=F, stringsAsFactors=F,comment.char='')
  names(All_data) ; str(All_data)
  All_data$Date = as.Date(All_data$Date, format="%d/%m/%Y")
  head(All_data)
  subset_all_data=subset(All_data, Date=='2007-2-1'| Date=='2007-2-2')
  
  head(subset_all_data) ; tail(subset_all_data)
  ## plot one
      
  hist(subset_all_data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (Kilowatts)')
  dev.copy(png, file='plot1.png',height=480,width=480)
dev.off()

   
       