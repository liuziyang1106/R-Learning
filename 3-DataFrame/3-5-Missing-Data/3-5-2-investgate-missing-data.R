# 在决定如何处理缺失值之前，要了解哪些变量有缺失值，数目是多少，是什么组合形式
# 使用鸢尾花为例
library(missForest)
data(iris)
set.seed(1234)
iris.miss <- prodNA(iris)       # missForest包里的函数prodNA可以随机生成缺失值。
print(summary(iris.miss))

# 为了了解缺失值，用图形展示是一个好的方式
library(VIM)
aggr(iris.miss, prop = FALSE, numbers = TRUE, cex.axis = 0.7)
# 第一个展示了每个变量缺失值的个数
# 第二幅图展示的是5个变量不同组合下缺失值的个数，其中红色方框代表缺失值；
# 共有97个样本没有缺失值，有9个不知道品种但知道他们的4个属性。