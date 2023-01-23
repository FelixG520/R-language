help.start()#打开网页获取帮助
help(sum)#列出sum()函数的信息
?plot    #用?更加方便
args(plot)#直接输出plot函数的参数，不用help查找
example(mean)#给出mean函数的案例
example("mean")#加不加""均可

example(hist) #绘图的案例
demo(graphics)#列出用R绘制的图
help(package="vcd")#列出包的帮助文档 
vignette()#列出有vignette文档的包
??package#??不加载包也可以获取包的信息

help.search("heatmap")#本地搜索
??heatmap#help.search("heatmap")的简写

apropos()   #列出所有包含关键字的内容
apropos("sum")#列出所有包含sum关键字的内容
apropos("sum",mod="function")#用mod调节查出的内容，mod="function"表示只列出函数

RSiteSearch("matlab")#RSiteSearch()打开默认浏览器访问R官网，在官网中进行搜索
