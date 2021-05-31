install.packages("rattle")
library("foreign")
library(rattle)
data=read.csv("BreastTissue.csv",header=T)
View(data)
summary(data)
data$Case..=NULL
data$Class=factor(data$Class)
summary(data$Class)

dataNew=data
dataNew$Class=NULL
set.seed(2)
#5 clusters
model=kmeans(dataNew,5)
model
model$size
model$cluster
model$centers
model$tot.withinss
model$withinss
#via 5 clusters,the car focuses on the fifth clusters, fad,gla,mas focuse on the third clusters.
table(data$Class,model$cluster)
#plot
plot(dataNew[c("DA","A.DA")],col=model$cluster)
points(model$centers[,c("DA","A.DA")],col=1:5,pch=8,cex=2)


