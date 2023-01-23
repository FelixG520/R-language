#R内置的数据集——矩阵
iris3
state.x77
heatmap(state.x77)

#创建矩阵
x <- 1:20
m <- matrix(x,nrow=4,ncol=5)#4行5列的矩阵
m <- matrix(1:20,4,5)
matrix(1:20,4,6)#矩阵(1:20,4,6):数据长度[20]不是列数[6]的子倍数或倍数
matrix(1:20,4,4)#20个元素能整除4，可以创建矩阵
matrix(1:20,3,3)#矩阵(1:20,3,3):数据长度[20]不是行数[3]的子倍数或倍数
matrix(1:20,4,byrow=T)#按行排列
matrix(1:20,4,byrow=F)#按列排列

#定义矩阵行和列的名字
rnames <- c("R1","R2","R3","R4")     #行名
cnames <- c("C1","C2","C3","C4","C5")#列名
dimnames(m) <- list(rnames,cnames)

dim(x)#dim——dimension维数的简称
x
dim(x) <- c(4,5)#可以通过dim()函数来对向量添加维数，从而构建矩阵
x

#数组--多维矩阵
dim(x) <- c(2,2,5)#三维数组
dim1 <- c("A1","A2")
dim2 <- c("B1","B2","B3")
dim3 <- c("C1","C2","C3","C4")
z <- array(1:24,c(2,3,4),dimname=list(dim1,dim2,dim3))#array()函数定理三维数组

#R中数据集——数组
Titanic

#矩阵的索引
m <- matrix(1:20,4,5,byrow=T)
m[1,2]#第1行第2列的元素
m[1,c(2,3,4)]#第1行，2，3，4列的元素
m[c(2:4),c(2,3)]#2-4行，2-3列的元素
m[2,]#第2行的元素
m[,2]#第2列的元素
m[-1,2]#去掉第1行，再取第2列
dimnames(m) <- list(rnames,cnames)
m["R1","C2"]#用行名和列名查找元素——注意:名称是字符串要加引号

head(state.x77)#下用R中自带数据集做例子——head()查看矩阵的前几条
state.x77[,"Income"]#表示访问"Income"这一整列
state.x77["Alabama",]#表示访问"Alabama"这一整行

#矩阵的计算
m+1
m+2
m+m

n <- matrix(1:20,5,4)
m+n#行列不一致，无法进行运算
t <- m(1,)
sum(t)#这样计算行(列)和显然很麻烦——R中有关于矩阵计算的函数
colSums(m)#求矩阵的行和
rowSums(m)#求矩阵的列和
colMeans(m)#计算行的平均值
rowMeans(m)#计算列的平均值

n <- matrix(1:9,3,3)
t <- matrix(2:10,3,3)
n*t  #内积——对应位置元素相乘
n%*%t#外积——一般意义上的矩阵乘法
diag(n)#方阵的对角线
t[m]#t()——转置






