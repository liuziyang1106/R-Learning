# ggsave 专门用于保存ggplot包绘制的图形，该函数可以导出多种不同格式的图片
library(ggplot2)
data(Arthritis, package = "vcd")
# 绘制出叠加条形图，是为了再一幅图中同时展示多个变量。
p <- ggplot(Arthritis, aes(x = Treatment, fill = Improved)) + 
        geom_bar(color = "black") + 
        scale_fill_brewer() + 
        theme_bw()

ggsave("my_bar.tiff", width = 15, height = 12, units = "cm", dpi = 500)
