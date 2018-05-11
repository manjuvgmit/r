##### Support Vector Machine ###

plot(mtcars$hp, mtcars$cyl)

library(ggplot2)

ggplot(mtcars, aes(x = hp, y = mpg, col = factor(am), size = 5))+
  geom_point()


### C and Gamma
# Higher the C more accurate we are trying to make or "higher fitting model"

library(e1071)
View(iris)

model = svm(iris$Species~., data = iris)
summary(model)
iris$predictions = predict(model, iris)
View(iris)
#Confusion Matrix
table(Species = iris$Species, pred = iris$predictions)
#Species      setosa versicolor virginica
#setosa         50          0         0
#versicolor      0         48         2
#virginica       0          2        48
4/150
148/150

# Try  with different cost
# Higher cost is over fitting of model. Do not override cost in general
model = svm(iris$Species~., data = iris, cost = 100)
iris$predictions = predict(model, iris)
table(Species = iris$Species, pred = iris$predictions)
#Species      setosa versicolor virginica
#setosa         50          0         0
#versicolor      0         49         1
#virginica       0          0        50

iris$predictions = NULL;
training = iris[sample(seq_len(nrow(iris)), size = 100),]
testing = iris[sample(seq_len(nrow(iris)), size = 50),]
View(training)
View(testing)

# Apply on training data
model1 = svm(training$Species~., data = training)
table(training$Species, predict(model1))
model100 = svm(training$Species~., data = training, cost = 100)
table(training$Species, predict(model100))
model1000 = svm(training$Species~., data = training, cost = 1000)
table(training$Species, predict(model1000))

# apply on testing data
model100 = svm(testing$Species~., data = testing, cost = 100)
table(testing$Species, predict(model100))
model1000 = svm(testing$Species~., data = testing, cost = 1000)
table(testing$Species, predict(model1000))
