# 在探索数据的过程中，最基本的手段就是观察单个变量的取值情况。
# 对于连续变量，可以绘制直方图或密度曲线图

data(anorexia, package = "MASS")
anorexia$wt.change <- anorexia$Postwt - anorexia$Prewt

library(ggplot2)
ggplot(data = anorexia, aes(x = wt.change)) + 
        geom_histogram(binwidth = 2, fill = "skyblue", color = "black") + 
        labs(x = "Weight change (lbs)") + 
        theme_bw()
# 使用fill 设定填充颜色，参数color 用于设定边框颜色

# 我们还可以将直方图和密度曲线同时展示
# 其中, y = ..density.. 用于设定y轴为频率，stat_density 是一种用于计算密度估计曲线的函数
ggplot(data = anorexia, aes(x = wt.change, y = ..density..)) + 
        geom_histogram(binwidth = 2, fill = "skyblue", color = "black") + 
        stat_density(geom = "line", linetype = "dashed", size = 1) + 
        labs(x = "Weight change (lbs)") + 
        theme_bw()

# 密度曲线还能用于对不同数据的分布进行比较，例如，要比较不同治疗方式下体重改变量的分布
# 该命令先将变量Treat映射为颜色和线性，再画图3种治疗方案下的体重改变
ggplot(data = anorexia, aes(x = wt.change, color = Treat, linetype = Treat)) + 
        stat_density(geom = "line", size = 1) + 
        labs(x = "Weight change (lbs)") + 
        theme_bw()

# 此外，箱体图也常用于数值型变量的分布，尤其用于多组之间分布的比较
ggplot(anorexia, aes(x = Treat, y = wt.change, fill = Treat)) +
       geom_boxplot() +
       theme_bw()

# ggpubr 包提供了再平行箱体图上添加组间比较的统计学差异的功能。
# 该包是ggplot2的衍生包，可以用于生成用于论文发表的统计图形。
library(ggpubr)
my_comparisons <- list(c("CBT", "Cont"), c("CBT", "FT"), c("Cont", "FT"))
ggplot(anorexia, aes(x = Treat, y = wt.change, fill = Treat)) + 
      geom_boxplot() + 
      stat_compare_means(comparisons = my_comparisons,
                         method = "t.test",
                         color = "blue") + 
      theme_bw()


# 我们还可以用ggplot 绘制小提琴图
ggplot(data = anorexia, aes(x = Treat, y = wt.change, fill = Treat)) + 
        geom_violin() + 
        geom_point(position = position_jitter(0.1), alpha = 0.5) +
        theme_bw()