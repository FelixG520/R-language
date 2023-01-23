#因子的应用：计算频数、独立性检验、相关性检验、方差分析、主成分分析、因子分析
mtcars
mtcars$cy1#4、6、8就是这一列因子的水平
table(mtcars$cyl)#table()频数统计
table(mtcars$am)#table()频数统计

#如何定义因子(将向量转化为因子)
f <- factor(c("red","red","green","blue","green","blue","blue"))
f
week <- factor(c("Mon","Fri","Thu","Wed","Mon","Fri","Sun"))
week
week <- factor(c("Mon","Fri","Thu","Wed","Mon","Fri","Sun"),order = TRUE,
               levels = c("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))
week#可以在定义因子的时候人为指定level的水平

fcyl <- factor(mtcars$cyl)#使用factor()函数将向量转变成因子
fcyl
plot(mtcars$cyl)
plot(factor(mtcars$cyl))

num <- c(1:100)
cut (num,c(seq(0,100,10)))#有规律的分组可以用cut函数——每隔10个数为1组

#因子类型的数据
state.division
state.region