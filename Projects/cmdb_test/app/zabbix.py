# encoding:utf-8
# by 2017-03-20
import json
import urllib2
import sys

import re


class Zabbixtools:
    # 初始化,地址,头部信息
    def __init__(self):
        self.url = "http://zabbix.lieyan.com.cn/api_jsonrpc.php"
        self.header = {"Content-Type": "application/json"}
        self.username = 'admin'
        self.password = 'LADYgaga2015'
        self.authID = self.user_login()

    # 用户登陆认证
    def user_login(self):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "user.login",
                "params": {
                    "user": self.username,
                    "password": self.password,
                },
                "id": 0
            }
        )
        request = urllib2.Request(self.url, data)
        for key in self.header:
            request.add_header(key, self.header[key])
        try:
            result = urllib2.urlopen(request)
        except BaseException as e:
            print "登陆失败,请检查您的密码:", e.code
        else:
            ####处理对字符串中出现异常字符的重新编码,解决json.loads报错的问题
            tt = result.read()
            t1 = re.sub(r"(,?)(\w+?)\s*?:", r"\1'\2':", tt)
            t2 = t1.replace("'", "\"")
            #####
            response = json.loads(t2)
            result.close()
            authID = response['result']
            print "登陆成功"
            return authID


if __name__ == "__main__":
    test = Zabbixtools()
    print test
