# 一般来说，处理缺失值可以采用下面三种方法：
# 1、 删除，删除带有缺失值的变量和记录
# 2、 替换，用均值、中位数、众数或其他数值替换
# 3、 补全，基于统计模型推测和补充缺失值

library(missForest)
data(iris)
set.seed(1234)
iris.miss <- prodNA(iris)       # missForest包里的函数prodNA可以随机生成缺失值。
print(summary(iris.miss))

# 1、删除缺失值
iris.sub <- na.omit(iris.miss)
print(nrow(iris.sub))           # 删除缺失值后的数据仅包含97条完成记录

# 函数 complete.cases() 可以用来识别矩阵或者数据框中没有缺失值的行，返回值是TRUE或者FALSE
iris.sub1 <- iris.miss[complete.cases(iris.miss), ]
print(summary(iris.sub1))

# 2、使用特定数值替换缺失值
# 以 变量SepalLength 为例，用忽略缺失值后的均值替换该变量里的缺失值。
Sepal.Length.mean <- mean(iris.miss$Sepal.Length, na.rm = TRUE)
print(Sepal.Length.mean)

iris.miss1 <- iris.miss
iris.miss1$Sepal.Length[is.na(iris.miss1$Sepal.Length)] <- Sepal.Length.mean
print(summary(iris.miss1))

# 为检查补全后的数据与原始数据的差异，我们可以计算偏差
bias <- summary((iris$Sepal.Length - iris.miss1$Sepal.Length) / iris$Sepal.Length)
print(bias)
# 补全的平均偏差不到1%， 但是最大偏差为25%


# 3、 多重插补
# 多重插补是一个基于重复模拟的处理缺失值的方法
# 基于mice包，假设数据是随机缺失的，根据变量的类型建立模型得到预测以代替缺失值。在模型中常用的有：
# (1) 预测均值匹配，实质上就是线性回归，适用于数值型缺失。 [pmm]
# (2) Logistic 回归，适用于二分类变量                   [logreg]
# (3) 多分类logistic 回归，适用于无序多分类变量          [ployreg]
# (4) 比例优势比模型，适用于有序多分类变量               [polr]

library(mice)
imputed.data <- mice(iris.miss, seed = 1234)
print(summary(imputed.data))
print(imputed.data$imp$Sepal.Length)

# 函数mice 通过Gibbs抽样完成，默认进行5次随机抽样，所以一共得到5组插补值。
# 我们可以通过查看上面的输出结果以检查插补值是否合理，然后选择其中一组

complete.data <- complete(imputed.data, 5)
print(summary((iris$Sepal.Length - complete.data$Sepal.Length) / iris$Sepal.Length))