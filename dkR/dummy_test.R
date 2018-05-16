data <- read.csv("/Users/1003849/Bigdata/R_workspace/dkR/WA_Fn-UseC_-Telco-Customer-Churn.csv")
# 1. check data structure
str(data)
head(data,3)
summary(data)

install.packages("dummies")
library(dummies)
# new_data <- dummy.data.frame(data, dummy.classes = "gender")
new_data <- dummy.data.frame(data)
new_1 <- dummy(data$gender)
new_2 <- dummy("gender", data, sep = "_", drop = TRUE)
new_3 <- dummy(c("Partner","gender"), data)

new_4 <- dummy.data.frame(data, names = c("gender","Partner"))
head(new_4)

new_5 <- get.dummy(data, 'gender')
head(new_5)

head(data$Partner)

head(new_1)
head(new_2)
head(new_data,3)
