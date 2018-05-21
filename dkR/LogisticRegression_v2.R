data <- read.csv("/Users/1003849/Bigdata/R_workspace/dkR/WA_Fn-UseC_-Telco-Customer-Churn.csv")
# 1. check data structure
str(data)
head(data,3)
summary(data)
dim(data)

# 2. Explore the data
# install.packages("dplyr")
library(dplyr)
typeof(data)
data

data %>% 
  select(customerID, SeniorCitizen, Contract, tenure, MonthlyCharges, TotalCharges, Churn) %>% 
  mutate(TotalFee = tenure * MonthlyCharges)

data$Contract <- gsub(" ", "_",data$Contract)


# 3. major variable select
# 독립변수 : 명목(SeniorCitizen, Contract), tenure, MonthlyCharges
# 종속변수 : Churn
major_variable <- c("SeniorCitizen", "Contract", "tenure", "MonthlyCharges", "Churn")
data_new <- data[major_variable]
head(data_new,3)
str(data_new)
# SeniorCitizen 데이터 타입 변환 : int -> factor
data_new$SeniorCitizen <- as.factor(data_new$SeniorCitizen)
str(data_new)

# 4. dummy variable chagne
# install.packages("dummies")
library(dummies)
data_new <- dummy.data.frame(data_new, name = c("Contract","SeniorCitizen"), sep = "_")
head(data_new)
delete_col <- c("SeniorCitizen_0", "Contract_Month-to-month")
data_new <- data_new[, !(names(data_new)) %in% delete_col]
head(data_new)

# 5. spilt data
# Random sample indexes
set.seed(19810521)
train_index <- sample(1:nrow(data_new), 0.8 * nrow(data_new))
test_index <- setdiff(1:nrow(data_new), train_index)

# Build X_train, y_train, X_test, y_test
# X_train <- data_new[train_index, -6]
# y_train <- data_new[train_index, "Churn"]
# X_test  <- data_new[test_index, -6]
# y_test  <- data_new[test_index, "Churn"]
X_train <- data_new[train_index, ]
X_test  <- data_new[test_index,]
head(X_train)
head(X_test)

# 6. Scaling (mean to 0, standard deviation to 1)
# install.packages("dataPreparation")
library(dataPreparation)
scales <- build_scales(dataSet = X_train, cols = c("tenure", "MonthlyCharges"), verbose = TRUE)
print(scales)

X_train <- fastScale(dataSet = X_train, scales = scales, verbose = TRUE)
X_test <- fastScale(dataSet = X_test, scales = scales, verbose = TRUE)
head(X_train)
head(X_train[,c("tenure", "MonthlyCharges")])

# 7. Logistic Regression Model 생성
X_train
model <- glm(Churn ~ SeniorCitizen_1 + Contract_One_year + Contract_Two_year + tenure + MonthlyCharges, data = X_train, family = "binomial")
summary(model)
predict <- predict(model, new_data =  X_test, type = 'response')
predict

# Recode factors
y_pred_num <- ifelse(predict > 0.5, 1, 0)
y_pred <- factor(y_pred_num, levels=c(0, 1))
y_pred
y_act <-  ifelse(X_test$Churn == "Yes", 1, 0)
typeof(y_pred)
typeof(y_act)
y_pred
y_act

# Accuracy
mean(y_pred == y_act) # 63%


# 8. model 
# install.packages("pscl")
# library(pscl)
predict <- predict(model, type = 'response')
# congusion matrix
table(X_train$Churn, predict > 0.5)


