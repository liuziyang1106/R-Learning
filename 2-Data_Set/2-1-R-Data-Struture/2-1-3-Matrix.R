# matrix

# 创建了一个1-6，行数为2的矩阵
M <- matrix(1:6, nrow = 2)
print(M)

# 矩阵计算
mat1 <- matrix(1:6, nrow = 3)
print(mat1)
mat2 <- matrix(5:10, nrow = 2)

dim1 <- dim(mat1)
dim2 <- dim(mat2)

# 相乘
mat3 <- mat1 %*% mat2
print(mat3)

# 转置
tmax1 <- t(mat1)
print(tmax1)

# 对矩阵按行、列求和或者求平均
sum_mat3_byrow <- rowSums(mat3)
sum_mat3_bycol <- colSums(mat3)
mean_mat3_byrow <- rowMeans(mat3)
mean_mat3_bycol <- colMeans(mat3)