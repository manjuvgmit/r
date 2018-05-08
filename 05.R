######## Aggregation ###################

# Result of agrrgate is always a data frame
aggregate(cdata$age, list(cdata$marital), mean) # Applying "mean" on "age" group by "marital"
aggregate(cdata$age, list(status = cdata$marital), mean)
aggregate(cdata$age, list(status = cdata$marital), mean, na.rm=T)
# Group by multiple
aggregate(cdata$age, list(status = cdata$marital, loan=cdata$loan), mean, na.rm=T) # Applying "mean" on "age" group by "marital" andloan status

# Length giving "countof vector" and grouping
aggregate(cdata$age, list(status = cdata$marital, loan=cdata$loan), length)


# Loading frm excel using XlConnect
wk=loadworkbook("sdfd.xslx") # Connection string pointitng to spreadsheet
leads=readworksheet(wk,sheet="sheet1")


auto= read.delim('clipboard', sep="\t", header = T)
View(auto)
