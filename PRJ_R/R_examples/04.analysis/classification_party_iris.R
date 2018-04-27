# party ##############################################
install.packages("party")
library(party)
data(iris)

# modeling  
myformula<-Species~.
iris_ctree<-ctree(myformula,data=iris)
plot(iris_ctree)

# accuracy
table(predict(iris_ctree),iris$Species)
x<-table(predict(iris_ctree),iris$Species)

# 정확도확인 방법1
diag(x)
sum(diag(x))/sum(x)  

# 정확도확인 방법2
prop.table(x)  

# 정확도 확인 방법3
install.packages("caret")
library(caret)

confusionMatrix(x) 








#predition ######################################################

# sampling 
ind<-sample(2,nrow(iris),replace=T,prob=c(0.7,0.3)) 
traindata<-iris[ind==1,]
testdata<-iris[ind==2,]

train<-ctree(myformula,data=traindata)

# prediction
testpred<-predict(train,newdata=testdata)

# accuracy
y<-table(testpred,testdata$Species)
sum(diag(y))/sum(y)

?sample

