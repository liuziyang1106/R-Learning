# R 中的rio包用统一的import 和export函数简化用户读取写入数据的工作。并且其中的convert 实现不同数据格式转换
install.packages("rio")
library(rio)
data("infert")
print(str(infert)) # 函数str() 常用于查看数据集的大小，以及各个变量的类型。

# 导出数据
export(infert, "infert.csv")

convert("infert.csv", "infert.sav")