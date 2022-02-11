# ggplot2 弥补了R基础绘图中函数缺乏一致性的缺点。
# 想象有一张空白的画布，我们需要定义可视化的数据，以及数据变量到图形的映射

library(ggplot2)
# aes 代表美学aesthetics元素,我们把需要映射的变量都放到函数中
# 直接运行p得到的只是一个空白的画布，还需要定义用什么样的图形来描述数据
p <- ggplot(data = mtcars, mapping = aes(x = wt, y = mpg))

# 以geom开头的一些列函数用于指定图形元素
p + geom_point()

# 除了坐标轴，还可以变量映射到颜色，大小，形状等属性
mtcars$am <- factor(mtcars$am)  # 将数值变量转换成二分类变量
mtcars$vs <- factor(mtcars$vs)
ggplot(data = mtcars, aes(x = wt, y = mpg, color = am)) + geom_point()
ggplot(data = mtcars, aes(x = wt, y = mpg, shape = am)) + geom_point()
ggplot(data = mtcars, aes(x = wt, y = mpg, shape = am, color = am)) + geom_point()

# 上面的图形都是原始数据的展示，有时候需要对原始数据及逆行归纳
# 例：散点拟合曲线
ggplot(data = mtcars, aes(x = wt, y = mpg, color = am)) + geom_smooth()
# geom_smooth()默认使用loess局部加权回归，如果想换一种拟合方法，可以改变method 参数
ggplot(data = mtcars, aes(x = wt, y = mpg, color = am)) + geom_smooth(method = "lm")

# 如果只想显示一条平滑线，就需要在geom_point函数中单独设置颜色的映射
ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point(aes(color = am)) + stat_smooth()

# 如果需要自己设定颜色等参数，需要使用scale函数
# 同样，ggplot 中有众多以scale开头的函数用于调整不同属性
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
     geom_point(aes(color = am)) +
     scale_color_manual(values = c("blue", "red")) +
     stat_smooth()

# ggplot 还能实现lattice包中的分组绘图功能，即分面。
# 分面是将整个数据按照某一个或多个分类变量分成多个子集，然后用这些子集分别做图
# 例：按照变量am的两个水平分别展示
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
        geom_point() +
        stat_smooth() +
        facet_grid(~am)

# ggplot包中的主题 theme 用于定义绘图的风格
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
        geom_point() +
        stat_smooth() +
        facet_grid(~am) +
        theme_grey()