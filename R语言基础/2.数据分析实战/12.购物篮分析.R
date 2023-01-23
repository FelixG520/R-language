#使用arules包以及groceries数据集进行演示
install.packages("arules")
library(arules)
data(Groceries)
Groceries
#由于这个数据没有办法直接在r中展示出来，我们需要使用inspect()函数查看数据集的内容，展现出来的效果是类似于商品小票一样的数据
inspect(Groceries)#用inspect()函数查看给出的规则
#使用arules包中的apriori()函数进行分析建模，这个函数就相当于线性回归分析中的lm()或者是aov()函数，是关联规则挖掘算法
fit <- apriori(Groceries,parameter = list(support=0.01,confidence=0.5))##Support=0.01表示最小支持度是0.01，confidence=0.5代表最小置信度是50%
summary(fit)
inspect(fit)






#结果表明，在酸奶出现的地方，购物小票中就一定会出现纯牛奶，支持度达到了0.01，说明两者的关联很强