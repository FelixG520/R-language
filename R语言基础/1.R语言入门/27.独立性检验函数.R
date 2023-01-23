#独立性检验是根据频数信息判断两类因子彼此相关或相互独立的假设性检验，
#所谓独立性就是指变量之间是独立的，没有关系
#根据分组计算的频数表就可以进行独立性检验
#卡方检验、Fisher检验、cochan-mantel-haenszel检验

#p-value就是probability的值，它是一个通过计算得到的概率值，
#也就是在原假设为真实，得到最大的或者抄书做得到的检验统计量值的概率。
#一般将p值定位到0.05，当p<0.05时，拒绝原假设（也就是假设成立），p>0.05是不拒绝原假设

#使用arthritis数据集，探究药物治疗有没有成效，检验“treatment”和“improved”是不是相互独立的，
#如果相互独立，说明二者没有关系，药物治疗没有作用，反之则是有效果
library(vcd)
#先使用table()函数计算两者的频数
mytable <- table(Arthritis$Treatment,Arthritis$Improved)
#直接使用chisq.test()函数进行卡方独立检验
chisq.test(mytable)#p值约等于0.0014小于0.05，说明两者不是独立的，两者有关系，治疗是有效果的
#这种待检测的变量之间没有顺序的关系，调整两者的顺序，结果是一样的
mytable <- table(Arthritis$Treatment,Arthritis$Improved)
chisq.test(mytable)

mytable <- table(Arthritis$Sex,Arthritis$Improved)
chisq.test(mytable)

#Fisher精确检验
#Fisher精确检验使用的函数是Fisher.test()，同样是进行独立性检验，但是与卡方检验不同的是，
#Fisher精确检验的原假设是：边界固定的列联表中行和列相互独立的。
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
fisher.test(mytable)
#结果为p值约等于0.0013，Fisher检验适合小样本的检验，精度低于卡方检验

#cochan-mantel-haenszel检验
#cochan-mantel-haenszel检验使用的函数是mantelhaen.test()，
#该鲜艳的原假设是两个名义变量在第三个变量的每一层中都是条件独立的。
#这个检验需要三个变量，此处我们来检测一下“treatment”、“sex”以及“improved”之间的关系
#首先计算三个变量的列联表，使用xtabs()计算
mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
mantelhaen.test(mytable)
#结果为p值约等于0.0006，小于0.05，也就说明，药物治疗和改善情况在性别的每一个水平上不独立（因为这里使用了性别做第三层分类量）

#如果调整变量顺序，反映的结果是有差别的：
mytable <- xtabs(~Treatment+Sex+Improved,data = Arthritis)
mantelhaen.test(mytable)
#结果为p值约等于0.14，大于0.05，也就说明，药物治疗和性别在改善情况的每一个水平上独立（因为这里使用了改善情况做第三层分类量）
