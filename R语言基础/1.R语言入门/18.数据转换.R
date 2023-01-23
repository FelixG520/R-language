#------------------------------------------------------------#
# Chapter 34                                                 #
#------------------------------------------------------------#
#用openxlsx包中的read.xlsx()函数打开mtcars.xlsx文件
install.packages("xlsx")
library(xlsx)
cars32 <- read.xlsx("mtcars-18.xlsx",sheetIndex = 1,header = T)
#is.data——判断数据类型
is.data.frame(cars32)#TURE
is.data.frame(state.x77)#FALSE
dstate.x77 <- as.data.frame(state.x77)#as.data.frame将数据类型强制转换为frame(数据框)类型
is.data.frame(dstate.x77)#TURE
as.matrix(data.frame(state.region,dstate.x77))#as.matrix再转化为矩阵类型
as.vector(dstate.x77)#有些数据类型之间无法转化，比如将数据框转化为向量或因子就不行了
as.factor(dstate.x77)
methods(is)#methods——可以查看is函数的全部内容
methods(as)

x <- state.abb
dim(x) <- c(5,10)#dim()函数来对向量添加维数，从而构建矩阵
x <- state.abb
as.factor(x)#转化成因子类型
as.list(x)#转化成列表类型
state <- data.frame(x,state.region,state.x77)
state$Income#取列
state["Nevada",]#取行
unname(state)#去除列名
unlist(state)#转化为向量

#------------------------------------------------------------#
# Chapter 35                                                 #
#------------------------------------------------------------#
getwd()
list.files()
who <- read.csv("WHO-18.csv",header = T)
#who——对数据取子集
who1 <- who[c(1:50),c(1:10)]#取前50行，10列
who2 <- who[c(1,3,5,8),c(2,14,16,18)]#也可以不连续的提取，取该数据集的1,3,5,8行，2,14,18列
who3 <- who[which(who$Continent==7),]#还可以使用逻辑值来进行筛选，比如使用which函数取出who数据集中continent列的值等于7的数据集合
who4 <- who[which(who$CountryID>50 & who$CountryID<=100),]#还可以使用逻辑值的设置范围进行取值，取出who数据集中CountryID列的值在50到100之间的数据集合
#subset——可以直接使用subset()函数进行子集的提取
?subset
who3=subset(who,who$CountryID>50 & who$CountryID<=100)

#sample——使用sample函数进行随机抽样
?sample
x <- 1:100#设置一个x样本，数据范围在1到100
sample(x,30)#随机取x中的30个样本
sample(x,30,replace = T)#随机取x中的30个样本，但是是有放回的抽样，也就是说样本中可以有重复数字出现
sample(x,60,replace = F)
sort(sample(x,60,replace = T))#sort排序
who3=who[sample(who$CountryID,30,replace = F),]#对数据框进行抽样随机取出了一个子集  

#删除固定行——使用负索引
mtcars[,-1:-5]#逗号在前，删除对应的行
mtcars[-1:-5,]#逗号在后，删除对应的列
mtcars$mpg <- NULL#将列的值赋值给NULL，相当于清空该列的值

#数据框如何进行添加与合并
USArrests
data.frame(state.division,USArrests)#使用data.frame（）直接生成一个新的数据框
cbind(USArrests,state.division)#如果单纯的想添加一列，可以用cbind函数
data1 <- head(USArrests,20)#取数据前20行
data2 <- tail(USArrests,20)#取后20行
rbind(data1,data2)#合并行——要有相同的列名
data3 <- head(cbind(USArrests,state.division),20)
rbind(data3,data2)#列数不匹配 
#处理重复的数据
data1 <- head(USArrests,30)
data2 <- tail(USArrests,30)
data4 <- rbind(data1,data2)
rownames(data4)#rownames取出行名
length(rownames(data4))#length统计数目
duplicated(data4)#duplicated判断重复值
data4[duplicated(data4),]#取出重复值
length(data4[duplicated(data4),])
data4[!duplicated(data4),]#加感叹号取出非重复的部分（感叹号是取反的意思）
length(rownames(data4[!duplicated(data4),]))
unique (data4)#使用unique（）函数一步完成非重复部分的提取
#------------------------------------------------------------#
# Chapter 36                                                 #
#------------------------------------------------------------#
#数据框的翻转
mtcars
sractm <- t(mtcars)#使用t()函数可以实现数据框的转置，行转成列。列转成行
letters
rev(letters)#翻转单独一行可以使用rev()函数
women
women[rev(rownames(women)),]#rownames访问行名，rev进行翻转然后再将翻转后的行名作为索引，取出该行
#修改数据框的值
women$height
women$height*2.54#height列数据的值的单位由英寸转化成厘米
data.frame(height=women$height*2.54,women$weight)#之后使用data.frame()函数重新组合成一个数据框
#但这种方法并不高效可以使用transform()函数
transform(women, height = height*2.54)
transform(women, cm = height*2.54)#如果不想更改原来的数据，也可以直接用transform增加一列

