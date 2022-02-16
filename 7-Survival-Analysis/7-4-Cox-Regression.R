# 所有的参数回归模型都需要对风险函数做出假设，这些模型可以对每个时间点的生存概率进行估计
# 而Cox 回归没有关于风险函数的假设，它所遵循的唯一重要假设是 “比例风险”

# 准备数据
library(survival)
data(ovarian)

# 将resid.ds, rx and ecog.ps 转换为因子
ovarian$resid.ds <- factor(ovarian$resid.ds, levels = c(1, 2), labels = c("no", "yes"))
ovarian$rx <- factor(ovarian$rx, levels = c(1, 2), labels = c("A", "B"))
ovarian$ecog.ps <- factor(ovarian$ecog.ps, levels = c(1, 2), labels = c("good", "bad"))

ovarian$agegr <- cut(ovarian$age, breaks = c(0, 50, 75), labels = c("<=50", ">50"))

# 建立生存对象
surv.obj <- Surv(time = ovarian$futime, event = ovarian$fustat)

# 建立cox 回归模型，把所有协变量包含进来
cox1 <- coxph(surv.obj ~ rx + resid.ds + agegr + ecog.ps, data = ovarian)
print(summary(cox1))

# 结果表明，在调整了协变量的情况下，两种质量方案具有显著差异 p = 0.0322

# 类似于多元线性回归，多变量的cox 也存在变量选择的问题
# 使用dropl 可以得到各个自变量的似然比检验的结果
print(drop1(cox1, test = "Chisq"))
# 得到ecog。ps的p值最大，将其移除

cox2 <- coxph(surv.obj ~ rx + resid.ds + agegr, data = ovarian)
print(summary(cox2))

# 比例风险假定的检验
print(cox.zph(cox2))
