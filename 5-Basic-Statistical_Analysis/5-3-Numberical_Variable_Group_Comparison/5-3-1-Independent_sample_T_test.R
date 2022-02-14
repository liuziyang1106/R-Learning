# 独立样本T 检验
# 假设变量的分布呈正态分布，针对两组独立样本，t检验可以用于两个总体均值之间的比较
# 通常，我们需要先用var.test检查两组之间是否具有方差齐性
print(var.test(bwt ~ smoke, data = birthwt))
# 结果表明，吸烟组和不吸烟组数据方差差异没有统计学差异

# 接下来使用函数t.test()
print(t.test(bwt ~ smoke, var.equal = TRUE, data = birthwt))
# var.equal用于设置方差是否齐性

# t.test的另一种使用方法
group1 <- birthwt$bwt[birthwt$smoke == 0]
group2 <- birthwt$bwt[birthwt$smoke == 1]
print(t.test(group1, group2, var.equal = TRUE))

# 我们还可以通过设置参数alternative进行单侧检验。
# 例如，想进一步检验是否a组的总体均值大于b组
print(t.test(bwt ~ smoke, var.equal = TRUE
    , data = birthwt, alternative = "greater"))
    