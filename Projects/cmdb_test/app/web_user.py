#coding: utf-8
import hashlib

import sys
from flask import render_template, request, jsonify
from . import app
from login_require import login_required
import socket
import time
import json
from utils import util
display = util.Display()
display.display['statics'] = 'block'
dis = display.display


class Web_user(object):
    def __init__(self):
        # self.UID = uid
        self.access_ket = 'qwertyui@OP'
        self.dbname = 'db.sqlite3'
        self.url = '服务端域名或者ip'
        self.port = 8001
        self.sock = None
        self.__conn()
    def __conn(self):
        try:
            self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.sock.connect((self.url, self.port))
            time.sleep(2)
        except socket.AF_INET,e:
            print e

    def md5pass(self, password):
        md5 = hashlib.md5()
        md5.update(password)
        return md5.hexdigest()

    def get_web_user(self,*args):
        if args[0] == 'id':
            sql = "select * from OfficeWeb_player where id='%s';" % args[1]
        elif args[0] == 'nickname':
            sql = "select * from OfficeWeb_player where nickname='%s';" % args[1]
        else:
            return '查询失败'
        self.sock.send('%s,%s,%s' % (self.dbname, sql, self.access_ket))
        datas = self.sock.recv(1024)
        self.cur_close()
        if datas == '[]':
            return
        else:
            coll = ('uid','name','pass','email','ip','photo','info','regist','login','valid')
            return dict(zip(coll, json.loads(datas)[0]))

    def update_web_user(self, password, *args):
        sql = "update OfficeWeb_player set password='{newpass}' where {ttype} = '{tdata}';".format(newpass=self.md5pass(password),ttype=args[0],tdata=args[1])
        self.sock.send('%s,%s,%s' % (self.dbname, sql, self.access_ket))
        datas = self.sock.recv(1024)
        self.cur_close()
        return datas
    def cur_close(self):
        if self.sock:
            self.sock.close()
            self.sock = None

@app.route('/web_user/', methods=['POST', 'GET'])
@login_required
def web_user():
    params = request.args if request.method == 'GET' else request.form
    uid = params.get('uid','')
    nickname = params.get('nickname','')
    web_user = Web_user()
    if uid:
        datas = web_user.get_web_user('id', uid)
        return jsonify(datas=datas)
    elif nickname:
        datas = web_user.get_web_user('nickname', nickname)
        return jsonify(datas=datas)
    else:
        return render_template("web_user/web_user.html", display = dis)

@app.route('/web_update_pass/',methods=['POST'])
@login_required
def update_user():
    params = request.form
    uid = params.get('uid', '')
    nickname = params.get('nickname', '')
    newpass = params.get('newpass')
    web_user = Web_user()
    newdata = {}
    if uid:
        type_sel = 'id'
        type_data = uid
    elif nickname:
        type_sel = 'nickname'
        type_data = nickname
    else:
        newdata['error'] = '修改失败'
    dates = web_user.update_web_user(newpass, type_sel, type_data)
    if dates:
        web_user = Web_user()
        newdata['success'] = web_user.get_web_user(type_sel, type_data)
    else:
        newdata['success'] = '修改失败'
    return jsonify(newdata=newdata)