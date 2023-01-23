?iris
head(iris)
getwd()
dir()#查看当前工作目录所有文件

#saveRDS——创建Rdse文件
saveRDS(iris,file="iris-17.RDS")#Rdse文件是保存数据集的文件，比如iris数据
rdsdata <- readRDS("E:/高帆的R语言/R语言基础/iris-17.RDS")#readRDS读取RDS文件
rdsdata

#load()函数可以直接打开Rdata文件
load(file = "E:/高帆的R语言/RData/Ch02.R")
#save将数据存储到Rdata文件
save(iris,iris3,file = "iris-17.Rdata")#Rdata文件类似于工程文件，会存储所有导入的数据集和处理的数据
save.image()#保存当前工作空间的所有对象