#################### Titanic Data Set  ####################
# Substitue missing values on avergae based on class like masters avg, unmarriage MISS average
# Take out salution as MRs, MISS and Master to separate column
# Check Gender impacting the servival chances
# Note: For salary grouping can be done by plotting histogram and categorize based on that
# Data quality on each column is important. understand range and data accuracy on each column. Normalize the data

# learning ecel PIVOT table

library(class)

View(iris)
training = iris[sample(seq_len(nrow(iris)), size = 100),]
testing = iris[sample(seq_len(nrow(iris)), size = 50),]
View(training)
View(testing)