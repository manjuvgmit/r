############## User Defined Functions ###########
coneVolume = function(radius, height) {
  vol = pi * radius * height / 3
  return(vol)
}

coneVolume(radius = 5, height = 5)

#---------------------------------------------------------------
# Excercise 02

csFunction = function(df) {
  ans1 = colSums(df[, 11:12])
  ans2 = colSums(df[, 5:10])
  ans3 = table(df[, 'LeadProvider_Id'])
  ansList = list(ans1, ans2, ans3)
  return(ansList)
}

csFunction(auto)
#[[1]]
#ContactByEmail ContactByTelephone 
#2               1496 
#
#[[2]]
#Within24    Within48    Within72  WithinWeek WithinWeeks WithinMonth 
#0          75           6          57         361         544 
#
#[[3]]
#
#LP001 LP002 LP003 LP004 LP005 LP006 LP007 LP008 LP009 LP010 
#157   163   160   150   170   141   160   129   137   132 

#---------------------------------------------------------------
#
#q = Quantity
#p = Price
#
#if 
# q < 100           - 0% Discount
# 100 >= q < 200    - 10% Discount
# 200 >= q < 300    - 20% Discount
# q >= 300          - 30% Discount
#
#
finalAmountFunc = function(price, quantity) {
  totalAmount = price * quantity
  finalAmount = totalAmount - totalAmount * ifelse(totalAmount < 100, 0, ifelse(totalAmount < 200, 0.10, ifelse(totalAmount < 300, 0.20, 0.30) ) )
  return(finalAmount)
}

finalAmountFunc(50, 1)
finalAmountFunc(100, 1)
finalAmountFunc(200, 1)
finalAmountFunc(300, 1)
