library(vcd)#载入vcd这个包，library(package)载入扩展包
require(vcd)#和library()用法相同
help(package="vcd")#列出包的帮助文档
library(help="vcd")#列出包的基础内容
ls("package:vcd")#列出包中的所有函数
data(package="vcd")#列出R包包含的所有数据集
detach("package:vcd")#将包移除，想要使用需要重新加载
vcd
remove.packages("package")#删除软件包，从硬盘上彻底删除

#如果换了设备，如何在另一台设备上安装自己已经安装的包呢？
installed.packages()#列出已安装的R包
Rpack <- installed.packages()[,1]#表示列出第一列，即软件包的名字
save(Rpack,file="Rpack.Rdata")#将软件包的名字保存到一个文档，并用另一台设备打开
#使用for循环安装已保存的文档里的软件包，这样就把旧设备上的包安装到了新设备上，如果新设备上有重复的软件包，会自动跳过这些已安装过的包
for(i in Rpack) install.packages(i)

