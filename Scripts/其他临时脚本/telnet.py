#encoding:utf-8

#telnet探测端口是否可以成功访问---------------------
import socket
import os

file_obj = (['58.83.171.166','30000'],['58.83.171.166','30000'],['58.83.171.165','8014'],['58.83.171.165','8015'],['211.151.99.69','8014'],['211.151.99.69','8014'])

for line in file_obj:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    ip = line[0]
    port= int(line[1])
    try:
        s.connect((ip,port))
        s.close()
        print ip+":"+str(port)+" open"
    except:
        print ip+":"+str(port)+" close"