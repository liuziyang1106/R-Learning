# 生存对象
# 在生存分析中，每个研究对象的结局变量由时间 time， 和事件 event组成
# survival包提供了生存分析的一系列工具
# 生存分析的响应变量是生存对象，在survival包中用Surv 生成，它是将事件和时间合并的一种数据结构
# 下边使用ovarian 数据进行生存分析。该数据来自一项比较卵巢癌患者在两种治疗方法下的生存率的随机对照试验

library(survival)
data(ovarian)
print(str(ovarian))

# 将resid.ds, rx and ecog.ps 转换为因子
ovarian$resid.ds <- factor(ovarian$resid.ds, levels = c(1, 2), labels = c("no", "yes"))
ovarian$rx <- factor(ovarian$rx, levels = c(1, 2), labels = c("A", "B"))
ovarian$ecog.ps <- factor(ovarian$ecog.ps, levels = c(1, 2), labels = c("good", "bad"))
# print(str(ovarian))

hist(ovarian$age) # 发现年龄变量不是正态分布，把年龄变量也转化为因子
ovarian$agegr <- cut(ovarian$age, breaks = c(0, 50, 75), labels = c("<=50", ">50"))
# print(table(ovarian$agegr))

# 建立生存对象

surv.obj <- Surv(time = ovarian$futime, event = ovarian$fustat)
# print(surv.obj)
# print(ovarian)