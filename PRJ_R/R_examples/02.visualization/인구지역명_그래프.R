ku <- read.csv("/Users/1003849/Bigdata/R_workspace/PRJ_R/R_examples/data/광역시-구 인구.csv", header=T)
ku

head(ku)
str(ku)

attach(ku)
boxplot(인구~지역명)

shi <- reorder(지역명, 지역코드)
boxplot(인구~shi)

boxplot(인구~shi, width=table(shi))

table(shi)
Encoding("data/광역시-구 인구.csv")
