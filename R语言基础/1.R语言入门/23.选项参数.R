#一般函数的选项参数可以分成三个部分：输入控制部分；输出控制部分；调节部分
#file:接一个文件；
#data：输入一个数据框；
#x：代表单独的一个对象，一般都是向量，也可以是矩阵或者列表；
#x和y：代表函数需要输入两个变量；
#x、y、z：函数需要输入三个变量；
#formula：输入的是公式
#na.rm:删除缺失值


#调节参数
#1、根据名字判断选项的作用;
#color选项和明显用来控制颜色 
#select与选择有关 
#font与字体有关
#font.axis就是坐标轴的字体 
#lty 是line type 
#lwd 是line width 
#method 软件算法选项接受哪些参数:
#2、选项接受哪些参数
#main:字符串，不能是向量 
#na.rm:TRUE或者FALSE 
#axis:side参数只能是1到4 
#fig:包含四个元素的向量
ls("package:base")
par()
length(par())
?sum
?read.table
library(scatterplot3d)
?scatterplot3d
?plot
plot(c(1:20),c(seq(1,89,length.out = 20)),type="l",lty=1)
plot(c(1:20),c(seq(1,89,length.out = 20)),type="l",lty=2)

