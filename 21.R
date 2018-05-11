######### Random Forest ########
# Improves Deciion Tree algorithm by building multiple decision tree models by using different features and picks decision on majority

# hypothesis testing not covered as it is not requried

library(randomForest)

View(iris)
training = iris[sample(seq_len(nrow(iris)), size = 100),]
testing = iris[sample(seq_len(nrow(iris)), size = 50),]
View(training)
View(testing)

rfModel = randomForest(training$Species~., training, ntree = 500)
fit = rpart(testing$Species~., method = 'class', data = testing)
table(testing$Species, predict(rfModel, testing, type = 'class'))
table(testing$Species, predict(fit, testing, type = 'class'))

