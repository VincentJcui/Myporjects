#encoding:utf-8
import sys
import difflib
reload(sys)
sys.setdefaultencoding('utf-8')

file1 = sys.argv[1]
file2 = sys.argv[2]

with open(file1,'r') as f:
    file1_list = f.readlines()  #按行读取全文

with open(file2,'r') as f:
    file2_list = f.readlines()


#方法一,形成html对比结果,涉及到中文对比,在生产的html中指定了页面的编码,需要手动修改,或者在源码中修改
diff = difflib.HtmlDiff()
html = diff.make_file(file1_list, file2_list)
with open('diff.html','w') as f:
    f.write(html)


#方法二直接比对,生成不同,类似于linux的diff
diff = difflib.Differ()
content = diff.compare(file1_list, file2_list)
for i in content:
    print i