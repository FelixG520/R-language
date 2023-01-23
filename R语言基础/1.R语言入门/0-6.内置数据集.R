help(package="datasets")#在help窗口列出数据集-The R Datasets Package

data()#直接列出数据集，每个数据集后有标注的作用
data(package="MASS")#MASS包里的数据集-Data sets in package ‘MASS’
data(package=.packages(all.available = TRUE))#显示R中所有可用的数据集
data(Chile,package = "car")#不加载R包直接使用数据集(Chile中的car数据集)

rivers#直接输入数据集的名字就可以使用这个数据集(北美141条河流的长度)
rivers <- c(1,2,3)#如果变量名与数据集名重复，数据集就会被顶替掉
data("rivers")#重新调用数据集就可继续使用
rivers

help("mtcars") #使用help()函数显示每个数据集的具体内容

names(euro) #names()出现向量的属性信息(欧元汇率)

state <- data.frame(state.name,state.abb,state.area,state.division,state.region)#frame()函数将这5个数据构成一个数据框

heatmap(volcano) #将volcano数据集绘制出来(某火山区的地理信息10*10的网格)

Titanic #泰坦尼克成员统计-是一个数组

UCBAdmissions #伯克利分校1973年院系、录取和性别的频数

crimtab #3000个男性罪犯左手中指长度和身高关系

HairEyeColor #592人头发颜色、眼睛颜色和性别的频数

occupationalStatus #英国男性父子职业联系

Harman23.cor #305个女孩八个形态指标的相关系数矩阵
