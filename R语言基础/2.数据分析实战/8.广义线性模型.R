# 在现实生活中，大部分数据都是无规则分布的，要通过数据分析找到规律。
# 广义线性模型扩展了线性模型的框架，它包含了非正态因变量的分析，
# 在R中可以通过glm()函数进行广义线性回归分析（具体可以参考R语言实战p283）

# 以breslow数据集为例，这个数据集是遭受轻微或严重性癫痫病的病人的年龄和发病数进行的记录
# 响应变量是后八周内癫痫病发病数sumy，预测变量为治疗条件(trt)，年龄(age)以及前八周的基础癫痫病发病数(base)，
# 之所以包含年龄(age)以及发病数(base)，是因为他们对响应变量有潜在的影响，属于协变量，
# 在解释这些协变量之后，才能知道药物治疗对癫痫病的影响

?glm
install.packages("robust")
data(breslow.dat, package="robust")
names(breslow.dat)
summary(breslow.dat[c(6, 7, 8, 10)])
#使用glm()函数进行泊松回归
attach(breslow.dat)
#最佳拟合回归线
fit <- glm(sumY ~ Base + Age + Trt, data=breslow.dat, family=poisson(link="log"))
summary(fit)

#解释模型参数
coef(fit)#使用coef()函数查看回归结果的系数项
exp(coef(fit))#由于泊松回归的系数是对数形式，我们可以再对其取指数
#结果表明，当年龄增加一岁时，平均数的癫痫发病数将乘以1.023，也就是癫痫发病数的期望值将乘以1.023，
#这就代表，年龄的增加与较高的癫痫发病率存在关联

