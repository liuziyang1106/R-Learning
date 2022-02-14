# 如果数据无法满足t检验或者方差分析的假设，我们可以采用非参数方法
# 对于两组独立样本，可以使用wilcoxon秩和检验来评估观测值是否从相同分布抽得

print(wilcox.test(bwt ~ smoke, data = birthwt))

# 对于多于两组之间比较的情况，
# 如果各组之间独立，可以使用Kruskal-Wallis 检验
# 如果各组不独立，则应使用Friedman M 检验。
print(kruskal.test(bwt ~ race, data = birthwt))