height <- c(100, 150, NA, 160)
print(height)
print(is.na(height))
print(table(is.na(height)))

# ！！！ 所有包含NA的计算结果都是NA， 在统计时需要特殊设置
me_na <- mean(height)
me_na_om <- mean(height, na.rm = TRUE)
print(me_na)
print(me_na_om)

# 函数summary 在计算向量统计量时回自动忽略na
suma <- summary(height)
print(suma)