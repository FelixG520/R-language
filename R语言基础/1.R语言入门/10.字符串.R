nchar ("Hello World")  #nchar()函数可以用来统计字符串的长度
month.name#12个月份的名字
nchar(month.name)#返回每个月份名字的字符数
length(month.name)#length()返回向量中元素的个数，而nchar返回每个元素字符串的个数返回元素的个数
nchar(c(12,2,345))#将数值向量当作字符串向量处理

paste(c("Everybody","loves","stats"))
paste("Everybody","loves","stats")#将三个字符串合并Paste()函数用于粘贴字符串，将多个字符串合并为一个，默认使用空格分割，
paste("Everybody","loves","stats",sep="-")#也可以通过sep选项参数来设置分隔符
names <- c("Moe","Larry","Curly")
paste(names,"love stats")#向量与字符串的连接是向量和字符串分别连接,类似于乘法分配律

#Substr()函数用于提取字符串，函数的参数分别是一个原始的字符串，一个起始点和一个结束点，返回值是起始点和结束点之间的字符串。
substr(x=month.name,start=1,stop=3)#提取出前三个字符

temp <- substr(month.name,1,3)
toupper(temp)#转化成大写
tolower(temp)#转化成小写

#^表示首字母，\w表示所有小写字母，\U表示所有大写字母，\L表示所有小写字母，1表示只转化1次
gsub("^(\\w)", "\\U\\1",tolower(temp))#在每个元素开头都加了大写U，因为缺少tolower参数
gsub("^(\\w)", "\\U\\1",tolower(temp),perl = TRUE)#每个首字母大写
gsub("^(\\w)", "\\L\\1",toupper(temp),perl = TRUE)#每个首字母小写

#grep()函数可以用于查找字符串
x <- c("b","A+","AC")
grep ("A+",x,fixed=TRUE)#返回匹配元素的下标
grep ("A+",x,fixed=FALSE)#A+表示匹配1到正无穷个字符A，那么“AC”也会入选

#match()函数可以进行字符串匹配
match("AC",x)#返回匹配元素的下标

#strsplit()可进行字符串的分割，这个函数需要两个参数，字符串和分割符
path <- "/usr/local/bin/R"
strsplit(path,"/")#将含/的字符串分割
strsplit(c(path,path),"/")

#两个字符串生成他们的所有组合——笛卡尔集
face <- 1:13
suit <- c("spades","clubs","hearts","diamonds")
outer(suit,face,FUN=paste)
outer(suit,face,FUN=paste,sep="-")