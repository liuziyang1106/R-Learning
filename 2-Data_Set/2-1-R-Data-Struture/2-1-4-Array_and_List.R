# Array
# 数组与矩阵类似，但是维数大于2。数组有一个特殊的维数dim 属性。
# 下边的命令给一个向量加上维数后定义了一个数组, 注意数值的排泄顺序
A <- 1:24
dim(A) <- c(3, 4, 2)
print(A)

# 同样可以通过函数array 来创建
dim1 <- c("A1", "A2", "A3")
dim2 <- c("B1", "B2", "B3", "B4")
dim3 <- c("C1", "C2")
A1 <- array(1:24, dim = c(3, 4, 2), dimnames = list(dim1, dim2, dim3))
print(A1)


# List
# 列表是R中最灵活，也是最复杂的数据结构。它可以是多种类型对象的组合
list1 <- list(a = 1, b = 1:5, c = c("red", "blue"))
print(list1)


# 在普通的数据分析中，创建列表并不是一项常见的任务。但是很多函数的返回值是一个列表
set.seed(123)
dat <- rnorm(10)
bp <- boxplot(dat)
print(class(bp))

# 这里列表bp包含了很多对象，如果想查看或者使用某个对象，使用$ 引用
print(bp$stats)