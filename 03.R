###### Data Frame ############
# Noting but tablular data. i.e its collection of vector and matrix

# Importing data
cdata = read.csv("C:/Users/User/Documents/campaign-data.csv", header = T)
#cdata = read.csv("campaign-data.csv", header = T)

view(cdata)

summary(cdata) # Default 6 observations and can be changed to any

summary(cdata, 3)

str(cdata) # Give info on kind of data in each column. Factor is categorical

dim(cdata) # dimension of the data i.e. Rows and columns
dim(cdata)[1] # [1] 41188
dim(cdata)[2] # [1] 14

nrow(cdata) # [1] 41188
ncol(cdata) # [1] 14

colnames(cdata) # Vector of column names # 
# [1] "ID"          "age"         "age.bucket"  "job"         "marital"     "education"   "default"     "housing"     "loan"       
# [10] "contact"     "month"       "day_of_week" "duration"    "response" 

colnames(cdata)[3]

colnames(cdata)[3] = 'ag.groups'

colnames(cdata)[c(1, 4)] # returns 1st and 4th column names # [1] "ID"  "job"

colnames(cdata)[c(1, 4)] = c("IDs", "jobs")

cdata[,2][1:5] # Fetches first 5 observations from 2 nd column # [1] 56 57 37 40 56

cdata$age # Returns all age column values

cdata$age[1:5] # [1] 56 57 37 40 56

# Fetch all married users
cdata[cdata$marital == "married",] # comma empty to say we need all columns.
cdata[cdata$marital == "married",c(1:5)]
cdata[cdata$marital == "married",c(1, 2, 3, 4)]

# Fetch all married users with loan
cdata[cdata$marital == "married" & cdata$loan == "yes",]

#Creta new column
cdata$country = "India" # Creates coumn country and initializes wih India
cdata$country = c("India", "US") # Creates coumn country and initializes wih India # Works just fine
cdata$country = c("India", "US", "China") # Fails because rows are not divisible by 3

# Deleting a column
cdata$day_of_week=NULL

cbind(cdata$day_of_week, "Monday")

cdata[, c("age", "country")] # Return only two columns

# Return ID, marrital status and occupation
cdata[, c("IDs", "marital", "jobs")] # Return only three columns


# Want to know how many are maried, single and divorced
table(cdata$marital)
#divorced  married   single  unknown 
#    4612    24928    11568       80

# Cross tabulation
table(cdata$marital, cdata$country) # This is differnet class and not "Data Frame"
#India    US
# divorced  2288  2324
# married  12490 12438
# single    5778  5790
# unknown     38    42

# This is differnet class and not "Data Frame"
tab = table(cdata$marital, cdata$country)
class(tab) # [1] "table"

# Table will have additional column names like row name like pivot table


# Type casting
mytable = as.data.frame(tab)
View(mytable)

tab = table(marital_status=cdata$marital, country=cdata$country) # Columns will be named
mytable = as.data.frame(tab)
View(mytable)

# get subset of table for verification of next excercises
mydata = cdata[1:15,1:5]
mydata

# Ascending order of age
mydata[order(mydata$age),]

# Descending order # negative sign of column
mydata[order(-mydata$age),]

# Multi Level Sorting #
mydata[order(mydata$age, mydata$marital),]

# Conditional operations : Add senior or junir based on age
mydata$status = ifelse(mydata$age >= 50, "Senior", "Junior")

# Delete a Row based on postion
mydata
mydata = mydata[-7, ] # This will remove index 7 from entries

# Fetch based on condition
mydata[!mydata$age > 50, ]

# Delete all age above 50 
mydata = mydata[!mydata$age > 50, ]

# Save my content on specified path
write.csv(mydata, "c:/Users/User/Documents/mydata.csv")

getwd() # [1] "C:/Users/User/Documents"

setwd("D:/bla/bla") # Set explictely

# Save my content on default/working dir
write.csv(mydata, "mydata1.csv")



































































































































