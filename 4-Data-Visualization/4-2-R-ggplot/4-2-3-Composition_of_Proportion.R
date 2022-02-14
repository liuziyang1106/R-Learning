# 许多数据会涉及到比例的问题，提取比例信息能使我们了解各个组成对于整体的重要性。
# 比例的构成常用条形图展示
library(ggplot2)
data(Arthritis, package = "vcd")
# 绘制出叠加条形图，是为了再一幅图中同时展示多个变量。
ggplot(Arthritis, aes(x = Treatment, fill = Improved)) + 
        geom_bar(color = "black") + 
        scale_fill_brewer() + 
        theme_bw()

# 我们可以把参数position设为dodge，将条形图并排放置
ggplot(Arthritis, aes(x = Treatment, fill = Improved)) + 
        geom_bar(color = "black", position = "dodge") + 
        scale_fill_brewer() + 
        theme_bw()