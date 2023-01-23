#本地读取
setwd(dir="E://高帆的R语言//R语言基础")#修改路径
getwd()#产看当前工作路径
x <- read.table ("input-14.txt")#read.table()函数可以读取一个纯文本文件
x
head(x)#可以使用head()和tail()函数读取文件的前几行或者是后几行数据，默认6行
head(x,n=10)#读取文件的前10行
tail(x)
x <- read.table("E:\高帆的R语言\R语言基础\input-14.txt")#如果不在当前工作目录下，可以使用全路径
x

x <- read.table ("input-14.csv")
x
x <- read.table ("input-14.csv",sep=",")#使用sep可以指定对数据进行分割，使数据格式变得整洁
x
read.csv("input-14.csv")#如果提前知道文件格式，也可以直接用read.csv()进行直接读取
read.fwf("fwf-14.txt",widths = c(2,3,4))#fwf文件要设置宽度width

x <- read.table ("input-14.csv",sep=",",header = TURE)#header=代表在读取数据之后是否将数据的第一行作为变量的名称，而不是当成具体的值来处理，如果是，header=T，不是，header=F
head(x)
read.table ("input-14.txt",skip=5)#skip=表示读取参数时，跳过部分内容——从第6行读取数据
read.table ("input-14.txt",skip=50,nrow=200)#读取第51-250行
#na.strings=用于处理缺失值的信息

#网页读取
x <- read.table("https://codeload.github.com/mperdeck/LINQtoCSV/zip/master",
                header = TRUE)
install.packages("XML")#读取非文本文件——XML
require(XML)#为了用XML里的readHTMLTable函数
#readHTMLTable用于读取网页中的数据
readHTMLTable("https://en.wikipedia.org/wiki/World_population",which=3)#which=3只读取网页中第三个表格的数据

help(package="foreign")#foreign包可以较方便地读取其他统计软件的数据文件，比如SPSS、SAS等数据文件等 
RSiteSearch("Matlab")#网络搜索Matlab
read.table("clipboard",header = T,sep=",")#clipboard——输出剪切板内容
read.table("clipboard",header = T,sep="\t")
readClipboard()#直接读取剪切板的信息

read.table(gzfile("input-14.txt.gz"))#R可以直接读取压缩文件，并不需要解压缩

readLines("input-14.csv",n=15)#readLines——处理不标准的文件格式,n=15限制读取行数
readLines("input-14.txt",n=100)#readLines——处理不标准的文件格式

#scan函数参数
#skip用于指定读取数据时，忽略文件前面的行数
#nlines指定要读取文件中数据的最大行数
#what用于给出要读取的数据的类型，支持的数据类型包括：logical, integer, numeric, complex, character, raw以及list
?scan
world.series <- scan ("http://lib.stat.cmu.edu/datasets/wseries",skip=35,
                      nlines = 23,what = list(year=integer(0),pattern=character(0)))
scan("scan-14.txt",what=list (character(3),numeric(0),numeric(0)))
scan("scan-14.txt",what=list (X1=character(3),X2=numeric(0),X3=numeric(0)))
