# 1 txt and csv
patients.data <- read.table("patients.txt", header = TRUE)

patients.data <- read.csv("patients.txt")

# 2 xls and xlsx
library(openxlsx)
patients.data <- read.xlsx("patients.xlsx", sheet = 1)



# Export Data
write.csv(patients.data, file = "patients_data.csv")