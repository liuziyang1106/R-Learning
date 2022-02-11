# 条形图在医学科技论文中经常用到，它通过垂直的或水平的矩阵展示分类变量的频数分布。
# 函数barplot() 可用于绘制条形图

# 以vcd包里的ARthritis数据集为例
library(vcd)
data(Arthritis)
attach(Arthritis)
counts <- table(Improved)       # 生成分类变量的的频数统计
print(counts)

barplot(counts, xlab = "Improvement", ylab = "Freqency", las = 1)

# 展示二维联表数据并添加颜色
counts <- table(Improved, Treatment)
barplot(counts, col = c("red", "yellow", "green"),
        xlab = "Improvement", ylab = "Freqency",
        beside = TRUE, las = 1)
legend("top", legend = rownames(counts), fill = c("red", "yellow", "green"))


# 条形图有时也可以展示不同分类下的均值，中位数，标准差， 置信区间等
# 使用epiDisplay里的aggregate简化绘制
library(epiDisplay)
data(anorexia, package = "MASS")
print(str(anorexia))
attach(anorexia)
aggregate.plot(anorexia$Postwt, by = list(anorexia$Treat),
               error = "sd", legend = FALSE,
               bar.col = c("red", "yellow", "green"),
               ylim = c(0, 100), las = 1,
               main = "")