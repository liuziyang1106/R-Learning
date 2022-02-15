# Logistics 回归分析实例

# 1 数据准备
library(MASS)
data(birthwt)
print(str(birthwt))

# 原始数据里的变量race， smoke，ht， ui都是数值型变量，在分析前需要将他们转换为因子
# 另外，变量plt表示先前早产次数，变量ftv表示怀孕前期探访医生次数，先查看两个变量的频数分布
library(epiDisplay)
print(tab1(birthwt$ptl))
# 发现有84.1% 的孕妇没有早产史，所有有必要把变量ptl转换为二分类因子
print(tab1(birthwt$ftv))
# 同样将变量ftv转换成一个3个水平的因子

# 使用dplyr 完成数据前期准备工作
library(dplyr)
birthweight <- birthwt %>% 
                mutate(race = factor(race, labels = c("white", "black", "other")),
                       smoke = factor(smoke, labels = c("no", "yes")), 
                       ptl = ifelse(ptl > 0, "1+", ptl), 
                       ptl = factor(ptl), 
                       ht = factor(ht, labels = c("no", "yes")), 
                       ui = factor(ui, labels = c("no", "yes")), 
                       ftv = ifelse(ftv > 1, "2+", ftv), 
                       ftv = factor(ftv))
print(str(birthweight))

# 2 模型的建立
# 在R中，函数glm 用于拟合包括logistic 在内的广义线性模型
glml <- glm(low ~ age + lwt + race + smoke + ptl + ht + ui + ftv,
            family = binomial,
            data = birthweight)
print(summary(glml))
# 输出的第一部分显示了模型所调用的公式。
# 第二部分给出了离差的分布。
# 第三部分给出了回归系数的估计、标准误差和显著性检验的结果

# 3 自变量的筛选
print(drop1(glml))
# 从结果看出，第一步需要在模型中剔除变量ftv，因为剔除后模型的AIC最小
# 第二步可以对剔除ftv后的模型再次使用dropl判断哪些变量需要提出
# 函数step可以一次性实现这个过程

glm2 <- step(glml, trace = FALSE)
print(summary(glm2))

# 4 模型的比较
# 模型glm2 剔除了两个自变量 age和ftv
# 函数AIC也可以用于比较两个或者多个模型，一般来说，AIC越小的模型拟合越好
print(AIC(glml, glm2))

# 5 回归系数的解释
# 先查看回归系数
print(coef(glm2))

# 把结果指数化转换成优势比
print(exp(coef(glm2)))
# 结果显示，lwt 每增加1， 新生儿体重的优势将乘以0.98
# 黑人孕妇分娩低体重儿的优势约为白人孕妇的3.67倍

# 如果想得到置信区间，可以使用函数confint
print(confint(glm2))

# 6 预测
# 给定一组自变量的值，我们可以使用建立的模型进行预测
newdata <- data.frame(lwt = 120, race = "black", smoke = "yes",
                        ptl = "0", ht = "yes", ui = "no")
logit <- predict(glm2, newdata = newdata)
print(logit)

# 转换为概率
print(exp(logit) / (1 + exp(logit)))

# 7 模型结果的汇总输出
library(epiDisplay)
print(logistic.display(glm2))