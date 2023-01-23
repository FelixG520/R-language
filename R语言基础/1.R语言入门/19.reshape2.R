#reshape2包的使用
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5),
                data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5),
                data = 1:5)
rbind(x,y)#这样合并就乱了，分不清哪一部分是x，哪一部分是y
#使用merge()函数可以根据一个或多个共有的变量来进行合并，合并两组数据中共有变量列中相同的行
merge(x, y, by = "k1")#以k1作为共有变量合并
merge(x,y,by = "k2",incomparables = NA)#以k2作为共有变量合并，并排除有NA的情况
merge(x, y, by = c("k1","k2")) #同时合并k1和k2 
#reshape2包是一个重构和整合数据的万能工具，可以把数据转化成任何想要的形式
install.packages("reshape2")
library(reshape2)
help(package="reshape2")
?melt
?dcast
?acast
#使用airquality数据为例
names(airquality) <- tolower(names(airquality))#使用toloower()函数将列名改写成小写
head(airquality)
aql <- melt(airquality) #使用melt()函数融合数据，融合之后，每一行都是唯一的标识符~变量的组合
head(aql)
head(aql,50)
#Id参数是用于告诉melt()函数哪一行或者那一列用作观测，而剩余的数据作为观测值
aql <- melt(airquality, id.vars = c("month", "day"))
head(aql,) 

#处理数据框使用dcast()函数
aqw <- dcast(aql, month + day ~ variable)#Formula参数用于描述数据的形状，“~”在R中代表两者相关联
aqw <- dcast(aql, month ~ variable)
head(aqw)

head(airquality) 
dcast(aql, month ~ variable)
##也可以只重构月数据，并对日数据求平均值，求一个月的平均值，还可以使用na.rm()去除缺失值
dcast(aql, month ~ variable, fun.aggregate = mean, na.rm = TRUE)
dcast(aql, month ~ variable, fun.aggregate = sum, na.rm = TRUE)