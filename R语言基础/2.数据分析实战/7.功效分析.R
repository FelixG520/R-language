# 在数据分析的筹备阶段，我们应该选择多少样本，在一个分析中，如果样本数量过小，那么就算pvalue值非常小，非常显著，也是不可信的。 
# 功效分析（power analysis）可以帮助在给定置信度的情况下，判断检测到给定效应值时所需的样本量，
# 反过来，它也可以在给定置信度水平的情况下，计算在某样本量内能检测到给定效应值的概率

# 根据要检验的显著性水平、功效和效应值来推算所需要的样品数，R中利用pwr包来进行功效分析。
# 在pwr中包含了多种功效分析的函数，根据不同的假设检验选择不同的函数

install.packages("pwr")
library(pwr)
#线性回归功效分析

#f2效应值越大，样本越小
#v=n-u-1为误差自由度，与样本数和自变量个数相关，误差自由度越高，说明样本越多，方差越大，f2效应值越小，即解释度越小
#u为自变量个数，与误差自由度正相关，即个数越多，所需的样本越多
#power功效，一般小于0.95，但差距不大，排除假阴性的水平之，power越大，v就越大
pwr.f2.test(u=3,sig.level = 0.05,power = 0.9,f2=0.0769)
#结果表明，v=184.2426，也就是说假定显著性水平为0.05，在90%置信度的情况下，至少需要185个受试者才可以



#方差分析功效分析
#k是组的个数
#n是各组样本大小
#f效应值
#sig.level显著性水平
#power功效水平
pwr.anova.test(k=2,f=.25,sig.level=.05,power=.9)
#最终求得n=85.03，所以每一组中至少要有86个样本


# t tests
pwr.t.test(d=.8, sig.level=.05,power=.9, type="two.sample",  
           alternative="two.sided")
pwr.t.test(n=20, d=.5, sig.level=.01, type="two.sample", 
           alternative="two.sided")
# Correlations
pwr.r.test(r=.25, sig.level=.05, power=.90, alternative="greater")

# Tests of proportions
pwr.2p.test(h=ES.h(.65, .6), sig.level=.05, power=.9, 
            alternative="greater")
# Chi-square tests
prob <- matrix(c(.42, .28, .03, .07, .10, .10), byrow=TRUE, nrow=3)
ES.w2(prob)
pwr.chisq.test(w=.1853, df=3 , sig.level=.05, power=.9)