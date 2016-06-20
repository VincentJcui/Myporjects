#encoding:utf-8

from functools import wraps
from flask import redirect
from flask import session
from app.dbcontrol import dbutil


#定义装饰器函数,为了检查是否处于登陆状态
def login_required(func):
    @wraps(func)       #为了解决python多装饰器出现的bug
    def check(*args,**kwargs):
        if session.get('username') is None:
            return redirect('/')
        rt = func(*args,**kwargs)
        return rt  #返回函数的值
    return check   #返回内层函数的结果


#
def login_user_check(username,password):
    collent = ('id','permission')
    _sql = 'select id,permission from user where username=%s and password=md5(%s)'
    _args = (username,password)
    rt = []
    _sql_count,_rt_list = dbutil.user_select(_sql,_args)
    for i in _rt_list:
        rt.append(dict(zip(collent,i)))
    return _sql_count, rt
