# Installing dplyr package ###
# Tools -> install packages -> dplyr and download. Then from console run "library(dplyr)"

colnames(mydata)
View(mydata)

# Select function always give new data frame al;l the time and will not modify the original content
select(mydata, IDs, age, jobs)

select(mydata, IDs:age)

# Filter is function in deploy ops
filter(cdata, marital == "married", loan == "yes")

# Renaming column names MULTIPLE
rename(mydata, Id=IDs, Age=age, marital_status=marital)

arrange(mydata, marital, desc(age))

# We can create multiple columns here compared to 
mutate(mydata, unique_id=age*IDs, location="BLR")

# Transmute will add only new columns
transmute(mydata, unique_id=age*IDs, location="BLR")
transmute(mydata, IDs, unique_id=age*IDs, location="BLR")
transmute(mydata, IDs, unique_id=age*IDs, location=c("BLR", "Pune")) # Will not work becase mydata has 14 rows and we passed only 2
transmute(mydata, IDs, unique_id=age*IDs, location=c("BLR", "Pune", "BLR", "Pune", "BLR","BLR", "Pune", "BLR", "Pune", "BLR", "BLR", "Pune", "BLR", "Pune")) # works
