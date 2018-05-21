install.packages("data.table")
library(data.table)
# reference site : https://cran.r-project.org/web/packages/dataPreparation/vignettes/train_test_prep.html
# 1. dataset load
adult <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"), header = FALSE)

typeof(adult)


header_info<- c("age", "type_employer", "fnlwgt", "education", "education_num", "marital", "occupation", "relationship", "race", "sex", "capital_gain", "capital_loss", "hr_per_week", "country", "income")
names(adult) <- header_info

print(head(data, n = 4))
str(data)

# 2. spliting train and test
# Random sample indexes
train_index <- sample(1:nrow(adult), 0.8 * nrow(adult))
test_index <- setdiff(1:nrow(adult), train_index)

# Build X_train, y_train, X_test, y_test
X_train <- adult[train_index, -15]
y_train <- adult[train_index, "income"]

X_test <- adult[test_index, -15]
y_test <- adult[test_index, "income"]


# 3. Scaling
install.packages("dataPreparation")
library(dataPreparation)
scales <- build_scales(dataSet = X_train, cols = c("capital_gain", "capital_loss"), verbose = TRUE)
print(scales)

X_train <- fastScale(dataSet = X_train, scales = scales, verbose = TRUE)
X_test <- fastScale(dataSet = X_test, scales = scales, verbose = TRUE)
head(X_train)
head(X_train[,c("capital_gain", "capital_loss")])

# 4. Discretization                                                     u128  4 RFCCYAAG88
# age 컬럼을 동일 빈도로 10개 그룹으로 이산 분포 생성
bins <- build_bins(dataSet = X_train, cols = "age", n_bins = 10, type = "equal_freq")
print(bins)
X_train <- fastDiscretization(dataSet = X_train, bins = list(age = c(0, 18, 25, 45, 62, +Inf)))
head(X_train)
X_test <- fastDiscretization(dataSet = X_test, bins = list(age = c(0, 18, 25, 45, 62, +Inf)))
print(table(X_train$age))

