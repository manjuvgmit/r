######## DataBase Operation ##############
# Install package RODBS
# SQl Fetch, Query, Save, Drop and Close
library(RODBC)

con = odbcConnect(dsn = '', uid = '', pwd = '')

data = sqlFetch(con, 'test.mrt') # will be pulled as data frame
View(data)

# Writing query
sqlQuery(con, "Select * from table where blabla = 'blabla'")