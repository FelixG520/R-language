#数据框是一种表格式的数据结构。数据框旨在模拟数据集，与其他统计软件例如SAS或者SPSS中的数据集的概念一致。

#数据集通常是由数据构成的一个矩形数组，行表示观测，列表示变量。不同的行业对于数据集的行和列叫法不同。
#数据框是一种表格式的数据结构。数据框旨在模拟数据集，与其他统计软件例如SAS或者SPSS中的数据集的概念一致。

#数据框实际上是一个列表。列表中的元素是向量，这些向量构成数据框的列，每一列必须具有相同的长度，
#所以数据框是矩形结构，而且数据框的列必须命名。
#1、数据框形状上很像矩阵;
#2、数据框是比较规则的列表;
#3、矩阵必须为同一数据类型;
#4、数据框每一列必须同一类型，每一行可以不同。

#R中数据集——数据框
iris3
mtcars
rock

#数据框的创建——data.frame()
state.name
state.abb
state.region
state.x77
state <- data.frame(state.name,state.abb,state.region,state.x77)
state

#数据框的访问
state[1]#输出数据框第1列
state[c(2,4)]#输出数据框第2,4列——数据框输出还是数据框
state[-c(2,4)]#负索引删除这部分内容
#名称访问
state[,"state.abb"]
state["Alabama",]
#$访问——快速取出任意一列
state$Murder
state$state.name
women
plot(women$height,women$weight)#绘制height和weight的散点图
lm(weight~height,data=women)#线性回归
#attach()加载数据库到R搜索目录中
attach(mtcars)
mpg
hp
rownames(mtcars)
colnames(mtcars)
cyl
detach(mtcars)#使用完之后可以使用detach()函数取消加载
hp
cyl
#with()函数也有类似功能
with(mtcars,{hp})
with(mtcars,{mpg})
with(mtcars,{sum(mpg)})
#数据框也可以使用双中括号的方式进行访问，返回的是向量而不是列表。








