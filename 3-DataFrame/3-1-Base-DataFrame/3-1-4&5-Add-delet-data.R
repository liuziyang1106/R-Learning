library(epiDisplay)
data(Familydata)

# duplicated 函数的返回值TRUE或者FALSE，这里返回全为FALSE 代表无重复
a <- duplicated(Familydata$code)
print(a)

# 可以借助any()函数作用于duplicated函数中
# any 用于检查逻辑向量的值，如果向量中由一个是TRUE，其返回值为TRUE
b <- any(a)
b <- any(duplicated(Familydata$code))
print(b)

# 也可以使用table()，能得到重复值的个数
c <- table(a)
c <- table(duplicated(Familydata$code))
print(c)


# 删除重复的行
# 建立一个包含重复数据的数据集，将第二行复制到第十二行
Familydata1 <- Familydata
Familydata1[12, ] <- Familydata[2, ]
str(Familydata1)

d <- which(duplicated(Familydata1$code))
print(d)

unique.code.data <- Familydata1[!duplicated(Familydata1$code), ]
print(identical(unique.code.data, Familydata))


# 添加和删除变量
# 例 添加变量log10money
a <- Familydata$log10money <- log10(Familydata$money)
print(a)
print(Familydata)

# 使用transform
Familydata2 <- transform(Familydata1, log10money=log10(money))
print(Familydata2)

# 删除变量
Familydata2$log10money <- NULL
print(Familydata2)