#对数据框进行排序——sort order rank
sort(rivers)#Sort()对向量进行排序，返回的是排序后的结果向量
sort(state.name)
rev(sort(rivers))#rev(sort())则是按照相反的顺序进行排序
mtcars[sort(rownames(mtcars)),]
sort(rivers)#返回的是排序后的结果向量
order (rivers)#Order()也可以对向量进行排序，但返回的是向量元素的索引

mtcars[order(mtcars$mpg),]#按照某一行的元素的大小顺序进行排序
mtcars[order(-mtcars$mpg),]#取相反的顺序，直接在数据前添加一个负号
order(mtcars$mpg,mtcars$disp)#还可以进行多重条件下的排序

#------------------------------------------------------------#
# Chapter 37                                                 #
#------------------------------------------------------------#
#对数据框进行数学计算
WorldPhones
worldphones <- as.data.frame(WorldPhones)
rs <- rowSums(worldphones)#rowsums行的平均数
cm <- colMeans(worldphones)#colmeans函数可以计算列的平均数
total <- cbind(worldphones,Total=rs)#使用cbind()函数可以直接在数据后面添加计算后的一列数据
total2 <- rbind(WorldPhones,meanvalue=cm)#使用rbind()函数可以直接在数据后面添加计算后的一行数据
rbind(total,cm)

#apply系列函数
apply
#wordphones代表要进行求和的数据集，margin是数据的维数，margin=1代表按行，margin=2代表按列，FUN参数代表使用的函数
apply(WorldPhones,MARGIN = 1,FUN = sum)#apply()函数对数据框的每一行进行求和
apply(WorldPhones,MARGIN = 2,FUN = mean)#对数据框的每一列进行求平均值
apply(WorldPhones,MARGIN =  2,FUN =log)#对数据框的每一列进行求log值（对数值）
#lapply返回值是列表 和 sapply返回的是向量或者矩阵
state.center
lapply(state.center,FUN = length)#统计一下列表中元素的个数因为列表中不存在行和列，所以不需要有margin参数，返回的结果值是一个列表
sapply(state.center,FUN = length)#返回向量值
#tapply用于处理因子数据，根据因子来分组，然后根据分组来处理
state.name
state.division
tapply(state.name,state.division,length)#计算每个类型区中州的数量

#数据的中心化与标准化处理（为了消除数据量纲对数据的影响）scale and center
#中心化，是指数据集中的各项数据减去数据集的均值
#标准化，是指在中心化之后再除以数据集的标准差，即数据集汇总的各项数据减去数据集的均值再除以数据集的标准差
state.x77
heatmap(state.x77)

x <- c(1,2,3,6,3)
mean(x)#计算均值
x - mean(x)#中心化
sd(x)#计算标准差
(x -mean(x))/sd(x)#标准化

?scale
#当scale()函数中的两个参数都为True时，就是做中心化（center=T）和标准化处理（scale=T）
scale(state.x77,center = T)
scale(state.x77,scale = T)
x <- scale(state.x77,scale = T,center = T)
#经过中心化和标准化处理过后的数据，在绘制heatmap时会比较精确，对比性比较强
heatmap(x) 



