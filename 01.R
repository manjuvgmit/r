#Creating Vectors
v1 = c("Hyd", "BLR", "PNE") #combine
print(v1) #Print explicitely
########## Indexing ###############
v1 # prints value
v2 = c(10, 20, 30)
v3 = 1:3 # creates sequence from 1 to 3
1 : 30
seq(5, 100, by = 5)
v4 = seq(100, 1000, by=75)
v4
v5 = seq(1500, 5000, by=5)
v5 # print without defintion # Error: object 'v5' not found
v5[2]
v5[2:13] # Prints from 2 to 13
v5[c(17, 19)] # when needed more than one keys are combined
v4[-3] # Drops 3rd element
v4=v4[-3]
v2 #[1] 10 20 30
v3 #[1] 1 2 3
v5 = v2 + v3 # Adds corresponding element addition
v5 # [1] 11 22 33
#If number leements mismatches then warns about them if 
v4[70] #[1] NA
length(v5) #[1] 3
sum(v5) # [1] 66
v6 = c(100, 200, NA)
sum(v6) #[1] NA # bcoz one is NA
sum(v6,rm.na=T) # [1] NA ## syntax error ##
sum(v6,na.rm=T) #[1] 300
mean(v6,na.rm=T) #[1] 150
mean(v6,na.rm=TRUE) #[1] 150

v5[v5>2500] # prints gt 2500

v5[v5 > 2500 & v5 < 2700] # range

v1
v3

v6 = paste(v1, v3, sep = "-") # Default separator is space # [1] "Hyd-1" "BLR-2" "PNE-3"
v6

v7 = paste(v1[1:3], v3, sep = "-") # Default separator is space # [1] "Hyd-1" "BLR-2" "PNE-3"
v7

paste(v1, v3) # [1] "Hyd 1" "BLR 2" "PNE 3"

paste0(v1, v3) # [1] "Hyd1" "BLR2" "PNE3"

paste0("A", 1:10) # [1] "A1"  "A2"  "A3"  "A4"  "A5"  "A6"  "A7"  "A8"  "A9"  "A10"
