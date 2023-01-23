#R获取数据一共有三种途径：
#利用键盘来输入数据
#通过读取存储在外部文件上的数据
#通过访问数据库系统来获取数据
patientID <- c(1, 2, 3, 4)
admdate <- c("10/15/2009","11/01/2009","10/21/2009","10/28/2009")
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
data <- data.frame(patientID, admdate,age, diabetes, status)
data#创建一个数据框

data2 <- data.frame(patientID=character(0), age=numeric(0),
                    diabetes=character(0), status=character(0))
data2 <- edit(data2)#打开数据编辑器
data2
fix(data2)#可以用fix()函数修改

install.packages("RODBC")#Open Database Connectivity
help(package="RODBC")
















