# Factor
# 名义型变量（性别，血型）和有序性变量（病情……）在R中称为因子，因子常用整数向量存储

sex <- c(1, 2, 1, 1, 2, 1, 2)
sex.f <- factor(sex, levels = c(1, 2), labels = c("Male", "Female"))
print(sex.f)

# 在统计中，对于因子型变量，R会将第一个水平当作参考组。很多时候要改变因子水平的排序顺序
# 方法一
sex.f1 <- factor(sex, levels = c(2, 1), labels = c("Female", "Male"))
print(sex.f1)
# 方法二
sex.f1 <- relevel(sex.f, ref = "Female")
print(sex.f1)

# 有序因子 在定义时将 ordered 设置为 TRUE
status <- c(1, 2, 2, 3, 1, 2, 2)
status.f <- factor(status, levels = c(1, 2, 3)
                  , labels = c("poor", "improved", "excellent"), ordered = TRUE)
print(status.f)