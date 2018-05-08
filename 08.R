########## Diagrams #################

View(mtcars)

?mtcars

plot(mtcars$hp, mtcars$mpg)

plot(mtcars$hp, mtcars$mpg, main = 'Correlation b/w HP and MPG')

plot(mtcars$hp, mtcars$mpg, main = 'Correlation b/w HP and MPG', xlab = 'HP', ylab = 'MPH')

# 17 is triangle and default is circle.
plot(mtcars$hp, mtcars$mpg, main = 'Correlation b/w HP and MPG', xlab = 'HP', ylab = 'MPH', type = 'p', pch = 17)

# Histogram like bar chart but always shows frequency on Y Axis
hist(mtcars$mpg)

# las is orientation whether it should be horizontal or Vertical
hist(mtcars$mpg, las=0) 
hist(mtcars$mpg, las=1) 
hist(mtcars$mpg, las=2) 

hist(mtcars$mpg, las=2, col = 4) # Blue
hist(mtcars$mpg, las=2, col = 2) # Organge
hist(mtcars$mpg, las=2, col = 1) # Black
hist(mtcars$mpg, las=2, col = 4:9) # Colors from 4 to 9

hist(mtcars$mpg, las=2, col = 4:9, labels = T) # Adds labels to headers
hist(mtcars$mpg, las=2, col = 4:9, labels = T, ylim = c(0, 14)) # Adds labels to headers
hist(mtcars$mpg, las=2, col = 4:9, labels = T, ylim = c(0, 15)) # Adds labels to headers

# Make sure turn off dev mode or else app will complain file is open by another program.
png("Synechron-01.png")
hist(mtcars[, 1], las=2, col = 4:9, labels = T, ylim = c(0, 15), main = "Distribution of MPG", xlab = "MPG") # Adds labels to headers
dev.off()

colNamesOfMtCars = colnames(mtcars)
for(i in 1:ncol(mtcars)) {
#for(colNamesOfMtCar in colNamesOfMtCars) {
  #png(paste(colNamesOfMtCar, "png", sep = '.'))
  png(paste0(colNamesOfMtCar, ".png"))
  hist(mtcars[, colNamesOfMtCar], las=2, col = 4:9, labels = T, ylim = c(0, 15), main = paste("Distribution of", colNamesOfMtCar), xlab = colNamesOfMtCar) 
  dev.off()
}


