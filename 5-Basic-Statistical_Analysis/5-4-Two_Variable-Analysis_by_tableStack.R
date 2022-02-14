# 医学研究论文中第一个表格常是基线数据按结果变量分组描述的表格
# 通常把结果变量置于列的位置，自变量置于行的位置
# 但是变量中会存在多种类型，并且检验方式不相同，如果逐一处理，非常麻烦
# epiDisplay中的tableStack可以轻松实现。

# 首先将数据集中的分类变量转化为因子型。
data(birthwt, package = "MASS")
birthwt <- birthwt %>% mutate(low = factor(low, labels = c("no", "yes")),
                              race = factor(race, labels = c("white", "black", "other")),
                              smoke = factor(smoke, labels = c("no", "yes")),
                              ht = factor(ht, labels = c("no", "yes")), 
                              ui = factor(ui, labels = c("no", "yes")))

print(str(birthwt))

# 然后为DataFrame里的变量加上标签
attr(birthwt, "var.labels") <- c("Low birth weight",
                                 "Mother's age (yr)",
                                 "Mother's weight (lbs)",
                                 "Mother's race",
                                 "Smoking status",
                                 "Number of premature births",
                                 "History of hypertension",
                                 "Uterine irritablity",
                                 "Number of physician visits",
                                 "Birth weights (g)"
                                 )
print(des(birthwt))

# 如果我们关注的是新生儿的体重，那么因子型变量low 就是结果变量。
# 现在我们以整齐的叠加格式创建一个包含多个变量的统计汇总表
# 暂将解释变量选为age， lwt， race， smoke
library(epiDisplay)
mytable <- tableStack(vars = age:ftv, by = low, dataFrame = birthwt)
print(mytable)

# 这里的vars 的变量名也可以使用变量对应的序号代替
mytable <- tableStack(vars = 2:9, by = low, dataFrame = birthwt)

# tableStack函数会自动对变量进行shapiro-wilk检验和bartlett检验，并选择恰当的统计量和进行组间比较
# tablestack 函数会选择较为保守的0.01 作为显著性p值。
# 我们可以通过参数assumption.p.value改变这个默认值。
mytable <- tableStack(vars = 2:9, by = low, dataFrame = birthwt, assumption.p.value = 0.005)
print(mytable)

# 最后，我们可以用函数write.csv()把函数tablestack的结果导出到一个csv文件
write.csv(mytable, file = "table_stack_result.csv")