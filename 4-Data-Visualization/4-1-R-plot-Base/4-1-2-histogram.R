# 直方图 histogram 是用于展示连续性变量分布的最常用工具，它本质上是对密度函数的一种估计
# 使用hist()函数绘制直方图
# 以anorexia 为例
data(anorexia, package = "MASS")
print(str(anorexia))
attach(anorexia)
hist(Prewt)
plot(density(Prewt)) # 密度曲线为数据的分布提供一种更为平滑的描述

# 将一幅直方图添加一条密度曲线和轴须图。此时需要在函数hist()里面设定freq 为FALSE
# 参数las 设为1 是为了将纵轴的刻度标签横向显示

hist(Prewt, freq = FALSE, col = "red", 
    xlab = "体重(labs)",
    main = "治疗前体重分布直方图",
    las = 1)
lines(density(Prewt), col = "blue", lwd = 2)
rug(Prewt)   # 添加轴须图，以展示数据分布的密集趋势
detach(anorexia)