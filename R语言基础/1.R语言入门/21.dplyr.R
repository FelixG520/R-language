library(dplyr)
ls("package:dplyr")#列出dplyr中所有函数
#可以使用filter函数用指定条件对数据进行筛选
dplyr::filter (iris,Sepal.Length >7)#筛选掉花萼长度在7以下的数据，保留在7以上的数据
#distinct函数可以用于去除重复行，相当于unique函数的功能
dplyr::distinct(rbind(iris[1:10,],iris[1:15,]))#保留1-15行的数据
#Slice函数可以用于切片，可以取出数据的任意行
dplyr::slice(iris,10:15)#取出iris数据的10-15行
#Sample_n函数用于随机取样
dplyr::sample_n(iris,10)#在iris这个数据中随机抽取10行
#Sample_frac表示按比例随机选取
dplyr::sample_frac(iris,0.1)#抽取源数据的10%的数据，是指百分比
#arrange函数用于排序
dplyr::arrange(iris,Sepal.Length)#将iris数据按照花萼长度进行排序（正向）
dplyr::arrange(iris,-Sepal.Length)#前面加上负号则是进行反向排序（从大到小）
dplyr::arrange(iris,desc(Sepal.Length))#
#summarise()函数进行统计
summarise(iris,avg=mean(Sepal.Length))#统计花萼长度的平均值
summarise(iris,sum=sum(Sepal.Length))#统计花萼长度的和

#%>% 这个符号是链式操作符，它的功能是用于实现将一个函数的输出传递给下一个函数，作为下一个函数的输入
#在键盘上可以用Ctrl+shift+M的快捷键打出来，有点类似于“且”的概念

#先使用head函数取出数据集的前20行，再使用链式操作符，
#可以将这20行数据作为下一个命令的输入，如下一个命令是tail（10），
#也就是取出倒数10行，那么就会取出这20行数据的第11-20行
head(mtcars,20) %>% tail(10)
#Group_by函数可以对数据进行分组
dplyr::group_by(iris,Species)#根据species这列对数据进行分组
#如果用链式操作符，代码可以改为：
iris %>% group_by(Species)
#结合summarize统计函数进行进一步的计算
iris %>% group_by(Species) %>% summarise(avg=mean(
  Sepal.Width))#计算每一种类型鸢尾花品种的花萼宽度的平均值
iris %>% group_by(Species) %>% summarise(avg=mean(
  Sepal.Width)) %>% arrange(avg)#在此基础上，还可以使用链式操作符，对宽度的平均值进行排序
#mutate函数可以添加新的变量
dplyr::mutate(iris,new=Sepal.Length+Petal.Length)#使用mutate函数在iris数据中增加一行，该行数据是花萼与花瓣长度的总和

#dplyr包对于双表格的操作，先创建两个数据框，分别是a,b
a=data.frame(x1=c("A","B","C"),x2=c(1,2,3))
b=data.frame(x1=c("A","B","D"),x3=c(T,F,T))
#左连接，left_join()
dplyr::left_join(a,b,by="x1")#以a的x1列为基础进行连接
#右连接，right_join()
dplyr::right_join(a,b,by="x1")#以b的x1列为基础进行连接
#内连接，inner_join()
dplyr::inner_join(a,b,by="x1")#取x1的交集
#全连接，full_join()
dplyr::full_join(a,b,by="x1")#取x1的并集
#半连接，semi_join()
dplyr::semi_join(a,b,by="x1")#根据右侧表的内容对左侧表进行过滤，也就是将两个表的数据的交集取出来
#反连接，anti_join()
dplyr::anti_join(a,b,by="x1")#输出两个表的补集部分，也就是取出数据框a中b不含有的行

#数据框的合并操作
first <- slice(mtcars,1:20)
#由于slice函数取出的数据不含行名，需要在取出数据前用mutate函数添加一列行名
mtcars <- mutate(mtcats,Model=rownames(mtcars))
first <- slice(mtcars,1:20)
second <- slice (mtcars,10:30)
#Intersect()取交集
intersect(first, second)
#Union_all()取并集
union_all(first, second)
#Union()取非冗余的并集，去除掉重复部分再进行合并
union(first, second)
#setdiff()取数据的补集
setdiff(first, second)#取出frist数据中second数据没有的部分
setdiff(second, first) 
