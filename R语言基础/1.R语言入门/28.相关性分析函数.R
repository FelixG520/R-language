#，相关系数包括：pearson相关系数、spearman相关系数、kendall相关系数、偏相关系数、多分格相关系数和多系列相关系数
#与独立性检验不同，相关性分析中每种方法都没有独立的函数，这里面计算相关性系数都使用同一个函数：cor()函数。

#cor()函数可以计算三种相关性系数，包括pearson相关系数、spearman相关系数和kendall相关系数，
#具体使用哪种方法可以使用选项参数中的参数method来指定（默认是用pearson相关系数）
#函数中还有一个use选项，用于指定如何对待缺失值，是不处理还是删除等。

#以state.x77（矩阵）数据为例：
cor(state.x77)
cor(state.x77, method="spearman")
#cov()函数可以用来计算协方差，协方差可以用来衡量两个变量的整体误差
cov(state.x77)

#计算两者之间的相关系数
#x <- states[,c("Population", "Income", "Illiteracy", "HS Grad")]
x <- state.x77[,c(1,2,3,6)]
#y <- states[,c("Life Exp", "Murder")]
y <- state.x77[,c(4,5)]
cor(x,y)#结果看起来会比较整洁

#可以使用“ggm”这个包中的pcor()函数计算偏相关系数
#偏相关系数是指在控制一个或者多个变量时，剩余其他变量之间的相互关系
install.packages("ggm")
library(ggm)
#pcor()函数需要输入两个重要的参数，
#第一个参数是一个数值向量（前两个数值表示要计算相关系数的下标，其余的数值为条件变量的下标），
#第二个参数是cov()函数计算出来的协方差结果
colnames(state.x77)#先获取列名
#控制收入水平、文盲率和高中毕业率的影响，看人口（第一列）和谋杀率（第五列）之间的关系
pcor(c(1,5,2,3,6), cov(state.x77))