#编写函数就是为了减少重复代码的书写，从而让脚本更加简洁高效，增加可读性
#在R中，如果直接写函数不加括号，就会显示函数的源代码
cor

#R函数需要包括函数名称、函数声明、函数参数、函数体
myfun <- function(选项参数)
{
  函数体
}


#编写一个简单的R函数计算偏度和峰度值
#偏度（skewness），是统计数据分布偏斜方向和程度的度量，是统计数据分布非对称程度的数字特征
#峰度（peakness; kurtosis），又称峰态系数，表征概率密度分布曲线在平均值处峰值高低的特征数
mystats <- function(x,na.omit=FALSE) {#第一个选项参数x就是要计算的数据，是一个数值向量，第二个选项是na.omit，用于删除缺失值，默认取值为False，然后是大括号，用于写函数的主体
  if(na.omit) 
    x <- x[!is.na(x)]#如果有缺失值，那么x只取不包含缺失值的x的值，！是取反的意思，is.na()是取数据集中的缺失值
  m <- mean(x)#m为数值向量x的平均值
  n <- length(x)#n为数值向量x的长度
  s <- sd(x)#s为数值向量x的标准差
  skew <- sum((x-m^3/s^3))/n#计算skew（偏度）的公式
  kurt <- sum((x-m^4/s^4))/n-3#计算峰度的公式
  ##return函数返回函数的值
  return(c(n=n,mean=m,stdev=s,skew=skew,kurtosis=kurt))#这里我们要输出的是向量的个数n，平均值m，标准差s，偏度值和峰度值
}



#R中的循环控制函数
#循环的三部分：条件判断，是真是假，用于循环执行的结构，表达式
#for循环：
for (i in 1:10) {print ("Hello,World")}
#for ($i=1;$i<=10;$++) {print "hello,world\n";}
#while循环：分号；表示一个语句完结
i=1;while(i <= 10) {print ("Hello,World");i=i+1;}
i=1;while(i <= 10) {print ("Hello,World");i=i+2;}
#if else的结构：可以简写ifelse
score=70;if (score >60 ) {print ("Passwd") } else {print ("Failed")}
ifelse( score >60,print ("Passwd"),print ("Failed"))
#switch循环：
centre <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}
x <- rcauchy(10)
centre(x, "mean")
centre(x, "median")
centre(x, "trimmed")