plot4 <- function(){
  
  # defining data file path and columns' classes
  fileName = 'household_power_consumption.txt' 
  colCls = c(rep('character',2), rep("numeric",7))
  
  # reading and subsetting data
  tbl = read.csv(fileName, sep = ';', na.strings = '?', colClasses = colCls)
  tbl = subset(tbl, Date == '2/2/2007' | Date == '1/2/2007')

  # definig the color of the lines + the required columns set
  colors = c('black', 'red', 'blue')
  columns = 7:9

  # creating png file
  png(file = 'plot4.png', width = 480, height = 480)
  
  # defining plots' frame
  par(mfrow = c(2,2), mar = c(4,4,2,1))
  
  # -- plot(1,1) --------------------------------------------------------------------------------------------
  plot(tbl$Global_active_power, type = 'l', xlab = NA, ylab = 'Global Active Power (kilowatts)', axes = FALSE)
  axis(1, at = c(0, median(1:nrow(tbl)), nrow(tbl)), labels = c('Thu', 'Fri', 'Sat'))
  axis(2, at = c(0:6))
  
  # -- plot(1,2) --------------------------------------------------------------------------------------------
  plot(tbl$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage', axes = FALSE)
  axis(1, at = c(0, median(1:nrow(tbl)), nrow(tbl)), labels = c('Thu', 'Fri', 'Sat'))
  axis(2, at = c(234:246))
  
  # -- plot(2,1) --------------------------------------------------------------------------------------------
  plot(NA, xlim = c(1,nrow(tbl)), ylim = c(0,60), xlab = NA, ylab = NA, axes = FALSE)
  for(i in 1:3){
    lines(1:nrow(tbl), tbl[, columns[i]], type = 'l', col = colors[i])
  }
  title(ylab = 'Energy sub metering')
  legend('topright', legend = names(tbl)[columns],col = colors, lwd = 2, lty = 1, bty = "n")
  axis(1, at = c(0, median(1:nrow(tbl)), nrow(tbl)), labels = c('Thu', 'Fri', 'Sat'))
  axis(2, at = c(0, 10, 20, 30))
  
  
  # -- plot(2,2) --------------------------------------------------------------------------------------------
  plot(tbl$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power', axes = FALSE)
  axis(1, at = c(0, median(1:nrow(tbl)), nrow(tbl)), labels = c('Thu', 'Fri', 'Sat'))
  axis(2, at = c(0.0, 0.1, 0.2, 0.3, 0.4,0.5))
  
  
  dev.off()
  
}