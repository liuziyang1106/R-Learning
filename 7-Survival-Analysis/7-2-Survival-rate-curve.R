# 对于生存率的估计最常用的是Kaplan-Meier 法
# 其基本原理是先求出存活一段时间的对象再活过下一个时期的概率，
# 然后根据概率的乘法定律将逐个生存概率连续相乘，从而得到生存率
# 生存率的KM估计的计算可以调用survfit 实现

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

# KM 估计
print(survfit(surv.obj ~ 1))
surv.all <- survfit(surv.obj ~ 1)
print(summary(surv.all)) # 这里的输出结果包含了各个时间点存活对象的个数、生存率及置信区间

#可以添加censored = TRUE 显示删失数据
print(summary(surv.all, censored = TRUE))

# 绘制生存曲线
plot(surv.all, mark.time = TRUE)
# mark.time 为删失数据添加+标记
# 虚线为置信区间，如果去除，将参数conf.int 设为FALSE
plot(surv.all, mark.time = TRUE, conf.int = FALSE)
