#当预测变量不止一个时，简单现象回归就变成了多元线性回归，相当于求解多元方程，
#而且和方程式求解不同的是，这些变量的权重还不一样，有些大 ，有些小，有些或者是没有多大影响

#以state.x77这个数据集为例——根据某些指标预测出犯罪率
#首先我们将state.x77这个矩阵数据转化成数据框，因为lm()函数输入数据必须是数据框的格式
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
#为了简化问题，我们只取四个指标进行回归分析：population、illiteracy、income、frost
#还是使用一个lm()函数，定义一个fit变量，用于存储模型结果
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
summary(fit)#查看模型的详细过程结果
coef(fit)#单独查看各项的系数，根据系数项和截距值就能写出拟合方程
options(digits = 4)#可以通过options()的digits参数设置显示的位数
coef(fit)


#具有显著交互项的多元线性回归
#在很多研究中，变量会有交互项，也就是变量相互之间并不是独立的，
#交互项就是解释变量之间存在相关性
#例如mtcars数据集，汽车的重量与马力之间存在着交互，质量大会影响到马力。
#拟合mtcars数据集中每加仑汽油行驶里程数（mpg）变量与马力（hp）以及车重（wt）之间的关系
fit <- lm(mpg ~ hp+wt+hp:wt,data = mtcars)
summary(fit)


install.packages("effects")
library(effects)
plot(effect("hp:wt", fit,, list(wt=c(2.2, 3.2, 4.2))), multiline=TRUE)

# AIC——只能比较两种拟合结果
#AIC()函数是An Information Criterion的简称，称为赤池信息准则，这个准则考虑了模型统计拟合度以及用来拟合的参数数目
#计算得到的AIC值越小越好，越小说明模型用较少的参数就可以获得足够的拟合度
fit1 <- lm (Murder ~ Population+Illiteracy+Income+Frost,data=states)
fit2 <- lm (Murder ~ Population+Illiteracy,data=states)
AIC(fit1,fit2)
#结果显示，fit2的拟合度更好，但是如果变量数过多，那么组合起来的拟合模型数将是巨大的，再用AIC()两两比较就不太可行了
#这个时候，对于变量的选择可以使用逐步回归法和全子集回归法

#向后逐步选择
library(MASS)
#MASS包中的stepAIC()函数可以进行逐步回归法的计算
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,
          data=states)
stepAIC(fit, direction="backward")


#所有子集回归
#Leaps包中的regsubsets()函数可以进行全子集回归的计算
install.packages("leaps")
library(leaps)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
leaps <-regsubsets(Murder ~ Population + Illiteracy + Income +
                     Frost, data=states, nbest=4)
plot(leaps, scale="adjr2")




