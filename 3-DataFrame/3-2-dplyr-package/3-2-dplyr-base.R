library(dplyr)
data(birthwt, package = "MASS")

# fileter and slice
# filter 可以基于观测值筛选数据的一个子集。
a <- filter(birthwt, age > 35)
print(a)
b <- filter(birthwt, bwt < 2500 | bwt > 4000)
print(b)

# filter 可以用逗号分割多个条件
b <- filter(birthwt, age > 35, bwt < 2500 | bwt > 4000)
print(b)

# slice 可以按照行号选择指定的行
c <- slice(birthwt, 2:5)
print(c)

# 使用arrange 排列行
a <- arrange(birthwt, bwt)
print(a)
b <- arrange(birthwt, bwt, age)
print(b)
# 倒序排列
a_t <- arrange(birthwt, -bwt)
print(a_t)