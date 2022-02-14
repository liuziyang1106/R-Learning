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

# 独立性检验
# 1、卡方 检验
# 对于一般的列联表，可以使用函数chisq.test进行卡方检验。
mytable <- table(birthwt$smoke, birthwt$low)
print(mytable)
print(chisq.test(mytable))


# 2、Fisher精确概率检验
# 如果观察总记录数n 小于40， 或频数里某个期望频数很小，则需要使用fisher精确概率检验
print(fisher.test(mytable))

# 3、相对危险度和优势比
# 如果想知道行变量某一水平和列变量某一水平相对于基础水平的关联程度，就需要
# 用相对危险度RR和优势比OR
# RR用于反应暴露因素与结局时间的关联程度。
# 数值为1时，表示无关联；
# 小于1 时，表明暴露因素导致结局时间发生率降低
# 大于1 时，表明暴露因素导致结局事件发生率增加

# OR 指暴露组中病例与非病例人数的比值 除以 非暴露组病例与非病例的比值。
# 取值从0到无穷大
# OR 大于 1，说明该暴露因素更容易导致结果事件发生，因素为危险因素
# OR 小于 1，说明该暴露因素更不容易导致结果发生，因素为保护因素

# epiDisplay包中的cs和cc分别计算RR和OR，以及置信区间。
# 需要说明，cs和cc的第一个参数outcome需设置为结果变量，
library(epiDisplay)

print(cs(birthwt$low, birthwt$smoke))

print(cc(birthwt$low, birthwt$smoke))