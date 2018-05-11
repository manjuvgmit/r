#### Decision Tree / CLASS #####
# which one to choose, lot of category then decision tree if numeric data then logical regression
#

library(rpart)
View(iris)
training = iris[sample(seq_len(nrow(iris)), size = 100),]
testing = iris[sample(seq_len(nrow(iris)), size = 50),]
View(training)
View(testing)

# For Training Data
fit = rpart(training$Species~., method = 'class', data = training)
# Plot Tree
plot(fit, uniform = T)
text(fit, pretty = 0)
# Here we need to pass the type as 'class' or it will take regression as type
table(training$Species, predict(fit, training, type = 'class'))
#setosa versicolor virginica
#setosa         31          0         0
#versicolor      0         32         0
#virginica       0          4        33

# For Testing Data
fit = rpart(testing$Species~., method = 'class', data = testing)
table(testing$Species, predict(fit, testing, type = 'class'))
#setosa versicolor virginica
#setosa         16          0         0
#versicolor      0         16         0
#virginica       0          1        17