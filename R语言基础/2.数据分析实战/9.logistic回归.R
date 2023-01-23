# 当通过一系列连续型或类别型预测变量来预测而执行结果变量时，logistic回归时一个非常有用的工具。

# 以affair包中的数据为例
# 先导入数据集，再使用summary()函数做一个简单的统计，之后使用table()函数统计一下出轨的频数，prop.table()函数统计一下频率
install.packages("AER")
data(Affairs, package="AER")
summary(Affairs)
table(Affairs$affairs)
prop.table(table(Affairs$affairs))
prop.table(table(Affairs$gender))#性别的频数

#Logistic回归需要结果是二值型的，所以我们将其转为二值型的结果，定义一个ynaffairs（年度出轨次数）
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair, 
                           levels=c(0,1),
                           labels=c("No","Yes"))#将这个变量转化为因子
table(Affairs$ynaffair)
#ynaffairs就属于二值型的变量，可以进行logistic回归分析了（这一步去其实是把离散值转化为二项分布）
attach(Affairs)
fit <- glm(ynaffair ~ gender + age + yearsmarried + children + 
             religiousness + education + occupation +rating,
           data=Affairs,family=binomial())#使用glm()函数进行logistic回归分析
summary(fit)

#将不显著的变量去除，重新拟合一次
fit1 <- glm(ynaffair ~ age + yearsmarried + religiousness + 
              rating, data=Affairs, family=binomial())
summary(fit1)

# 由于两个回归结果是嵌套关系，可以使用anova对两者进行方差分析，对于广义线性回归，可以使用卡方检验
anova(fit, fit1, test="Chisq")#卡方检验结果值并不显著
#证明两次结果差别不大，证明两次拟合的结果一样好，说明性别、教育程度等不显著变量不会显著的提高方程的预测精度


#解释系数
coef(fit1)
exp(coef(fit1))

# 根据婚姻等级计算婚外情发生的概率
#使用predict()函数根据拟合模型的结果（如此处的fit1）对新数据进行验证
testdata <- data.frame(rating = c(1, 2, 3, 4, 5),
                       age = mean(Affairs$age),
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit1, newdata=testdata, type="response")
testdata

# 按年龄计算婚外情发生的概率
testdata <- data.frame(rating = mean(Affairs$rating),
                       age = seq(17, 57, 10), #17岁到57岁，以10为间隔生成年龄数，相当于一个以10为差值的年龄等差数列。
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit1, newdata=testdata, type="response")
testdata
#结果显示，当其他变量的增长，婚外情的概率将从0.31降到0.10，利用这种方法可以研究每一个预测变量对结果概率的影响
