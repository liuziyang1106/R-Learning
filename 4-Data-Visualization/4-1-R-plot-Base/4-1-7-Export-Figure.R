data(anorexia, package = "MASS")
print(str(anorexia))
attach(anorexia)

anorexia$wt.change <- anorexia$Postwt - anorexia$Prewt

pdf("R-Learning/4-Data-Visualization/4-1-R-plot-Base/mygraph.pdf")
boxplot(wt.change ~ Treat, data = anorexia,
        ylab = "Weight change (lbs)", las = 1)
dev.off()

# 除了pdf，我们还可以使用函数png(),jpeg(),tiff() and postscript()
# bmp，png和jpeg格式的文件都是非矢量格式，容易收到分辨率的影响。
# ps格式的图形文件时矢量格式，它与分辨率无关，是个运用于排版印刷。
# tiff格式图像可以支持很多色彩系统，而且独立于操作系统
tiff(filename = "R-Learning/4-Data-Visualization/4-1-R-plot-Base/mygraph.tiff",
    width = 15, height = 12, units = "cm", res = 300)
boxplot(wt.change ~ Treat, data = anorexia,
        ylab = "Weight change (lbs)", las = 1)
dev.off()