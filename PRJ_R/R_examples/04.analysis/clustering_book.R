###################################################################
# 군집분석

x = matrix(rnorm(100), nrow=5)
dist(x)
?dist
dist(x, method= "manhattan")
dist(x, method= "maximum")



###################################################################
# 계층형 군집분석

x = matrix(rnorm(100), nrow=5)
dist(x)
par(mfrow=c(2,2))
plot(h<-hclust(dist(x), method = "single"))
plot(h<-hclust(dist(x), method = "complete"))
plot(h<-hclust(dist(x), method = "average"))
plot(h<-hclust(dist(x), method = "centroid"),hang=-1)
plot(h<-hclust(dist(x), method = "centroid"))
?hclust


############################################################################
# 계층형 군집분석

install.packages("cluster")
library(cluster)
result <- read.csv("data\\oj_clustering.csv");
View(result) 

result2 <- hclust(dist(result), method="ave")  
names(result2) 
result2$order
plot(result2, hang=-1, lables=result2$ID)

plot(result) 

install.packages("corrgram") 
install.packages("TSP")
install.packages("scales")
library(TSP)
library(corrgram) 
corrgram(result) 
corrgram(result, upper.panel=panel.conf)
corrgram(result, lower.panel=panel.conf) 
install.packages("PerformanceAnalytics") 
library(PerformanceAnalytics) 
chart.Correlation(result, histogram=, pch="+")
?chart.Correlation





c<-kmeans(result[,c("Monetary","Frequency")], 4)
c<-kmeans(result, 3)
c
plot(result[,c("Monetary","Frequency")]
     , col=c$cluster)


############################################################################
# kmeans

k<-kmeans(x, 3, iter.max = 10, nstart = 1,
       algorithm = c("Hartigan-Wong", "Lloyd", "Forgy","MacQueen"))
(k<-kmeans(x, 3, iter.max = 10))
x
dist(x)
k$size
k$cluster
plot(x,k$cluster )














###################################################################
# 군집분석 - 알고리즘

x = matrix(rnorm(100), nrow=5)
x
k<-kmeans(x, 3, iter.max = 10, nstart = 1,
          algorithm = c("Hartigan-Wong", "Lloyd", "Forgy","MacQueen"))
(k<-kmeans(x, 3, iter.max = 10))
k$size
k$centers
k$cluster



####################################################################
# k-means clustering에서 적정한 cluster 수 찾기                    #
####################################################################
wss<-0
for(i in 1:15) 
  wss[i]<-kmeans(wine_s,centers=i)$tot.withinss
plot(1:15,wss,type="b",xlab="Number of Cluster", ylab="Within group sum of squares")






















