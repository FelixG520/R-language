#进行分组统计，比较不同组之间的差异，这些都要涉及到频数的统计。
#因子是专门用来进行分组的，有因子才能分组，分组之后才能进行频数统计。
# frequency tables

#用as.factor()函数将这列转换为因子数据
cylfactors <- as.factor(mtcars$cyl)
#然后可以使用split()函数对数据进行分组
split(mtcars,mtcars$cyl)
split(mtcars,as.factor (mtcars$cyl))
#还可以使用cut()函数（如果没有明显的分类），cut可以对连续的数据进行切割
num <- 1:100
cut(num,c(seq(0,100,10)))
cut(mtcars$mpg,c(seq(10,50,10)))#对“mpg”这列以步长为10进行分割
#用table()函数进行频数的统计，table()函数可以计算频数表
table(mtcars$cyl)
#cut()函数的结果也可以使用table()来统计
table(cut(mtcars$mpg,c(seq(10,50,10))))
#用频数除以总数就是频率值，R中可以直接使用prop.table()函数计算频率值
prop.table(table(mtcars$cyl))
prop.table (table(cut(mtcars$mpg,c(seq(10,50,10)))))
prop.table(table(mtcars$cyl))*100#频率值*100就是百分比的结果

#二维的数据框进行频率统计——以vcd包中的风湿病数据集（arthritis）为例
library(vcd)
#Arthritis数据集中的“treatment”、“sex”以及“improved”列都可以作为因子数据
head(Arthritis)
table(Arthritis$Treatment,Arthritis$Improved)
#返回的结果是一个二维的列联表，横向是安慰剂组与治疗组的区分，
#每一列分别是“没有效果”、“有一些效果”、“很有效果”的区分
#如果变量太多，我们也可以先使用with()或者是attach()函数先加载数据
with(data = Arthritis,table(Treatment,Improved))
#还可以使用xtabs()函数，这个函数的好处是它的选项参数使用的是formula参数，这样就可以根据需要写成多种公式
xtabs(~ Treatment+Improved,data = Arthritis)#同样是“treatment”以及“improved”列
#ormula参数是可以省略的，结果和with()函数的一致

#还可以使用margin.table()和prop.table()函数分别计算边际频数与比例（边际频率）
x <- xtabs(~ Treatment+Improved,data = Arthritis)
margin.table(x)
#需要给定一个边际值，1或者2,1代表行，2代表列
margin.table(x,1)
#使用prop.table()函数计算比例（边际频率）
prop.table(x,1)
#从边际和比例的计算结果可以看出，有治疗组有51%的比例是效果显著的，
#比边际频数41要大，说明药物是有用的
#再将margin.table()参数换成2，则是按列进行统计
margin.table(x,2)
#addmargin()函数可以直接将边际的和添加到频数表中
addmargins(x)
#addmargin()函数也可单独计算行、列
addmargins(x,1)
addmargins(x,2)
#也可以计算三维的列联表，加多一个参数就可以
xtabs(~ Treatment+Improved+Sex,data = Arthritis)
xtabs
#结果看起来有点乱，这时候我们可以使用ftable()函数，它能将结果转换为一个平铺式的列联表
ftable(mytable) 


