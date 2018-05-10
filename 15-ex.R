############  ###################
# Predicting Credit score
#

data = read.delim('clipboard', header = T, sep = '\t')
View(data)
# Split the data
train_ind = sample(seq_len(nrow(data)), size = 80)
train_ind

training = data[train_ind,]
View(training)
dim(training)

testing = data[-train_ind,]
View(testing)
dim(testing)

# Build corre
library(Hmisc)
rcorr(as.matrix(data))

# Regression with only one variable
ratmodel = lm(CreditRating~AMB, data = training)
summary(ratmodel)
# Intercept is c, AMB value is 0.29541. means AMB has 29.541% infuence on Credit Rating
# P value with stars,then there is a variance
# R square value is 0.2749 meaning data is 27.49% accuracy

ratmodel = lm(CreditRating~., data = training)
summary(ratmodel)
# Intercept is c, AMB value is 0.25175. means AMB has 29.541% infuence on Credit Rating
# P value with stars,then there is a variance
# R square value is 0.8387 meaning data is 83.87% accuracy

# Hypothesis Testing
# Three stars meaning
# 2 : Rejecting at that level 

fit = lm(data$CreditRating~., data = data)
summary(fit)

# Plotting the model
par(mfrow = c(2,2))
plot(ratmodel)
# Normal Q-Q should be have all data should be linear or data is skewed
# First chart(Residual) should have scattered values then analysis is right

# Running model on test data
testing$predict = predict(ratmodel, testing)
testing$Accuracy = ( testing$predict - testing$CreditRating ) * 100 / testing$CreditRating
View(testing)

# Plot gragh for study hours v/ Result. Result is either pass or fail so there no line.Sigmoid curve. instead plot no of people cleared vs no of hours
# 