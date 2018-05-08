#### Matrix #####

v1 = c(25, 75, "India")
v1 # [1] "25"    "75"    "India"


# Create Matrix #
mat1 = matrix(data = 11:193)
mat1
#       [,1]
#[1,]   11
#[2,]   12
#[3,]   13
#[4,]   14
#[5,]   15
#[6,]   16
#[7,]   17
#[8,]   18
#[9,]   19
mat1 = matrix(data = 11:19, nrow = 3)
mat1
#       [,1] [,2] [,3]
#[1,]   11   14   17
#[2,]   12   15   18
#[3,]   13   16   19
mat1 = matrix(data = 11:19, nrow = 3, byrow = T)
mat1
#       [,1] [,2] [,3]
#[1,]   11   12   13
#[2,]   14   15   16
#[3,]   17   18   19


mat1[2, 3] # 2nd row , 3rd column

mat1[2,] # entire 2nd row

mat1[,3] # entire 3rd column

x = mat1[,3] # x is a vector now
x

mat1[2,3] = 36
mat1

mat1*5

mat1 * mat1

mat2 = t(mat1) # Transpose rows become columns and vice versa

mat1 * mat2

colSums(mat1) # [1] 42 45 68

colMeans(mat1) # [1] 14.00000 15.00000 22.66667

rowSums(mat1) # [1] 36 65 54

rowMeans(mat1) # [1] 12.00000 21.66667 18.00000

##### If result returned then original structure hasn't been modified

# Adding new column to matrix
cbind(mat1, c(10, 20, 30)) #prepends # will not alter original structure

cbind(c(10, 20, 30), mat1) # appends

# Adding new row to matrix
rbind(mat1, c(10, 20, 30))

rbind(c(10, 20, 30), mat1)




