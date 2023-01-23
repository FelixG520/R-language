options(digits=2)#首先对数据集进行处理，利用option()函数将数据保留两位小数
library(psych)
covariances <- ability.cov$cov
# 将协方差转换为系数矩阵
correlations <- cov2cor(covariances)
correlations

# 确定要提取的因子的数量
#使用fa.parallel()函数判断参与分析的因子个数，这里我们把选项参数fa设置为‘Both’表示即研究主成分也研究因子分析
#n.obs是观测的数量，也就是样本数，可以通过abilitycov$n.cobs计算得出x
fa.parallel(correlations, n.obs=112, fa="both", n.iter=100,
            main="Scree plots with parallel analysis")
#观察图中结果，显示要提取两个因子。FA分析是看特征值数大于0，pc看特征值数大于1

# 不旋转的主轴因式分解
fa <- fa(correlations, nfactors=2, rotate="none", fm="pa")
fa


# 正交旋转提取因子——两个因子之间不相关
fa.varimax <- fa(correlations, nfactors=2, rotate="varimax", fm="pa")
fa.varimax


# 斜交旋转提取因子——两个因子之间相关
fa.promax <- fa(correlations, nfactors=2, rotate="promax", fm="pa")
fa.promax

# 情节因素的解决方案
factor.plot(fa.promax, labels=rownames(fa.promax$loadings))
fa.diagram(fa.promax, simple=FALSE)

# 因子得分
fa <- fa(correlations,nfactors=2,rotate="none",fm="pa",score=TRUE)
fa.promax$weights
