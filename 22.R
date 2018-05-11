################# KNN   #######################
# Difficult to fine tune this KNN kodule. It works or sometimes it won't work because it relies on neighbours
# This is not a good model
# This single functions learns from training and applies on testing data and gives result at once
#

library(class)

View(iris)
training = iris[sample(seq_len(nrow(iris)), size = 100),]
testing = iris[sample(seq_len(nrow(iris)), size = 50),]
View(training)
View(testing)

myPred = knn(training, testing, cl = training$Species, k = 10)
