install.packages(c("tidyr","dplyr"))
library("tidyr")
tdata <- mtcars[1:10,1:3]#Mtcars数据是很典型的一个tidyr数据
tdata
tdata <- data.frame(name=rownames(tdata),tdata)#取数据的行名生成新的一个数据框（方便处理）
tdata
#gather（data,key,value…..）
#data参数是要处理的数据
#key参数是宽数据变为长数据时，存放需要编码的变量的变量名称，需要自己定义
#value参数是需要数据转换的变量的数值也需要自己定义。
gather(tdata,key = "Key",value = "Value",cyl,disp,mpg)
gather(tdata,key = 'key',value = 'value',cyl:mpg,disp)#将cyl与mpg先合并，然后在和disp组成一个数据框
gather(tdata,key = "Key",value = "Value",mpg,cyl,-disp)#disp单独放在一列中
gather(tdata,key = "Key",value = "Value",2:4)#使用列的索引编号进行数据的重新构造2到4列

#Spread函数则是将合并数据转化成tidyr形式的数据
gdata <- gather(tdata,key='key',value = 'value',2:4)
spread(gdata,key = 'key',value="value")#可以还原数据

#Separate函数可以把一列拆成多个列
df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
separate(df,col = x,into = c('A','B'))#对x这列进行分割，分割成A、B两列，默认识别分隔符
separate(df,col=x,into = c("A","B"))#将数据按照“.”分成两列

df <- data.frame(x = c(NA, "a.b-c", "a-d", "b-c"))#出现多个分隔符而识别出现错误时
separate(df,col = x,into = c('A','B'))#出现多个分隔符而识别出现错误时
separate(df,col = x,into = c("A","B"),sep = "-")#可以利用sep函数指定分隔符，这样就能顺利分列
#x是需要处理的数据
#col是连接后字段的名字
#A,B是需要连接的字段
#sep是用于连接的连接符
unite(x,col ="AB",A,B,sep="-")#可以使用unite函数将分开的列连接起来













































