
# A     -> D support 2/5, confidence 2/3, Lift = 2/5 / 3/5 * 3/5 = 25/9 * 2/5 = 10/9

# C     -> A support 2/5, confidence 2/4 or 1/2, Lift = 2/5 / 4/5 * 3/5 = 25/12 * 2/5 = 5/6

# A     -> C support 2/5, confidence 2/4 or 1/2, Lift = 2/5 / 4/5 * 3/5 = 25/12 * 2/5 = 5/6

# B & C -> D support 1/5, confidence 1/3 , Lift = 1/3  = 5/9

library(arules)

data('Groceries')

inspect(Groceries[1:5])

Groceries

class(Groceries)

par(mfrow = c(1,1))

itemFrequencyPlot(Groceries, topN = 20, type = 'absolute')

rules = apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

inspect(rules[1:5])

rules = sort(rules, by = 'confidence', decreasing = T)

rules = sort(rules, by = 'confidence', decreasing = F)

inspect(rules[1:10])

rules[!rhs == '']


##### These are unspervised learning ########