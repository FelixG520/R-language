presidents#1949-1974记录美国总统的的支持度
class(presidents)#“ts”是time series的简称，代表时间序列数据
presidents$Qtr1#报错，因为不是数据框类型
airquality#纽约1973.5-1973.9的空气质量状况
class(airquality)#数据框类型
airmiles#1937-1960里程的时间序列

Sys.Date()#显示系统时间
Class(Sys.Date())#Date类
a="2022-08-15"
as.Date(a)#使用as.date()函数将数据转换为日期数据
class(a)#字符类
b=as.Date(a,format="%Y-%m-%d")#使用format选项参数决定外观
class(b)#Date类z
seq(as.Date("2022-08-15"),as.Date("2022-08-28"),by=5)#使用seq()函数创建连续的时间点

#ts()函数可以把向量转化为时间序列数据
sales <- round(runif(48,min=50,max=100)) 
ts(sales,start = c(2010,5),end = c(2014,4),frequency = 1)#年
ts(sales,start = c(2010,5),end = c(2014,4),frequency = 4)#季度
ts(sales,start = c(2010,5),end = c(2014,4),frequency = 12)#月份