# 在医学研究中，常常遇到结局变量为多分类的有序变量，
# 如将疗效分为显效、有效和无效，各分类之间是有序的。
# 如果忽略变量的有序性，使用无序多分类回归，不但会丧失变量间联系的功效
# 而且会曲解因变量和自变量之间的相关关系
# 有序分类变量的logit 模型中最常用的就是累计优势logistics回归

# 例：某研究人员随机选择84例某病的患者做临床试验，以探讨性别和新旧疗法
# 对该病疗效的影响，结果分为无效、有效、痊愈

# 录入数据
dat <- array(c(10, 7, 19, 6, 0, 2, 7, 5, 1, 5, 6, 16),
            dim = c(2, 2, 3),
            dimnames = list(method = c("old", "new"),
                            sex = c("male", "female"),
                            outcome = c("effectless", "effective", "recover")))
dat <- as.table(dat)
data1 <- as.data.frame(dat)
print(data1)
print(str(data1))

# 将结果变量转换为有序因子
data1$outcome <- ordered(data1$outcome)
print(data1$outcome)

# MASS包里的函数polr可用于建立累计优势logistics回归模型，
library(MASS)
polr1 <- polr(outcome ~ sex + method, weights = Freq, data = data1)
print(summary(polr1))

# 与之前类似，我们还是关注自变量的回归系数
# 把回归系数指数化即可得到优势比OR
print(coef(polr1))
print(exp(confint(polr1)))

# 最后我们可以用epiDisplay 包中的函数ordinal.or.display汇总模型结果
library(epiDisplay)
print(ordinal.or.display(polr1))