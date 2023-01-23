#单因素方差分析
# 以multcomp包中的cholesterol数据集为例，
# 这个数据集是50个患者接受降低胆固醇治疗的五种疗法的数据，50个患者分为10人一组，每天服用20克药物
# 这个方案只有治疗方案这一个因子，所以被称为单因素方差分析
install.packages("multcomp")
library(multcomp)
#使用attach()函数将数据集的列写入内存，这样便可以直接使用数据集的每一页，
#而不用每次都使用$来引用数据集，也就是表明以下的命令都在数据集下进行
attach(cholesterol)
cholesterol
table(trt)#计算每一列不同因子的频数
aggregate(response, by=list(trt), FUN=mean)#用aggregate()函数进行分组统计数据的平均值
#aggregate(response, by=list(trt), FUN=sd) 
fit <- aov(response ~ trt,data =cholesterol )#进行方差分析                                 
summary(fit)
#方差分析的结果主要看F值和P值，F值越大说明组间差异越显著，这里就是五组之间平均值的差别，
#而P值只是用来衡量F值，P值越小说明F值越可靠
#可以使用plot()函数绘制方差的结果
par(mfrow=c(2,2))
plot(fit)
#再使用lm()函数做一下方差分析，比较一下二者之间的差别
fit.lm <- lm(response~trt,data=cholesterol)
summary(fit.lm)
#线性拟合要求预测变量是数值型，所以当lm()函数的预测变量是因子时，就会将一系列与因子水平相对应的数值型对照变量来代替因子，
#不过P值和F值的意义是不变的

#单因素协方差分析
#选取multcomp包中的litter数据集，其中weight是这个数据集的响应变量
data(litter, package="multcomp")
attach(litter)
litter
table(dose) #使用table()函数统计分组情况
aggregate(weight, by=list(dose), FUN=mean)#然后分组统计一下平均数
fit <- aov(weight ~ gesttime + dose)  #使用方差分析检验一下组间是否有显著的差异                           
#越基础性的效应越需要放在表达式前面，最好首先是协变量，然后是主效应，以此类推
summary(fit)
#F值的检验表明，怀孕时间与幼崽出生的体重有关，控制怀孕时间，
#药物剂量与体重相关，证明药物是有影响的，而不是随机产生的



#双因素方差分析
attach(ToothGrowth)#使用内置的toothgrowth数据集
ToothGrowth
#使用xtabs()函数统计频率，结果是一个二维的列联表
xtabs(~supp+dose)
aggregate(len, by=list(supp,dose), FUN=mean)#分组统计平均数的结果显示，剂量越小，二者的差异越明显
aggregate(len, by=list(supp,dose), FUN=sd)
class(ToothGrowth$dose)
#使用factor()函数将dose这列的数据转化为因子数据，在进行方差分析
dose <- factor(dose)
#两个变量的方差分析再加上两个变量还有交互，所以进行方差分析的时候，应该用*号连接两个自变量
fit <- aov(len~ supp*dose,data=ToothGrowth)
summary(fit)


#使用“HH”包中的interaction.plot()函数可以非常直观的对这个结果进行可视化，而且对任意数据因子涉及的主效应和交互效应都进行了展示：
install.packages("HH")
library(HH)
interaction.plot(dose, supp, len, type="b", 
                 col=c("red","blue"), pch=c(16, 18),
                 main = "Interaction between Dose and Supplement Type")

#多元协方差分析
library(MASS)
attach(UScereal)#以MASS包中的UScereal数据集为例
UScereal
shelf <- factor(shelf)
y <- cbind(calories, fat, sugars)
##aggregate只能接受一个变量进行分组，所以这里使用cbind()将三个因变量组合成一个数据框
aggregate(y, by=list(shelf), FUN=mean)
cov(y)
fit <- manova(y ~ shelf)#这里有三个因变量，一个自变量
summary(fit)
summary.aov(fit)