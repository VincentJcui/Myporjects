#encoding:utf-8
import sys
import difflib

file1 = sys.argv[1]
file2 = sys.argv[2]


with open(file1,'r') as f:
    file1_list = f.readlines()  #按行读取全文

with open(file1,'r') as f:
    file2_list = f.readlines()


#方法一,形成html对比结果
diff = difflib.HtmlDiff()
html = diff.make_file(file1_list, file2_list)
with open('diff.html','w') as f:
    f.write(html)


#方法二直接比对,生成不同,类似于linux的diff
diff = difflib.Differ()
content = diff.compare(file1_list, file2_list)
for i in content:
    print i