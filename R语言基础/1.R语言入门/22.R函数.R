#使用lm()函数进行回归分析
#首先将数据转化为数据框，因为lm()函数只能对数据框进行操作
state <- as.data.frame(state.x77[,c('Murder','Population','Illiteracy','Income','Frost')])
class(state)
#再使用lm()函数进行回归分析，研究人口、文盲率、收入以及天气对犯罪率的影响
#后面的*代表数据的显著性，数据中，文盲率的回归系数是4.14，
#表示其他数据不变时，文盲率上升1%，则犯罪率上升4.14%，
#且回归系数在p<0.001的情况下，显著不为0，也就是显著。而如果数据不显著，则说明两者没有直接关系。
fit<- lm (Murder ~ Population+Illiteracy+Income+Frost,data=state)
#使用summary()得出统计结果
summary(fit)
ls()#列出环境中R的对象
Sys.Date()#返回当前系统时间
a <- 1:100
rm(a)#删除指定的变量，但是这个函数是直接删除，不会有返回
?heatmap
help(sort)#可以使用help()函数查看每个函数的帮助文档
help(heatmap)