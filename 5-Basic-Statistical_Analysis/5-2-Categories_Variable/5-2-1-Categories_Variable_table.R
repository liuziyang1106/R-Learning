# 5.2.1 生成频数表和列联表
data(birthwt, package = "MASS")
structure <- str(birthwt)

library(dplyr)
# 首先将数据集中的分类变量转换成因子
birthwt <- birthwt %>% mutate(low = factor(low, labels = c("no", "yes")),
                              race = factor(race, labels = c("white", "black", "other")),
                              smoke = factor(smoke, labels = c("no", "yes")),
                              ht = factor(ht, labels = c("no", "yes")), 
                              ui = factor(ui, labels = c("no", "yes")))
print(structure)

# 1、一维频数表
# 一维频数表是只按一个变量的不同分类的频数进行统计的表
# 函数table可用于生成简单的一维频数表
mytable <- table(birthwt$low)
print(mytable)

# 通常来说，我们更关注相对数或者百分比
# 函数prop.table可以转化成百分比
print(prop.table(mytable))
print(round(prop.table(mytable) * 100, 1)) # round 可以保留一位小数

# epiDisplay里的tabl 不仅可以给出一维频数表，还能给出百分比和累计百分比
# 还输出了实用的频数分布条形图
library(epiDisplay)
print(tab1(birthwt$low))

# 2、二维列联表
# table 函数同样适用
mytable <- table(birthwt$smoke, birthwt$low)
print(mytable)
# 还可以生成边际数
print(addmargins(mytable))
# 转换为百分比
print(prop.table(mytable, margin = 1))
print(prop.table(mytable, margin = 2))

# epiDisplay里的tabpct 可以一次性得到上边的结果，同时生成马赛克图
mytable <- tabpct(birthwt$smoke, birthwt$low)
print(mytable)
