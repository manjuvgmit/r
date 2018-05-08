######### Solve below #########

auto=read.delim('clipboard', sep = '\t', header = T)
View(auto)

# 1. Which si the most commanly used mode of contact?
# 2. Within what period of time most leads would prefer to buy the car ?
# 3. Who is the best and worst lead provider?
# 4. Do most of the customers prefer to buy new car ?
# 5. Give the list of states with their car model name which is in more demand or sold there ?
# 6. Create a new variable by combining the manufacturer name and model
# 7. Which is the besttradeinyear for the manufacturer Toyota?
# 8. Create new variable and the values conditionally
#   If the distnace to dealer 
#   < 10            - Very Near
#   >= 10 and < 50  - Near
#   >= 50 and < 100 - Far
#   > 100           - very Far
# 9. Which is the distance within which most customers lie ?

## 1 
table(auto$ContactByEmail) #1497
table(auto$ContactByTelephone) #1496
# or
sum(auto$ContactByEmail)
sum(auto$ContactByTelephone)
# or
colSums(auto[,11:12])
# or 
aggregate(auto$Lead_Id, list(auto$ContactByEmail), length) # Does not matter 'Lead_Id' or any column but which shold give valid column
# or
aggregate(auto$Lead_Id, list(email = auto$ContactByEmail, phone = auto$ContactByTelephone), length)

############ 2 ############
colSums(auto[, 5:10])

############ 3 ############
aggregate(auto$Lead_Id, l(Lead_Provider = auto$LeadProvider_Id), length)
# Or
table(auto$LeadProvider_Id)
# Or
ex_02_03_01 = aggregate(auto$Lead_Id, list(Lead_Provider = auto$LeadProvider_Id), length)
# Or -- Run this each time.
library(dplyr)
#
ex_02_03_01 = arrange(ex_02_03_01, x) # Ascending
# Worst
head(ex_02_03_01, 1) # LP008 129
# Best
tail(ex_02_03_01, 1) # LP005 170
ex_02_03_02 = arrange(ex_02_03, desc(x)) # Ascending
# Best
head(ex_02_03_02, 1) #  LP005 170
# Worst
tail(ex_02_03_02, 1) # LP008 129

############ 4 ############
table(auto$Status)
ex_02_04_01 = aggregate(auto$Lead_Id, list(TypeOfCar = auto$Status), length)
ex_02_04_02 = arrange(ex_02_04_01, desc(x))
head(ex_02_04_02, 1) # NEW 1373

############ 6 ############
colnames(auto)
ex_02_06_01 = filter(auto, Manufacturer == "Toyota")
View(ex_02_06_01)
table(ex_02_06_01$TradeInModelYear)
# or
ex_02_06_02 = aggregate(ex_02_06_01$Lead_Id, list(TypeOfCar = ex_02_06_01$TradeInModelYear), length)
ex_02_06_03 = arrange(ex_02_06_02, desc(x))
View(ex_02_06_03)
head(ex_02_06_03, 1) # 2002 19
# or
table(filter(auto, Manufacturer == 'Toyota')[, 'TradeInModelYear'])


############ 5 ############
ex_02_05_01 = aggregate(auto$Lead_Id, list(state = auto$State, Manufacturer = auto$Manufacturer, model = auto$Model), length)
View(ex_02_05_01)

#ex_02_05_02 = aggregate(ex_02_05_01$x, list(ex_02_05_01$model), max) # This will not work as it outputs only state and count and not model
#View(ex_02_05_02)

ex_02_05_02 = arrange(ex_02_05_01, state, desc(x))
View(ex_02_05_02)

aggregate(ex_02_05_02, list(state = ex_02_05_02$state), head, 1) # head or mean is a function which will be applied on 
#1    AK    AK       Toyota  Corolla  8
#2    AL    AL         Audi       A3 11
#3    AR    AR       Toyota  Corolla 12
#4    AZ    AZ        Lexus       LS 10
#5    CA    CA          BMW 3 Series 18
#6    NM    NM         Audi       A6 14
#7    NY    NY         Audi       A8 13

############ 7 ############
auto$Name = paste(auto$Manufacturer, auto$Model)
View(auto)

############ 8 ############
auto$Distance = ifelse(
  auto$DistanceToDealer < 10, 
  "Very Near", 
  ifelse(
      auto$DistanceToDealer >= 10 && auto$DistanceToDealer < 50, 
      "Near",
      ifelse(
        auto$DistanceToDealer >= 50 && auto$DistanceToDealer < 100, 
        "Far",
        ifelse(
          auto$DistanceToDealer > 100 , 
          "Very Far",
          "Infinity"
        )
      )
  )
)

# Or

auto$Distance = ifelse(
  auto$DistanceToDealer < 10, 
  "Very Near", 
  ifelse(
    auto$DistanceToDealer < 50, 
    "Near",
    ifelse(
      auto$DistanceToDealer < 100, 
      "Far",
      ifelse(
        auto$DistanceToDealer > 100 , 
        "Very Far",
        "Infinity"
      )
    )
  )
)
#Far      Near  Very Far Very Near 
#195      1081        84       139 
View(auto)

############ 9 ############
table(auto$Distance)
