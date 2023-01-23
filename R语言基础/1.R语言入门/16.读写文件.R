#读写Excel文件——将excel文件另存为csv文件，再使用read.csv()打开
x=read.csv("mtcars-16.csv",header = TRUE)
read.table("clipboard",sep="\t",header = TRUE)#返回剪切板内容

install.packages("XLConnect")#这个包依赖于JAVA，需要有java的环境
library(XLConnect)
?loadWorkbook
#两步读取Excel文件
ex <- loadWorkbook ("data-16.xlsx")#导入要读取的Excel文件
edata <- readWorksheet(ex,1)#读取ex的第一个工作表
edata
head(edata)#默认读取前六行
edata <- readWorksheet(ex,1,startRow=0,starCol=0,endRow=50,endCol=3,header = T)

#一步读取Excel文件
?readWorksheetFromFile
readWorksheetFromFile("data-16.xlsx",1)#读取第一个工作表

#四步写入Excel文件
wb <- loadWorkbook("file-16(1).xlsx",create=TRUE)#loadWorkbook——创建一个工作簿
createSheet(wb,"Sheet 1")#createSheet——在工作簿中创建工作表
writeWorksheet(wb,data=mtcars,sheet = "Sheet 1")#writeWorksheet——将数据保存到工作表中
saveWorkbook()#将工作簿存储为Excel文件

#一步写入Excel文件
writeWorksheetToFile("file.xlsx——16(2)",data = mtcars,sheet = "Sheet 1")
vignette("XLConnect")#XLConnect有很多vignette文档

#Packages xlsx
install.packages("xlsx")
library(xlsx)
help(package="xlxs")
#n——第几个工作表
#startRow——起始行  endRow——终止行
rdata <- read.xlsx("data-16.xlsx",n=1,startRow = 1,endRow = 100)
write.xlsx(rdata,file = "rdata-16.xlsx",sheetName = "Sheet 1",append = F)#append =是否追加写入
