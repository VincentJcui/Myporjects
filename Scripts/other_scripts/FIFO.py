#encoding:utf-8

#先进先出,简单第演示逻辑

works = []
in_put = []
while True:
    in_put = raw_input("please input add or do:")
    if in_put == 'add':
        in_put_work = raw_input('please input works:')
        works.append(in_put_work)
    elif in_put == 'do':
        if not works:
            print "works is null"
        else:
            print works.pop(0)
    elif in_put == 'exit':
        if works:
            print "works has some works %s" % works
        else:
            print "works is finish"
            break