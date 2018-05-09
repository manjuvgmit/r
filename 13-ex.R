########### Banking case study ################## File 'Banking case Study'
# 1) Spend amount per customer per month/year basis
# 2) Repayment amount per customer per month/ year basis
# 3) Monthly interest(rate=2.9) for each customer
#
#
#
#
#
#
#
#
#
#
#
# ############# 1 ###############
# Copy from file "Credit banking spend"
spendData = read.delim('clipboard', header = T, sep = '\t')
View(spendData)
spendData = mutate(spendData, Month = format(as.Date(spendData$Date, '%d-%b-%y'), '%b'), Year = format(as.Date(spendData$Date, '%d-%b-%y'), '%Y'))
spendAggData = aggregate(spendData$Amount, list(Customer = spendData$Customer, year = spendData$Year, Month = spendData$Month), sum)
View(spendAggData)

# ############# 2 ###############
# Copy from file "Credit banking repaymnent"
repayData = read.delim('clipboard', header = T, sep = '\t')
View(repayData)
repayData = mutate(repayData, Month = format(as.Date(spendData$Date, '%d-%b-%y'), '%b'), Year = format(as.Date(spendData$Date, '%d-%b-%y'), '%Y'))
repayAggData = aggregate(repayData$Amount, list(Customer = repayData$Customer, year = repayData$Year, Month = repayData$Month), sum)
View(repayAggData)

#### Merging spent and repayment data
colnames(spendData)
bankdata = merge(spendData, repayData, by = c("Customer", "Year", "Month"))
View(bankdata)

# Final Merge - Credit Banking
customerInfo = read.delim('clipboard', header = T, sep = '\t')
View(customerInfo)
finalData = merge(customerInfo, bankdata, by = 'Customer')
View(finalData)

# Customer having crosse dtheir limit -  Divide by 100 to retain decimal value
########### ?????????????????????? column is having exponential part ?????????????????????????
finalData$newLimit = as.numeric(gsub("\\D", "", finalData$Limit)) / 100
View(finalData)
unique(finalData$newLimit)


########## Attach the data frome to console
attach(finalData)
Company
detach(finalData)
############################################

finalData$Age = ifelse(finalData$Age<18, mean(finalData$Age), finalData$Age)



# ############# 3 ###############
View(repayData)
repayData = mutate(repayData, Interest = (2.9 / 100) * repayData$Amount)
class(repayData$Amount)
class(repayData$Interest)