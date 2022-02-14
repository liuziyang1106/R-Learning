# 当需要比较的组多于两个，如果数据是从正太分布总体中抽样而成，且满足方差齐次性
# 我们可以使用方差分析 ANOVA
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

# 例：如果想知道不同种族之间新生儿的体重是否存在差异，需要使用单因素方差分析
# 先检查各组数据的正态性
# 使用tapple对变量bwt按照race的三个组分别进行了shapiro-wilk正态性检验
# 认为3组都满足正态性假设
print(tapply(birthwt$bwt, birthwt$race, shapiro.test))

# 使用函数bartlett.test进行方差齐次性检验
print(bartlett.test(bwt ~ race, data = birthwt))

# Note: Bartlett 检验对于数据的正态性非常敏感。
#       而Levene检验是一种非参数方法，使用更广
#       使用car包中的leveneTest()进行该检验

# 建立方法分析模型
race.aov <- aov(bwt ~ race, data = birthwt)
print(summary(race.aov))  # 具有显著性差异

# 下一步，我们可以通过组间的两两比较找出哪些组之间存在显著性差异
# 函数TukeyHSD() 采用Tukey 法对各组均值的差异进行成对检验
print(TukeyHSD(race.aov))
plot(TukeyHSD(race.aov), las = 1)