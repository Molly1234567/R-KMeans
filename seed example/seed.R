install.packages("rattle")
library("foreign")
library(rattle)
dataseed=read.table("seeds_dataset.txt",header=FALSE,sep="\t")
names(dataseed)=c("area","perimeter","compactness","kernel_length","kernel_width","asymmetry_coefficient","kernelgroove_length","variety")
dataseed=na.omit(dataseed)
summary(dataseed)
#change the variables name
dataseed$variety=factor(dataseed$variety,levels = c("1","2","3"),labels=c("Kama","Rosa","Canadian"))
View(dataseed)
str(dataseed)
summary(dataseed$variety)

seed=dataseed
seed$variety=NULL

#seed(3) withinss:547.1061
#seed(2) withinss:548.0101
#seed(1) withinss:548.0101
#seed(5) withinss:547.1061
#seed(6) withinss:547.1061
set.seed(3)
#3 clusters
model=kmeans(seed,3)
model
model$size
model$cluster
#(Within Cluster Sum of Squares) smaller is good
model$tot.withinss
model$withinss
#(Between Cluster Sum of Squares) bigger is good
model$betweenss
model$centers
table(dataseed$variety,model$cluster)
#2 clusters is bad
model1=kmeans(seed,2)
table(dataseed$variety,model1$cluster)
#plot
plot(seed[c("kernel_length","kernel_width")],col=model$cluster)
points(model$centers[,c("kernel_length","kernel_width")],col=1:3,pch=8,cex=2)



