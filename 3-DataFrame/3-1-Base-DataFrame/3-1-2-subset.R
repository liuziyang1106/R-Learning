library(epiDisplay)
data(Familydata)
print(Familydata[, 3]) # 取第三列
print(Familydata$ht)

# 提取一个以上的变量，使用向量作为索引
a <- Familydata[1:3, c(3, 4, 6)]
b <- Familydata[1:3, c("ht", "wt", "money", "sex")]
print(a)
print(b)

# 下标中的索引还可以是条件语句，例：只选择女性
# 注意！：条件表达式后边必须跟一个逗号，表示选择所有的列
female_dat <- Familydata[Familydata$sex == "F", ]
print(female_dat)
elder_dat <- Familydata[Familydata$age >= 50,]
print(elder_dat)

# 选择数据子集的方式是使用subset函数
elder_dat <- subset(Familydata, age >= 50)
print(elder_dat)
# 只选择老人中的一部分变量
elder_dat <- subset(Familydata, age >= 50, select = c(ht, wt, money))
print(elder_dat)

# 使用sample 函数进行随机抽样
sample_rows <- sample(1:nrow(Familydata), size = 5, replace = FALSE)
print(sample_rows)
sample_dat <- Familydata[sample_rows, ]
print(sample_dat)
