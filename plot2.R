plot2 <- function(){
  
  # defining data file path and columns' classes
  fileName = 'household_power_consumption.txt' 
  colCls = c(rep('character',2), rep("numeric",7))
  
  # reading and subsetting data
  tbl = read.csv(fileName, sep = ';', na.strings = '?', colClasses = colCls)
  tbl = subset(tbl, Date == '2/2/2007' | Date == '1/2/2007')
  
  # creating png file
  png(file = 'plot2.png', width = 480, height = 480)
  
  # creating plot
  plot(tbl$Global_active_power, type = 'l', xlab = NA, ylab = 'Global Active Power (kilowatts)', axes = FALSE)
  
  # definig axes:
  axis(1, at = c(0, median(1:nrow(tbl)), nrow(tbl)), labels = c('Thu', 'Fri', 'Sat'))
  axis(2, at = c(1:6))
  
  dev.off()
  
}