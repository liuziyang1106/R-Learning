# 箱线图，常用于展示数据的大致分布特征，也用于探索异常值和离群点
# 函数boxplot() 可用于绘制箱线图。
# 以anorexia数据为例，体现体重前后辩护的分布

data(anorexia, package = "MASS")
print(str(anorexia))
attach(anorexia)

anorexia$wt.change <- anorexia$Postwt - anorexia$Prewt
boxplot(anorexia$wt.change, ylab = "Weight change (lbs)", las = 1)
# 展示了中位数、上下四分位数、上下边缘

#平行并列的箱线图可以用于比较某个分类变量各个类别下某指标的分布
boxplot(wt.change ~ Treat, data = anorexia,
        ylab = "Weight change (lbs)", las = 1)
# 函数 boxplot() 第第一个参数输入的实际上是一个公式。
# R里公式一般用符号 ~ 链接变量。 ~ 左边可以看作因变量，右边为自变量


# 小提琴图可以看作是箱体图和密度图的结合
# vioplot 包里的函数vioplot() 可以用作绘制小提琴图
library(vioplot)
vioplot(wt.change ~ Treat, data = anorexia,
        ylab = "Weight change (lbs)", las = 1, col = "gold")