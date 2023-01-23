#R语言四大作图系统：基础绘图系统、lattice包、ggplot2包、grid包
demo(graphics)#显示出R内置绘图函数可以做的一些图
ls("package:graphics")
help(package=graphics)
#plot()函数可以接受一个单独的数值向量
plot(women$height)
plot(women$height,women$weight)
#如果输入的数据是因子，绘制出来的则是直方图
plot(as.factor(women$height))
plot(mtcars$cyl)#直接绘图就是散点图
plot(as.factor(mtcars$cyl))#转换为因子数据输入就是直方图
plot(as.factor(mtcars$cyl),mtcars$carb)#如果输入数据是一个因子数据和一个数值数据，则是箱线图
plot(mtcars$carb,as.factor(mtcars$cyl))#输入第一个是数值数据，第二个是因子，输出的是散列图
plot(as.factor(mtcars$cyl),as.factor(mtcars$carb))#如果两个输入数据都是因子，输出的就是棘状图

#Plot()函数还可以接受函数公式
plot (women$height~ women$weight)#输出的是二者的关系图
#用plot()函数直接绘制线性回归的结果
fit <- lm(height~ weight,data=women)#fit的值是线性回归的结果
plot(fit)
#Plot()函数支持多种属性的数据格式
methods(plot)

#Par()并不能直接接用来绘图，而是对绘图参数进行调整
par()#直接敲par()，会跳出关于绘图的所有参数设置
?par
plot(as.factor(mtcars$cyl),col=c("red","green","blue"))#绘制mtcars数据的因子数据图时，加上颜色
