#encoding:utf-8

import socket
import time
import json

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('服务端地址ip或者域名', 8001))
time.sleep(2)

access_key = '服务端定制密钥'
dbname = '要访问的数据库名字'
#select
sql = "select * from OfficeWeb_player where id = %s ;" % '52604'
# sql = "select * from OfficeWeb_player limit 8;"
#update
# sql = "update OfficeWeb_player set email = '%s' where id = %s ;" % ('651085975@651085975.com', '52604')
sock.send('%s,%s,%s' % (dbname, sql, access_key))
datas = sock.recv(1024)
sock.close()
if 'error' in datas:
    print datas
else:
    for i in json.loads(datas):
        print i
