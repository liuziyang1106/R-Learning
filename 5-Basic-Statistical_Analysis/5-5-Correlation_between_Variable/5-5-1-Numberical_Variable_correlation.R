# 连续型变量间的相关性
# 相关系数常用于描述两个连续性变量之间的关系。
# 其符号表明关系的方向，其值反应关系的强弱

data(birthwt, package = "MASS")
library(dplyr)
# 首先将数据集中的分类变量转换成因子
birthwt <- birthwt %>% mutate(low = factor(low, labels = c("no", "yes")),
                              race = factor(race, labels = c("white", "black", "other")),
                              smoke = factor(smoke, labels = c("no", "yes")),
                              ht = factor(ht, labels = c("no", "yes")), 
                              ui = factor(ui, labels = c("no", "yes")))
print(str(birthwt))
cont.var <- dplyr::select(birthwt, age, lwt, bwt)

# 1 Pearson、Spearman和Kendall's Tau 相关系数
conv <- cov(cont.var)
p_cor <- cor(cont.var, method = "pearson")
sp_cor <- cor(cont.var, method = "spearman")
print(conv)
print(p_cor)
print(sp_cor)


# 2、 相关系数假设检验
# 函数cor.test() 可用于相关系数的检验
print(cor.test(birthwt$lwt, birthwt$bwt))
