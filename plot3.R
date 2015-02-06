plot3 <- function(){
  
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
  png(file = 'plot3.png', width = 480, height = 480) 
  
  # creating (empty) plot
  plot(NA, xlim = c(1,nrow(tbl)), ylim = c(0,60), xlab = NA, ylab = NA, axes = FALSE)
  
  # and adding lines
  for(i in 1:3){
    lines(1:nrow(tbl), tbl[, columns[i]], type = 'l', col = colors[i])      
  }
  
  # adding title and legend box
  title(ylab = 'Energy sub metering')
  legend('topright', col = colors, legend = names(tbl)[columns], lwd = 1, lty = 1)
  
  # definig axes:
  axis(1, at = c(0, median(1:nrow(tbl)), nrow(tbl)), labels = c('Thu', 'Fri', 'Sat'))
  axis(2, at = c(0, 10, 20, 30))
  
  dev.off()
    
}