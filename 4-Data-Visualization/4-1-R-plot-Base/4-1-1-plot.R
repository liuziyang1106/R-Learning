# plot 是一个泛型函数，对于不同类型的数据，它可以绘制出不同的图形。
# 对于数值型数据，他可以绘制出散点图；
# 对于分类型数据，可以绘制出箱体图
# 对于生存模型，可以绘制出生存曲线。
# Example

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# 用上面的数据绘制药物A的剂量和响应关系的图像：
plot(dose, drugA)                   # 默认的type = p 代表点
plot(dose, drugA, type = "b")       # 设置type = b 代表点和线

# plot 用于新建一副图形，我们还可以用低水平作图函数，例如lines(), legend() 在现有图形上添加元素
plot(dose, drugA, type = "b",
    xlab = "Dosage", ylab = "Response",
    lty = 1, pch = 15)
lines(dose, drugB, type = "b", lty = 2, pch = 17)
legend("topleft", title = "Drug Type", legend = c("A", "B"), lty = c(1, 2), pch = c(15, 17))
# 展示了两种不同的线(lty) 和两种不同的点(pch)加以区分。
# 为了增强可读性，还添加了图例 legend, 需要注意的是，函数legend()的点线属性需要和lines()函数设置的一致

