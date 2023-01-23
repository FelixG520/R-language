fit <- lm(weight ~ height, data=women)
coefficients(fit)#列出coefficients项
confint(fit)#模型参数的置信区间
confint(fit,level = 0.5)
fitted(fit)#列出拟合模型的预测值
women$weight-fitted(fit)#残差
residuals(fit)#直接计算残差
women1 <- head(women,6)
predict(fit,women1)#predict()函数可以用拟合模型对新的数据集进行预测
plot(fit)#生成四幅图：残差拟合图、正态分布qq图、大小位置图以及残差影响图
plot(women$height,women$weight)#高度和重量的散点图
#abline()函数可以绘制出拟合曲线
abline(fit)
plot(women$height,women$weight,
     main="Women Age 30-39", 
     xlab="Height (in inches)", 
     ylab="Weight (in pounds)")
# add the line of best fit
abline(fit)#这个命令属于低级绘图命令，必须在高级绘图的基础上完成



#最小二乘法的原理就是找到一条直线（拟合直线），使残差平方和最小
#一般拟合曲线很少是直线，大部分都是曲线，也就是多项式的回归
#还是women这个数据集，我们用多项式回归试一下：
#fit2
fit2 <- lm(weight ~ height + I(height^2), data=women)#将体重作为因变量，身高与身高的平方作为自变量
fit2
summary(fit2)
plot(women$height,women$weight,#可以对比两次回归的曲线差异
     main="Women Age 30-39",
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
lines(women$height,fitted(fit2))
abline(fit)
lines(women$height,fitted(fit2),col="red")#使用lines()函数，这个函数能把点连成线



#三次项的回归模型
# fit3
fit3 <- lm (weight~ height+I(height^2)+I(height^3),data=women)
plot(women$height,women$weight)
lines(women$height,fitted(fit))
lines(women$height,fitted(fit2),col="red")
lines(women$height,fitted(fit3),col="blue")
#结果表明，继续增加多项式可以提高拟合度，但是其实没有必要，
#因为用于拟合的数据集，只是用于建模的数据集，不一定适合真实的数据