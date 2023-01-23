#在进行相关性分析之后，对相关性进行检验，
#cor.test()函数可用于相关性的检验，该函数有四个比较重要的选项参数，
#其中x和y是需要检测的相关性变量，
#alternative是用来指定进行双侧检验还是单侧检验，
#two.sided代表分别检测正负相关性，greater代表正相关，less代表负相关。
#Method选项用于指定用哪种相关系数，可选的有pearson相关系数、spearman相关系数、kendall相关系数

#用state.x77数据检测一下谋杀率与文盲率之间的关系
cor.test(state.x77[,3],state.x77[,5])#Cor.test()只能一次性检测一组变量的关系
#confidence interval——置信区间,置信区间给出的是被测量参数的测量值的可信程度

#psych包中的corr.test()函数可以一次性进行多个变量的检验，这个函数还可以进行递归操作
install.packages("psych")
library(psych)
corr.test(state.x77)
corr.test(states, use="complete")

#偏相关系数的检验，使用ggm包中的pcor.test()函数，先计算偏相关系数
library(ggm)
x <- pcor(c(1,5,2,3,6),cov(state.x77))
pcor.test(x,3,50)#其中，x是pcor()函数计算的偏相关系数，然后是要控制的变量数，最后就是样本数
#返回三个值，分别是t检验，自由度和p value

#t检验
#t检验使用t分布理论，推论差异分布的概率，从而比较两个平均数的差异是否显著。
#主要用于样本含量较小，一般小于30个，总体标准差未知的正态分布数据
#使用MASS包中的UScrime数据集
library(MASS)
#使用t.test()进行独立样本的t检验，t.test(y~x)，y是一个数值型变量，x是类别型变量
t.test(Prob ~ So, data=UScrime)
#P<0.05，因此可以拒绝南方各州北方各州拥有相同犯罪率的假设

