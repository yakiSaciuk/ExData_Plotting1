plot1 <- function(){
  
  # defining data file path and columns' classes
  fileName = 'household_power_consumption.txt' 
  colCls = c(rep('character',2), rep("numeric",7))
  
  # reading and subsetting data            
  tbl = read.csv(fileName, sep = ';', na.strings = '?', colClasses = colCls)
  tbl = subset(tbl, Date == '2/2/2007' | Date == '1/2/2007')
  
  # creating png file
  png(file = 'plot1.png', width = 480, height = 480)
  
  # creating plot + titles
  hist(tbl$Global_active_power, col = 'red', xlab = NA, ylab = NA, main = NA)
  title(main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
  
  dev.off()
  
}