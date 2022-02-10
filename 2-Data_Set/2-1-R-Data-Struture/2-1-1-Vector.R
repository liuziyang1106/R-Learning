# 2.1.1 Vector 

# 自定义向量
x1 <- c(2, 4, 1, -2, 5)             # 数值型 
x2 <- c("one", "two", "three")      # 字符串
x3 <- c(TRUE, FALSE, TRUE)          # 逻辑性
print(x1)
# 创建有规律的向量
x4 <- 1:5
x5 <- seq(from = 2, to = 10, by = 2)
x6 <- rep("a", times = 4)           #("a","a","a","a" )
print(x6)
# 取索引
x <- seq(from = 2, to = 100, by = 7)
print(x)
print(x[1]) # 索引从1 开始
print(x[5])

# 去掉指定位置上的元素，在索引括号中加-
print(x[-(1:4)])


# 计算向量化
weight <- c(68, 72, 57, 90, 65, 81)
height <- c(1.75, 1.80, 1.65, 1.90, 1.72, 1.87)
bmi <- weight / height ^ 2
print(bmi)

# R 内嵌计算
length(bmi)
mean(bmi)
var(bmi)
sd(bmi)