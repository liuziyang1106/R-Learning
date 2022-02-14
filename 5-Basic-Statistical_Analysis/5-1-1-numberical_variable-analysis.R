data(birthwt, package = "MASS")
structure <- str(birthwt)
print(structure)

library(dplyr)
# 首先将数据集中的分类变量转换成因子
birthwt <- birthwt %>% mutate(low = factor(low, labels = c("no", "yes")),
                              race = factor(race, labels = c("white", "black", "other")),
                              smoke = factor(smoke, labels = c("no", "yes")),
                              ht = factor(ht, labels = c("no", "yes")), 
                              ui = factor(ui, labels = c("no", "yes")))
print(str(birthwt))

# 获取数据集里每个变量的常用统计量是一种快速探索数据集的方法
# summary 函数可以对每个变量进行汇总统计。
# 对于数值型变量，给出均值，中位数，四分位数。
# 对于分类型变量给出频数
summerize <- summary(birthwt)
print(summerize)

# epiDisplay包的summ（）作用域DataFrame得到的是另一种格式的汇总
# 给出了均值方法、最大最小值
library(epiDisplay)
print(summ(birthwt))

# 5-1 数值型变量的描述性统计分析
cont.var <- dplyr::select(birthwt, age, lwt, bwt)
print(length(cont.var$age))
print(mean(cont.var$age))
print(sd(cont.var$age))

# 使用sapply 函数同时计算多个变量的统计指标
print(sapply(cont.var, sd))

# psych 包里的describe 函数可以计算变量忽略缺失值后的样本量、均值、方差、中位数等统计量
library(psych)
print(describe(cont.var))

# 很多时候，我们想计算某个分类变量各类别的统计量
# 使用aggregate 方法
# aggregate中的by必须设置为list
print(aggregate(cont.var, by = list(smoke = birthwt$smoke), mean))
print(aggregate(cont.var, by = list(smoke = birthwt$smoke), sd))
print(aggregate(cont.var, by = list(smoke = birthwt$smoke, race = birthwt$race), mean))

# 函数tapple 可以实现类似功能，不同的是，它的第一个参数必须是一个变量，第二个参数名是INDEX
print(tapply(cont.var$bwt, INDEX = birthwt$smoke, mean))

# epiDisplay包里的summ函数也可以实现类似的功能，不同的是，该函数的统计量是固定的，而且输出包括一个按照分类变量绘制的有序图
print(summ(birthwt$lwt, by = birthwt$smoke))