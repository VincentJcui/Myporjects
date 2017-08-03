#encoding:utf-8
# 远程操作sqllite3的agent
# by 2017-06-21

import socket
import time
import sqlite3
import json
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  #创建socket 第三个参数代表绑定之前让套接字允许地址重用
# sock.settimeout(10)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)  #绑定前调用setsockop函数t让套接字允许地址重用
sock.bind(('0.0.0.0', 8001))   #绑定ip和端口
sock.listen(5)

def sqllite3_execute(db, sql):
    dbpath = "/srv/www/binghun.cn/Website/"
    conn = sqlite3.connect(dbpath+db)
    try:
        c = conn.cursor()
        c.execute(sql)
        conn.commit()
    except BaseException as e:
        print e
    datas = c.fetchall()
    return datas

while True:
    try:
        connection, address = sock.accept()
        try:
            connection.settimeout(5)
            buf = connection.recv(1024)
            if "," in buf:
                db, sql, acces_key = buf.split(',')
                print "Date:%s IP:%s PORT:%s DB:%s SQL:%s" % (
                time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), address[0], address[1], db, sql)
                if acces_key != 'qwertyui@OP':
                    connection.send("access key error ,please reset")
                    continue
                try:
                    datas = sqllite3_execute(db, sql)
                    connection.send(json.dumps(datas))
                except sqlite3.OperationalError,e:
                    connection.send(str(e))
            else:
                connection.send("string format error , not found")
        except socket.timeout:
            print "connect timeout"
            continue
    except KeyboardInterrupt,e:
        print "stop server"
        sock.close()
        break
