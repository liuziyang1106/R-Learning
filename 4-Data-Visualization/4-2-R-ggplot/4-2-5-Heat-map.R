# 热图是将一个矩阵中的元素数值用不同颜色表达，并对矩形的行列层次聚类的一种颜色图
# 通过热图不仅可以直接观察矩阵中数值分布情况
# stats包中的函数heatmap 可用于制作热图。
data(mtcars)
dat <- scale(mtcars)
class(dat)
heatmap(dat)