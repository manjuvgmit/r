cdata = read.delim('clipboard', header = T, sep = ',')
View(cdata)

c = c('Hyderabad', "Hyddsdfd", 'BLR')
grep('Hyd', c)

grep('basic', cdata$education)

basicEducationData = cdata[grep('basic', cdata$education),]
View(basicEducationData)


##### Execercise : report lead amount per month

lead = read.delim('clipboard', header = T, sep = '\t')
View(lead)
class(lead$DATEENTER)
lead$date = as.Date(lead$DATEENTER, '%d-%m-%Y')
class(lead$date)
lead$month = format(lead$date, '%b')
aggregate(lead$AMOUNT, list(Month = lead$month), sum)
# With nested functions -- one solution
aggregate(lead$AMOUNT, list(Month = format(as.Date(lead$DATEENTER, '%d-%m-%Y'), '%b')), sum)
# For only FEB Month -- Make sure you load the dployr library library(dplyr)
filter(aggregate(lead$AMOUNT, list(Month = format(as.Date(lead$DATEENTER, '%d-%m-%Y'), '%b')), sum), Month=='Feb')
          