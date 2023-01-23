#在R中，用NA代表缺失值，NA（not available）是不可用的意思，用于存储缺失信息，
#这里缺失值NA表示没有，但注意不一定就是0，NA是不知道是多少，也可能是0，也可能是任何值，
#缺失值和值为零是完全不同的。

1+NA
NA#本身就未知，加上某个数也是未知
NA==0#无法判断NA有可能是0，有可能不是0还是返回NA

a <- c(NA,1:49)
sum(a)#返回NA
mean(a)#返回NA
sum(a,na.rm = TRUE)#na.rm = TRUE表示跳过缺失的参数
#计算平均值时是以50个总数来计算还是49个总数来计算呢，我们来验证一下这个问题：
mean(a,na.rm = TRUE)#25
mean(1:49)#25跳过的参数不再计入分母，说明是将NA值剔除之后求平均值
mean(1:50)#25.5
is.na(a)#返回逻辑值

#可以在前期数据处理的时候就检查数据集是否存在缺失值，is.na()函数来进行逻辑测试
install.packages("VIM")
library(VIM)
sleep
is.na(sleep)
rowSums(sleep)#查看每一列的缺失值
colSums(sleep)#查看每一行的缺失值

#如果想去除掉数据集中的缺失值，形成一个新的函数，则可以使用na.omit()函数
c <- c(NA,1:20,NA,NA)
c
d <- na.omit(c)
d
is.na(d)
sum(d)
mean(d)
na.omit(sleep)#如果是数据框，就会删除包含缺失值的行

#但是这样处理有一个问题，就是当缺失值超过一半的时候，会对分析结果造成很大的影响，
length(rownames(sleep))         #计算行数length（rownames/colnames）
length(rownames(na.omit(sleep)))

#其他缺失数据：
1/0#Inf——表示正无穷
-1/0#-Inf——表示负无穷
0/0#NaN——代表不可能的值
is.nan(0/0)#用法与is.na()类似
is.infinite(1/0)