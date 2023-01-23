#列表顾名思义就是用来存储很多内容的一个集合，在其他编程语言中列表一般和数组是等同的，
#但是在R语言中，列表却是R中最复杂的一种数据结构，也是非常重要的一种数据结构。
#列表就是一些对象的有序集合。列表中可以存储若干向量、矩阵、数据框，甚至其他列表的组合。
#1、在模式上和向量类似，都是一维数据集合。
#2、向量只能存储一种数据类型，列表中的对象可以是R中的任何数据结构，甚至列表本身。

State.center#就是一个典型的列表，是美国每个周的经纬度，可以使用list()函数来创建列表：
a <- 1:20 
b <- matrix(1:10,4)
c <- mtcars
d <- "This is a test list"
a;b;c;d


#创建列表
mlist <- list(a,b,c,d)
#为每个对象添加名称
mlist <- list(first=a,second=b,third=c,forth=d)
mlist
#列表的访问
mlist[1]#访问列表第一个元素——a
mlist[c(1,4)]#访问列表第1，4个元素——mlist[1,4]这种写法错误
#名称访问
state.center[c("x","y")]
#$访问
mlist$first
state.area$x
#[]访问
mlist[1]#输出的是列表类型
class(mlist[1])
mlist[[1]]#输出的是元素本身的类型
class(mlist[[1]])

#列表修改 
mlist[[5]] <- iris3#添加——必须是[[]]
mlist <- mlist[-5]#删除——负索引
mlist[[5]] <- NULL#删除——赋值NULL


