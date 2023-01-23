#summary()函数
summary(myvars)
#fivenum()函数和summary()函数类似，但可以返回5个基本的统计量，包括最小值，四分位数、中位数、上四位数、最大值
fivenum(myvars$hp)#这里使用了$符取出单个数据列进行统计

#Hmisc包中的describe()函数也可以计算统计量，可以返回变量和观测的数量、缺失值和唯一值的数目、以及平均值、分位数、已经五个最大的值和五个最小的值
install.packages("Hmisc")
library(Hmisc)
myvars <- c("mpg", "hp", "wt")
describe(mtcars[myvars])

#pastecs包中有一个stat.desc()函数可以计算种类繁多的描述性统计量，stat.desc()函数的选项参数中，x是一个数据框或者是时间序列
install.packages("pastecs")
library(pastecs)
stat.desc(myvars)
#如果设置basic选项等于true，那么就会计算一些基本值，包括全部值的数量、空值以及缺失值的数量、最小值、最大值、值域、还有总和
stat.desc(myvars,basic = T)
#如果设置desc选项等于true，那么就会计算一些描述值，包括中位数、平均数、平均数的标准误、平均置信度为95%的置信空间、方差、标准差、以及变异系数等
stat.desc(myvars,desc = T)
#默认情况下，两个选项参数都是T
#如果设置norm为T，那么就会计算一些统计值，包括正态分布统计量、偏度和峰度等
stat.desc(myvars,norm = T)

#psych包中也有一个describe()函数，可以计算非缺失值的数量、平均数、标准差、中位数、截尾的均值、最大值、最小值、偏度和峰度等等内容
#截尾的均值是去掉两头的数据取均值，就像打分时，去掉一个最低分、去掉一个最高分，然后中间数据求均值
install.packages("psych")
#describe()函数可以通过设置trim参数，设置去除比例
library(psych)
describe(mtcars[myvars],trim = 0.1)#trim=0.1，则是去除数据中最高和最低的10%的部分

#当两个包的函数名一样时，后面载入的包的函数会覆盖前面载入的包的函数，如果要使用前面一个包的函数，只需要在包后加冒号再使用即可
Hmisc::describe(mtcars)

#Aggregate()函数可对数据进行分组描述，能够对数据按照指定的分组信息进行统计，将分组信息通过一个列表指定出来即可
install.packages("MASS")
library(MASS)#使用mass这个包中的cars93数据集【93年许多不同汽车的指标】
#以制造商这一列数据为例——根据汽车制造商来对数据进行分组统计，计算每个汽车制造商产品平均的价格
aggregate(Cars93[c("Min.Price","Max.Price","MPG.city")],
          by=list(Manufacturer=Cars93$Manufacturer),mean)
#根据产地
aggregate(Cars93[c("Min.Price","Max.Price","MPG.city")],
          by=list(origin=Cars93$Origin),mean)
#还可以将mean函数替换成其他函数，比如sd，计算数据的标准差
aggregate(Cars93[c("Min.Price","Max.Price","MPG.city")],
          by=list(origin=Cars93$Origin),sd)
#也可以一次性使用多个分组条件，只需要在列表中添加即可，例如同时使用产地和制造商来分组
aggregate(Cars93[c("Min.Price","Max.Price","MPG.city")],
          by=list(origin=Cars93$Origin,Manufacturer=Cars93$Manufacturer),mean)
#aggregate函数的缺点是一次只用使用一个统计函数，比如只能返回平均值、方差等，可以使用一些扩展包来进行分组计算并实现返回多种描述性统计量

#doBy包中的summaryBy()函数，summary_by(data, formula,id = NULL,FUN = mean..)
#在波浪线左侧是需要分析的数值型变量，直接写数据框中的列的名字就可以，不需要添加引号；
#不同变量之间用+号表示；
#右侧的变量是类别型的分组变量；
#data参数指定数据集，fun参数指定统计函数，也可以是自定义函数
install.packages("doBy")
library(doBy)
summaryBy(mpg+hp+wt~am,data=myvars,FUN = mean)
#Fun参数后面可以接多个统计函数
summaryBy(mpg+hp+wt~am,data=myvars,FUN = c(mean,sd,sum))

#Psych包中的describe.by()函数和describe()函数能够计算相同的统计量
#但是describe.by()函数可以通过分组来计算，只需要添加一个分组的列表，直接给定一个list即可
library(psych)
describeBy(mtcars[myvars], list(am=mtcars$am))

#describe.by()适合详细查看每一个分组的统计值，但缺点是给出的统计值是固定不变的，没办法使用自定义的函数
