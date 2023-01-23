#美国法官评分的主成分分析
library(psych)
USJudgeRatings
#通过绘制碎石图选择需要的主成分数目
fa.parallel(USJudgeRatings,fa="pc",n.iter = 100)
#R中内置的printcomp()函数可以进行主成分分析
pc <- principal(USJudgeRatings, nfactors=1)#nfactors是主成分因子的数目，rotate是旋转角度，scores表示是否要计算主成分得分，默认为不需要
pc
# pc1栏是指观测变量与主成分的相关系数，如果nfactors=2或者3，那么还会有pc2、pc3等主成分，
# h2栏指成分公因子的方差，是主成分对每个变量的方差解释度，
# u2一栏是成分唯一性，方差不能被主成分解释的比例，
# proportion var表示每个主成分对数据集的解释程度，这里可以看到第一主成分pc1解释了所有变量84%的方差，我们将score参数设置为true，就可以获得每个变量的得分



#主成分分析——Principal components analysis——PCA
pc <- principal(USJudgeRatings,nfactors = 1,scores = TRUE)
pc$scores
#主成分分析Harman23.cor data
#在这个数据集中，数据是由变量的相关系数组成而非原始的数据集，先进行筛选主成分因子，利用平行分析得出碎石图
fa.parallel(Harman23.cor$cov, n.obs=302, fa="pc", n.iter=100,
            show.legend=FALSE, main="Scree plot with parallel analysis")
#只有两个x在y=1之上，所以选择两个主成分因子，接下来进行主成分的分析
#人体测量的主成分分析
library(psych)
PC <- principal(Harman23.cor$cov, nfactors=2, rotate="none")
PC

#正交旋转主成分分析
rc <- principal(Harman23.cor$cov, nfactors=2, rotate="varimax")
rc