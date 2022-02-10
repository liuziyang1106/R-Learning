library(epiDisplay)
data(Familydata)

# 将数据按照某个变量进行排序
# 默认是从小到大，如果改为倒序，设置参数decreasing 为 TRUE
sort_by_age_dat <- Familydata[order(Familydata$age),]
print(sort_by_age_dat)