#R中的概率函数（正态分布）：
#d前缀—概率密度函数；
#P前缀—概率分布函数；
#q前缀—分位数函数（分布函数的反函数）；
#r前缀—产生相同分布的随机数
#在这些分布缩写前面加上d、p、q、r就变成函数
round(rnorm(n=100,mean = 15,sd=2))#生成一组符合正态分布的随机数，这组数据均值为15，标准差为2，总共100个数据
?Geometric
?Hypergeometric
#Norm表示正态分布
x=rnorm(n=100,mean = 15,sd=2)
qqnorm(x)#绘制正态QQ图
#R中如何生成随机数最简单的是runif()函数，可以生成0-1之间的随机数
runif(1)#生成50个0-1之间的随机数
runif(50)
runif(10)*10
#如果想生成0-1之外的随机数，可以通过修改选项参数来更改
runif(50,min=1,max=100)
dgamma(c(1:9),shape = 2,rate = 1)#gamma分布的概率密度——d+gamma 
#Set.seed()函数可以绑定随机数，当输入Set.seed()函数时，回到最初的随机数
set.seed(666)#给一个固定的数可以给第一次生成的随机数绑定
runif(50)
runif(50)
set.seed(666)
runif(50)
