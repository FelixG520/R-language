?write
x=rivers
cat(x)#直接显示到工作栏
write#直接写入到文件里面
?write.table#数据框
?write.csv#写入到csv文件
getwd()#显示当前工作目录
x <- read.table("input-14.txt",header=T)
x
write.table (x,file="E:/高帆的R语言/R语言基础/newfile.txt")#将x写入到新文件中
write.table (x,file="E:/高帆的R语言/R语言基础/newfile2.csv",sep="\t")
write.table (x,file="E:/高帆的R语言/R语言基础/newfile2.csv",sep=",",row.mame=FALSE)#不自动备注行号
write.table (iris,file="E:/高帆的R语言/R语言基础/newfile.txt",append=T)#将iris添加到newfile.txt中

#R可以直接写入压缩文件：
write.table(mtcars,gzfile("newfile.txt.gz"))


write.table (x,file=gzfile (newfile.csv.gz),sep="\t",
             quote=FALSE,append=FALSE,na="NA")
library(foreign)
write.arff()