########  #####
goldfund = read.delim('clipboard', header = T, sep = ',')
View(goldfund)
dim(goldfund)

goldtraining = goldfund[sample(seq_len(nrow(goldfund)), size = 700),]
View(goldtraining)
dim(goldtraining)

goldtesting = goldfund[sample(seq_len(nrow(goldfund)), size = 174),]
View(goldtesting)
dim(goldtesting)

# Build Model
goldmodel = glm(goldtraining$Gold_Fund~., data = goldtraining)

colnames(goldfund)

goldmodel = glm(goldtraining$Gold_Fund~.-ID-AMB-AccountSince-AvgMonthlyTxn-ELSS-PMS_accounts-Trading_Accounts-Speciality_funds, data = goldtraining)

# This wil compare each value with 0.5 and prints boolean
predict(goldmodel, goldtraining, type = 'response') > 0.5

#Confusion Matrix
table(reality = goldtraining$Gold_Fund, model = predict(goldmodel, training, type = 'response') > 0.5 )

table(reality = goldtraining$Gold_Fund, model = predict(goldmodel, testing, type = 'response') > 0.5 )

# Sensitivity, specificity, 

