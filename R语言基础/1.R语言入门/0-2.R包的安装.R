install.packages()#install.packages()下载R包的函数
install.packages("vcd")#下载包时要加“”，否则报错Error in install.packages : object 'vcd' not found
.libPaths() #显示库所在的位置 
library()   #可显示库里有哪些安装包
install.packages(c("AER","ca"))#下载多个包
update.packages()#更新安装的包