#encoding:utf-8

from dbutils import MySQLConnection as SQL
from flask import session,redirect
from dbutils import md5_str
import string
from random import choice
from functools import wraps

class User(object):

    def __init__(self,username,password,cname,telphone,email,permission=0):
        self.id = id
        self.username = username
        self.password = password
        self.cname = cname
        self.telphone = telphone
        self.email = email
        self.permission = permission
    @classmethod
    # 定义装饰器函数,为了检查是否处于登陆状态
    def login_check(cls,func):
        @wraps(func)  # 为了解决python多装饰器出现的bug
        def check(*args, **kwargs):
            if session.get('username') is None:
                return redirect('/')
            rt = func(*args, **kwargs)
            return rt  # 返回函数的值

        return check  # 返回内层函数的结果

    @classmethod
    def validate_login(cls,username, password):
        _columns  = ('id','username')
        _sql = 'select * from user where username = %s and password = %s'
        args = (username, md5_str(password))
        sql_count, rt_list = SQL.excute_sql(_sql, args)
        return dict(zip(_columns,rt_list[0])) if sql_count != 0 else None


    @classmethod
    def get_list(cls):
        colloens = ('id', 'username', 'password', 'cname', 'telphone', 'email', 'permission')
        _sql = 'select * from user'
        rt = []
        sql_count, rt_list = SQL.excute_sql(_sql)  # 函数调用
        for i in rt_list:
            rt.append(dict(zip(colloens, i)))
        return rt

    @classmethod
    def get_alone_user(cls,id):
        users = cls.get_list()
        return [i for i in users if i.get('id') == id ]

    @classmethod
    def user_add(cls,params):
        username = params.get('username')
        password = params.get('password')
        cname = params.get('cname')
        telphone = params.get('telphone')
        email = params.get('email')
        permission = params.get('permission', '0')
        _sql_select = 'select * from user where username = %s'
        _sql_insert = 'insert into user(username,password,cname,telphone,email,permission) values(%s,%s,%s,%s,%s,%s)'
        agrs1 = (username,)
        _sql_count, rt_list = SQL.excute_sql(_sql_select, agrs1)
        if _sql_count != 0:
            return False, username + '已存在,请尝试其他的名字'
        args2 = (username, md5_str(password), cname, telphone, email, permission)
        SQL.excute_sql(_sql_insert, args2)
        return True, '添加成功'

    @classmethod
    def user_update(cls,params):
        username = params.get('username')
        id = params.get('id')
        cname = params.get('cname')
        telphone = params.get('telphone')
        email = params.get('email')
        permission = params.get('permission','0')
        _sql = 'update user set cname=%s ,telphone=%s ,email=%s , permission=%s where id=%s and username=%s'
        args = (cname, telphone, email, permission, id, username)
        _sql_count, rt_list = SQL.excute_sql(_sql, args)
        if _sql_count != 0:
            return True, '更新成功'
        return False, '更新失败'

    @classmethod
    def user_del(cls,id, username):
        _sql = 'delete from user where id=%s and username=%s'
        args = (id, username)
        _sql_count, rt_list = SQL.excute_sql(_sql, args)
        if _sql_count != 0:
            return True, '删除成功'
        return False, '删除失败'

    @classmethod
    def valid_change_passwd(cls,uid, upass, muser, mpass):
        if not cls.validate_login(muser, mpass):
            return False, '管理员密码错误'
        if cls.get_alone_user(uid):  # 逻辑有问题,需要看
            return False, '用户不存在'
        if len(upass) < 6:
            return False, '密码长度小于6个字符'
        return True, '验证成功'

    @classmethod
    def change_passwd(cls,uid, upass):
        _sql = 'update user set password = %s where id = %s'
        _args = (md5_str(upass), uid)
        print _args
        _sql_count, rt_list = SQL.excute_sql(_sql, _args)
        if _sql_count:
            return True, '修改成功'
        return False, '修改失败'

    # @classmethod
    # def user_reset(cls,id, username):
    #     _sql = 'update user set password = %s where id=%s and username=%s'
    #     newpassword = ''.join([choice(string.ascii_letters + string.digits) for i in range(8)])
    #     args = (md5_str(newpassword), id, username)
    #     _sql_count, rt_list = SQL.excute_sql(_sql, args)
    #     if _sql_count != 0:
    #         return True, '重置成功', newpassword
    #     return False, '重置失败', newpassword
    #
    # @classmethod
    # def validate_mpass(cls,params):
    #     mgrpass = params.get('mgrpass')
    #     mgruser = 'admin'
    #     ip = params.get('ip')
    #     cmd = params.get('cmd').split('\n')
    #     _sql = 'select * from user where username=%s and password=%s'
    #     _args = (mgruser,md5_str(mgrpass))
    #     _sql_count,rt_list = SQL.excute_sql(_sql,_args)
    #     if _sql_count != 0 :
    #         _ssh = Ssh_cmd(ip,cmd)
    #         return _ssh.ssh_cmd()
    #     return False,'管理员密码验证失败'