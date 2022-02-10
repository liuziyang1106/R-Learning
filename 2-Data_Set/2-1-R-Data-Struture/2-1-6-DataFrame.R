# Data Frame 是由一个行和列组成的二维结构，其中行表示观测或记录，列表示变量。

ID <- 1:2
sex <- c("male", "famale")
age <- c(25, 34)
pain <- c(1, 3)
pain.f <- factor(pain, levels = 1:3, labels = c("mild", "medium", "servere"))
patients <- data.frame(ID, sex, age, pain.f)
print(patients)

# DataFrame 本质上也是一种列表，也可以显示或使用数据框中的某个变量
print(patients$age)
print(mean(patients$age))