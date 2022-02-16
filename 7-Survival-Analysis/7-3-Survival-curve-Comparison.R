# 在上一节的分析基础上，我们可以在survfit的公式上添加一个因子变量
# 来获得该变量不同水平下的生存信息。
# 例如，想要得到不同治疗方案下生存率估计

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

# 建立模型
surv.treat <- survfit(surv.obj ~ ovarian$rx)
print(summary(surv.treat))

# 在同一图显示多条生存曲线
plot(surv.treat, mark.time = T, 
    conf.int = TRUE, lty = c(1, 2), col = c("blue", "red"))
legend(60, .3, legend = c("A", "B"), lty = c(1, 2), col = c("blue", "red"))

# survminer 包中的ggsurvplot 以ggplot的风格提供了更丰富的图形输出
library(survminer)
ggsurvplot(surv.treat, data = ovarian, pval = TRUE)

# 统计检验
# 最常用的是时序检验 log rank  test
# 其基本思想是先计算出不同时期两种治疗方法的暴露人群和死亡人群
# 并由此在两种治疗方案效果相同的假设下计算出期望死亡人数
# 如果不拒绝零假设，则实际观测值和观测值的差异不会很大，如果差异过大则不能认为是由随机误差引起的差异

test <- survdiff(surv.obj ~ rx, data = ovarian)
print(test)

# 结果发现两种治疗方法下的生存率差异没有显著差异，但是两组中
# 被研究的对象存在其他可能影响生存结果的因素，这是就需要用到回归分析，把这些因素作为协变量
# 这就引入了cox 回归